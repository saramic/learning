#!/usr/bin/env python3
"""Draw the app icon (green sky, two mountains, a yellow trail) as PNGs
without any image libraries: python3 scripts/make-icons.py"""
import struct
import zlib

SKY = (31, 81, 48)
FAR = (120, 160, 110)
NEAR = (240, 240, 230)
TRAIL = (255, 204, 0)


def pixel(x, y):
    # unit square coordinates, y down
    if y > 0.78 - 0.35 * abs(x - 0.3) / 0.3 and y > 0.3 and x < 0.62:
        colour = FAR
    else:
        colour = SKY
    if y > 0.85 - 0.6 * (1 - abs(x - 0.62) / 0.38):
        colour = NEAR
    # zig-zag trail up the near mountain
    tx = 0.62 + 0.12 * ((y * 6) % 2 - 1) * (1 if int(y * 6) % 2 else -1)
    if 0.5 < y < 0.92 and abs(x - tx) < 0.025 and colour == NEAR:
        colour = TRAIL
    return colour


def png(size, path):
    rows = []
    for j in range(size):
        row = bytearray([0])
        for i in range(size):
            row.extend(pixel((i + 0.5) / size, (j + 0.5) / size))
        rows.append(bytes(row))
    raw = zlib.compress(b"".join(rows), 9)

    def chunk(kind, data):
        c = kind + data
        return struct.pack(">I", len(data)) + c + struct.pack(">I", zlib.crc32(c))

    with open(path, "wb") as f:
        f.write(b"\x89PNG\r\n\x1a\n")
        f.write(chunk(b"IHDR", struct.pack(">IIBBBBB", size, size, 8, 2, 0, 0, 0)))
        f.write(chunk(b"IDAT", raw))
        f.write(chunk(b"IEND", b""))


for s in (180, 192, 512):
    png(s, f"public/icons/icon-{s}.png")
    print(f"public/icons/icon-{s}.png")
