#!/usr/bin/env python3
import subprocess, sys

src = "red_pitaya_roadtest_proposal.md"
out = "red_pitaya_roadtest_proposal.pdf"

with open(src, encoding="utf-8") as f:
    content = f.read()

content = content.replace("🦀", "")
content = content.replace("Ω", r"$\Omega$")
content = content.replace("→", r"$\rightarrow$")

header = "\n".join([
    r"\usepackage{xcolor}",
    r"\definecolor{rp}{HTML}{1a4a8a}",
    r"\definecolor{stripe}{HTML}{eef2f7}",
    r"\usepackage{titlesec}",
    r"\titleformat{\section}{\large\bfseries\color{rp}}{\thesection}{1em}{}",
    r"\titleformat{\subsection}{\normalsize\bfseries\color{rp}}{\thesubsection}{1em}{}",
    r"\usepackage{colortbl}",
    r"\let\oldlongtable\longtable",
    r"\renewcommand{\longtable}{\rowcolors{2}{stripe}{white}\oldlongtable}",
])

cmd = [
    "pandoc",
    "-f", "markdown",
    "--pdf-engine=xelatex",
    "-V", "geometry:top=2.5cm, bottom=2.5cm, left=2.5cm, right=3cm",
    "-V", "mainfont=Georgia",
    "-V", "fontsize=11pt",
    "-V", "colorlinks=true",
    "-V", "linkcolor=NavyBlue",
    "-V", "urlcolor=NavyBlue",
    "-V", f"header-includes={header}",
    "--syntax-highlighting=tango",
    "-o", out,
]

result = subprocess.run(cmd, input=content.encode("utf-8"), capture_output=True)
if result.returncode != 0:
    print(result.stderr.decode(), file=sys.stderr)
    sys.exit(1)
print(f"Written: {out}")
