---
layout: post
title:  "Ruxmon meetup"
date:   2026-02-27 18:00:00 +1100
categories: hacking, security
---

## Ruxmon Meetup

Went to the Melbourne Ruxmon meetup [1. Glitter nail polish vs the Evil Maid,
the Story 2. I put CVE in your
CVE](https://www.meetup.com/ruxmon/events/313290893/)

@hoodiePony gave an intersting talk on cirumventing tamper detection

- https://www.vice.com/en/article/itll-take-more-than-glitter-nail-polish-to-stop-snooping/
- https://fahrplan.events.ccc.de/congress/2013/Fahrplan/events/5600.html
- https://boingboing.net/2013/12/31/glitter-nail-polish-is-the-bes-2.html
- https://www.wired.com/2013/12/better-data-security-nail-polish/
- https://mullvad.net/en/blog/how-tamper-protect-laptop-nail-polish
- https://www.anarsec.guide/posts/tamper/
- **Detect Physical Computer Tampering - 🥷 RTP Tech Tips 📡**
  [![
    Detect Physical Computer Tampering - 🥷 RTP Tech Tips 📡
  ](
    http://img.youtube.com/vi/D4xX435nBdg/0.jpg
  )](https://youtu.be/D4xX435nBdg)

similar style of presentation although virtual:

**DEF CON 31 DCGVR Village - hoodiepony - Ghost On The Wire -
DEFCONConference**
[![
  DEF CON 31 DCGVR Village - hoodiepony - Ghost On The Wire - DEFCONConference
](
  http://img.youtube.com/vi/6ATtAmOhdE0/0.jpg
)](https://youtu.be/6ATtAmOhdE0)

## On learning from CVE's

@Snyff ([Pentesterlab.com](https://pentesterlab.com/)) did an interesting talk
on looking at finding new CVE's inside of existing CVE's. The general premise
being that people are publishing CVE's and fixes and often the fixes are not
that good and the code around them is likely to have more security
vulnerabilities. This could lead to having CVE's that are attributed to you!

The talk covered things like

### CVE-2023-28109

[Authorization Bypass Through User-Controlled Key play-with-docker](
https://github.com/play-with-docker/play-with-docker/security/advisories/GHSA-vq59-5x26-h639)

[https://github.com/play-with-docker/play-with-docker/commit/ed82247c9ab7990ad76ec2bf1498c2b2830b6f1a](
https://github.com/play-with-docker/play-with-docker/commit/ed82247c9ab7990ad76ec2bf1498c2b2830b6f1a)

```diff
diff a/handlers/bootstrap.go b/handlers/bootstrap.go
--- a/handlers/bootstrap.go
+++ b/handlers/bootstrap.go
@@ -69,10 +70,10 @@
func Register(extend HandlerExtender) {
  corsHandler := gh.CORS(gh.AllowCredentials(), gh.AllowedHeaders([]string{"x-requested-with", "content-type"}), gh.AllowedMethods([]string{"GET", "POST", "HEAD", "DELETE"}), gh.AllowedOriginValidator(func(origin string) bool {
    if strings.Contains(origin, "localhost") ||
-      strings.HasSuffix(origin, "play-with-docker.com") ||
-      strings.HasSuffix(origin, "play-with-kubernetes.com") ||
-      strings.HasSuffix(origin, "docker.com") ||
-      strings.HasSuffix(origin, "play-with-go.dev") {
+      strings.HasSuffix(origin, ".play-with-docker.com") ||
+      strings.HasSuffix(origin, ".play-with-kubernetes.com") ||
+      strings.HasSuffix(origin, ".docker.com") ||
+      strings.HasSuffix(origin, ".play-with-go.dev") {
      return true
    }
    return false
```

But a better fix would have been to allow the bare/apex domains to match as
well. Better still treat them as a Path/URL and not a string, where you could
do a proper root-domain match.

```diff
+      origin == "play-with-docker.com" ||
+      strings.HasSuffix(origin, ".play-with-docker.com") ||
+      origin == "play-with-kubernetes.com" ||
+      strings.HasSuffix(origin, ".play-with-kubernetes.com") ||
+      origin == "docker.com" ||
+      strings.HasSuffix(origin, ".docker.com") ||
+      origin == "play-with-go.dev" ||
+      strings.HasSuffix(origin, ".play-with-go.dev") {
```

Looking around the change, another issue is found, the match on

`Contains(origin, "localhost")`

opens a bunch of issues around **ANY** url with the term `localhost`

```go
func Register(extend HandlerExtender) {
  corsHandler := gh.CORS(gh.AllowCredentials(), gh.AllowedHeaders([]string{"x-requested-with", "content-type"}), gh.AllowedMethods([]string{"GET", "POST", "HEAD", "DELETE"}), gh.AllowedOriginValidator(func(origin string) bool {
    // ⚠️️ ⚠️ ⚠️️️️️ what about http://localhostpentesterlab.com ???
    if strings.Contains(origin, "localhost") ||
      strings.HasSuffix(origin, ".play-with-docker.com") ||
      strings.HasSuffix(origin, ".play-with-kubernetes.com") ||
      strings.HasSuffix(origin, ".docker.com") ||
      strings.HasSuffix(origin, ".play-with-go.dev") {
      return true
    }
    return false
```

> The learnings:
>
> * Look around the change
> * string matching is hard

### CVE-2024-31860

[Apache Zeppelin Path Traversal vulnerability](
https://github.com/advisories/GHSA-g64r-xf39-q4p5)

```diff
--- zeppelin-server/src/main/java/org/apache/zeppelin/service/NotebookService.java
+++ zeppelin-server/src/main/java/org/apache/zeppelin/service/NotebookService.java
  import static org.apache.zeppelin.scheduler.Job.Status.ABORT;

  import java.io.IOException;
+ import java.net.URLDecoder;
+ import java.nio.charset.StandardCharsets;
  import java.text.ParseException;
  import java.text.SimpleDateFormat;
  import java.time.Instant;
    }

    notePath = notePath.replace("\r", " ").replace("\n", " ");
+
+   notePath = URLDecoder.decode(notePath, StandardCharsets.UTF_8.toString());
+   if (notePath.endsWith("/")) {
+     throw new IOException("Note name shouldn't end with '/'");
+   }
+
    int pos = notePath.lastIndexOf("/");
    if ((notePath.length() - pos) > 255) {
      throw new IOException("Note name must be less than 255");
```

The problem here being that this will prevent directory traversal using `%2e%2e`
by decoding the value. They only decode the value **once** so if we recursively
encode the value with say `%252e%252e` we get past the fix.

```sh
# single encoding
echo "%2e%2e/%2e%2e/etc/passwd" | \
  ruby -r cgi -e 'puts CGI.unescape($stdin.read)'

../../etc/passwd

# double encoding
echo "%252e%252e/%252e%252e/etc/passwd" | \
  ruby -r cgi -e 'puts CGI.unescape($stdin.read)'

%2e%2e/%2e%2e/etc/passwd

# tripple encoding
echo "%25252e%25252e/%25252e%25252e/etc/passwd" | \
  ruby -r cgi -e 'puts CGI.unescape($stdin.read)'

%252e%252e/%252e%252e/etc/passwd

# a recurisve solution (applied to tripple encoding)
 echo "%25252e%25252e/%25252e%25252e/etc/passwd" | ruby -r cgi -e '
def recursive_decode(input)
  decoded = CGI.unescape(input)
  while decoded != input
    input = decoded
    decoded = CGI.unescape(input)
  end
  decoded
end
puts recursive_decode($stdin.read)'

../../etc/passwd
```

> The learnings:
>
> * recursive filtering

### GHSA-8g98-m4j9-qww5

[GHSA-8g98-m4j9-qww5 Taylored webhook validation
vulnerabilities](https://github.com/advisories/GHSA-8g98-m4j9-qww5)

https://github.com/tailot/taylored/commit/57b7634391959dbbdb39b387ac4dc68157cd58a1#diff-67dab5650d08966d480460df1e79b263c9b69a24ebffd30179374a9f6bbc990b

```diff
+ db.get(`SELECT id, patch_id, purchase_token, status, token_used_at
+         FROM purchases WHERE patch_id = ? AND purchase_token = ? AND status = 'COMPLETED'`,

  # -- SNIP --
+
+ db.run(`UPDATE purchases SET token_used_at = CURRENT_TIMESTAMP
+         WHERE id = ?`, [row.id], function(updateErr) {
```

This reduced the attack but did not get rid of it completely, just reduced the
likely hood as there would still be a chance for an attack if timing could work.
The real solution would be to have this in a transaction or a single query get
AND set. This was fixed in

- **[GHSA-vh5j-5fhq-9xwg](https://github.com/advisories/GHSA-vh5j-5fhq-9xwg)**

but NO CVE given - "emotional damage" to the creator

> Lessons learned:
>
> - Replay to race condition

### CVE-2025-12762

[pgAdmin4 vulnerable to Remote Code Execution (RCE) when running in server
mode](https://github.com/advisories/GHSA-w2p4-p4rh-qcm3)

> PosgreSQL allows you to run command when importing data using `"\!"` at the
> start of the line `\! touch /tmp/HACKED`

the fix does not match ALL KINDS OF whitespace in the regex and there is a chance of sneaking the characters between chunks, `\` at the end of one chunk and `!` at beginning of next chunk

[https://github.com/pgadmin-org/pgadmin4/commit/1d397395f75320ca1d4ed5e9ca721c603415e836](
https://github.com/pgadmin-org/pgadmin4/commit/1d397395f75320ca1d4ed5e9ca721c603415e836)

```diff
+    # Look for start-of-line pattern: beginning or after newline,
+    # optional spaces, then backslash
+    pattern = re.compile(br'(^|\n)[ \t]*\\')

  # -- SNIP --
+
+     with open(path, "rb") as f:
+       prev_tail = b""
+       while chunk := f.read(chunk_size):
```

> Lessons Learned:
> - Regular expressions are hard
> - Be greedy when filtering
> - People are watching (other people are watching CVE's and creating CVE's)

### CVE-2024-21643

### CVE-2025-12203

### CVE-2026-25130

### CVE-2026-????

This one intruigued me due to some funky issues with `toLowerCase` but I could not seem to find the exact code here

```sh
git clone git@github.com:github/advisory-database.git

cd advisory-database

ag -l 2026-02-27 advisories/unreviewed/2026/02/ | xargs ag domain

advisories/unreviewed/2026/02/GHSA-hcv4-2wj7-9p5g/GHSA-hcv4-2wj7-9p5g.json
  9:  "details": "Unitree Go2 firmware versions V1.1.7 through V1.1.9 and
  V1.1.11 (EDU) do not implement DDS authentication or authorization for the
  Eclipse CycloneDDS topic rt/api/programming_actuator/request handled by
  actuator_manager.py. A network-adjacent, unauthenticated attacker can join DDS
  domain 0 and publish a crafted message (api_id=1002) containing arbitrary
  Python, which the robot writes to disk under /unitree/etc/programming/ and
  binds to a physical controller keybinding. When the keybinding is pressed, the
  code executes as root and the binding persists across reboots.",

advisories/unreviewed/2026/02/GHSA-j5mf-6rh3-rhgg/GHSA-j5mf-6rh3-rhgg.json
  9:  "details": "CleverTap Web SDK version 1.15.2 and earlier is vulnerable to
  Cross-Site Scripting (XSS) via window.postMessage. The
  handleCustomHtmlPreviewPostMessageEvent function in
  src/util/campaignRender/nativeDisplay.js performs insufficient origin
  validation using the includes() method, which can be bypassed by an attacker
  using a subdomain",

advisories/unreviewed/2026/02/GHSA-jfrq-hj9f-c8qx/GHSA-jfrq-hj9f-c8qx.json
  9:  "details": "CleverTap Web SDK version 1.15.2 and earlier is vulnerable to
  DOM-based Cross-Site Scripting (XSS) via window.postMessage in the Visual
  Builder module. The origin validation in
  src/modules/visualBuilder/pageBuilder.js (lines 56-60) uses the includes()
  method to verify the originUrl contains \"dashboard.clevertap.com\", which can
  be bypassed by an attacker using a crafted subdomain",
```

And even with some AI help it suggested the **CleverTap Web SDK** but the code
is as below and seems unrelated ¯\_(ツ)_/¯

```diff
--- a/lib/controllers/xxxxx.js
+++ b/lib/controllers/xxxxx.js
@@ -94,9 +94,9 @@ module.exports = function (options) {
     host = host.toLowerCase();
     //check that host is from one of these domains
     for (var i = 0; i < allowedDomains.length; i++) {
+      const domainLower = allowedDomains[i].toLowerCase();
       if (
-       host.indexOf(allowedDomains[i], host.length - allowedDomains[i].length)!== -1
+       host === domainLower || host.endsWith("." + domainLower)
       ) {
         return true;
       }
```

The intruigue here is that `toLowerCase` in many languages may convert unicode
to ASCII and the same can be true for when using regular expressions

**In Ruby**

```sh
ruby -e '(0..0x10FFFF).each do |cp|
  next if (0xD800..0xDFFF) === cp         # skip surrogate pairs
  c = [cp].pack("U")                      # convert codepoint to UTF-8 character
  next if c =~ /\A[\x20-\x7e]+\z/         # skip already-ASCII characters
  u = c.upcase; d = c.downcase            # case-fold both directions
                                          # emit if upcase yields ASCII
  puts "U+#{"%04X"%cp} #{c} -> upcase=#{u}" if u != c && u =~ /\A[\x20-\x7e]+\z/
                                          # emit if downcase yields ASCII
  puts "U+#{"%04X"%cp} #{c} -> downcase=#{d}" if d != c && d =~ /\A[\x20-\x7e]+\z/
end'

U+00DF ß -> upcase=SS
U+0131 ı -> upcase=I
U+017F ſ -> upcase=S
U+212A K -> downcase=k
U+FB00 ﬀ -> upcase=FF
U+FB01 ﬁ -> upcase=FI
U+FB02 ﬂ -> upcase=FL
U+FB03 ﬃ -> upcase=FFI
U+FB04 ﬄ -> upcase=FFL
U+FB05 ﬅ -> upcase=ST
U+FB06 ﬆ -> upcase=ST
```

and **In JavaScript**

```sh
node -e 'for (let cp = 0; cp <= 0x10FFFF; cp++) {
  if (cp >= 0xD800 && cp <= 0xDFFF) continue;     // skip surrogate pairs
  const c = String.fromCodePoint(cp);             // convert codepoint to UTF-16 character
  if (/^[\x20-\x7e]+$/.test(c)) continue;         // skip already-ASCII characters
  const u = c.toUpperCase(), d = c.toLowerCase(); // case-fold both directions
                                                  // emit if toUpperCase yields ASCII
  if (u !== c && /^[\x20-\x7e]+$/.test(u))
    console.log(`U+${cp.toString(16).toUpperCase().padStart(4,"0")} ${c} -> toUpperCase=${u}`);
                                                  // emit if toLowerCase yields ASCII
  if (d !== c && /^[\x20-\x7e]+$/.test(d))
    console.log(`U+${cp.toString(16).toUpperCase().padStart(4,"0")} ${c} -> toLowerCase=${d}`);
}'

U+00DF ß -> toUpperCase=SS
U+0131 ı -> toUpperCase=I
U+017F ſ -> toUpperCase=S
U+212A K -> toLowerCase=k
U+FB00 ﬀ -> toUpperCase=FF
U+FB01 ﬁ -> toUpperCase=FI
U+FB02 ﬂ -> toUpperCase=FL
U+FB03 ﬃ -> toUpperCase=FFI
U+FB04 ﬄ -> toUpperCase=FFL
U+FB05 ﬅ -> toUpperCase=ST
U+FB06 ﬆ -> toUpperCase=ST
```

clearly `facebooK.com`, with a Kelvin K is not `facebook.com`

> Lessons Learned
> - Matching is hard
> - Even simple modifications can have security impacts.
> - Don't just look at change, look around it

**Easy Bypasses**

- Bad String Matching
- Case-Sensitivity and Unicode
- SSRF Fix:
  - Check for Redirect Support
  - Check for DNS Rebinding (Time of Check/Time of Use - TOCTOU)
- Directory Traversal Fix:
  - Check for `my/path/roo` against `my/path/root`

Thanks the presenter 🙏

- Louis Nyffenegger
- [𝕏 @snyff](https://x.com/snyff)
- https://www.linkedin.com/in/snyﬀ/@snyﬀ
- louis@pentesterlab.com
- [PentesterLab.com](https://pentesterlab.com/)
- [𝕏 @PentesterLab](https://x.com/PentesterLab)

Book -> [CVE Archeologist's Field Guide: Methodology and lessons from 10 vulnerability analyses](https://www.amazon.com/CVE-Archeologists-Field-Guide-vulnerability/dp/B0GMVXM7S1)

Find vulnerabilities being reported
- https://github.com/github/advisory-database

But I found there is also
