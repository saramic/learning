---
layout: post
title:  "Fediverse Explained"
date:   2026-02-28 18:00:00 +1100
categories: Fediverse, ruby, talk idea
---


# Fediverse Talk Idea

_TODO WIP ..._

## “Fediverse as a Transport: Pseudonymous ActivityPub + GitHub-Key Encryption in Ruby”

### core concepts

- Fediverse = message routing + discovery + delivery (ActivityPub)
- Privacy = end-to-end encryption (you add it at the app layer)
- “Anonymous” = realistically “pseudonymous/throwaway identity” (because
  federation typically requires signed HTTP requests)

1. Hook (2 min):

   **“What if Twitter DMs were federated… and you brought your own
   crypto?”**

   Show the final outcome first: you post a weird ciphertext note; your friend
   runs one command and decrypts it.

2. Reality check: Mastodon vs Bluesky (2 min)

   - Mastodon: ActivityPub (fediverse).
   - Bluesky: AT Protocol (different ecosystem).

   Your talk is ActivityPub-focused.

3. Fediverse mental model (5 min)

   Draw 4 boxes:

   Actor (identity + public key)

   Inbox (where others POST Activities)

   Outbox (where you publish)

   Object (Note, Document, etc.)

   Key idea: federation moves JSON activities, not “files”; files are usually URLs + metadata.

4. “Anonymous” posting, honestly (3 min)

   Explain:

   Server-to-server delivery usually uses signatures → not truly anonymous.

   But you can do throwaway pseudonyms:

   generate a new actor + keypair per message or per session

   host it briefly (even on a laptop with a tunnel)

   Threat model disclaimer: pseudonymity ≠ anonymity.

5. Encryption plan (5 min)

   Use your friend’s GitHub SSH public key as the recipient key and encrypt:

   the message text

   optionally a small key file (or any file)

   Best practical tool for this: age (supports SSH recipient keys and is perfect for demos).

   You’ll shell out to age from Ruby.

6. Code walkthrough (8–10 min)

   Three tiny Ruby scripts + one Sinatra receiver:

   `inbox_server.rb` – prints received Activities (your “friend’s server” stand-in)

   `fetch_github_keys.rb` – fetches public SSH keys for a GitHub user

   `encrypt_for_github_key.rb` – encrypts message/file using age + SSH public key

   `send_activitypub_note.rb` – posts Create{Note} to an inbox (local demo first)

7. Final demo (5–10 min)

   You run the sender; friend receives ciphertext in inbox.

   Friend runs decrypt command using their private SSH key.

   Optional: show “attachment” encryption too.

   Repo layout (what you put on screen)
   ```
    fediverse-transport-demo/
      Gemfile
      inbox_server.rb
      scripts/
        fetch_github_keys.rb
        encrypt_for_github_key.rb
        send_activitypub_note.rb
      demo_payloads/
        secret.txt
   ```

   Dependencies
     - Ruby stdlib + sinatra + json
     - External tool: age (one-liner install)
     - macOS: brew install age
     - linux: package manager or releases

Code examples (meetup-friendly)

0. Gemfile

   ```ruby
   # Gemfile
   source "https://rubygems.org"
   gem "sinatra"
   ```

1. “Friend’s inbox” server (Sinatra)

   This simulates a fediverse server inbox so you can demo locally without
   signatures.

   ```ruby
   # inbox_server.rb
   require "sinatra"
   require "json"

   set :bind, "0.0.0.0"
   set :port, 4567

   post "/inbox" do
     payload = request.body.read
     puts "\n=== INBOX RECEIVED ==="
     puts payload
     puts "======================\n"
     status 202
   end

   get "/" do
     "Inbox running. POST ActivityPub to /inbox"
   end
   ```

   Run:

   ```sh
   bundle install
   bundle exec ruby inbox_server.rb
   ```

2. Fetch recipient GitHub SSH keys

   GitHub exposes public keys at https://github.com/<user>.keys.

   ```ruby
   # scripts/fetch_github_keys.rb
   require "net/http"
   require "uri"

   user = ARGV.fetch(0) { abort "Usage: ruby fetch_github_keys.rb <github_user>" }
   uri = URI("https://github.com/#{user}.keys")

   keys = Net::HTTP.get(uri).lines.map(&:strip).reject(&:empty?)
   abort "No keys found for #{user}" if keys.empty?

   puts keys
   ```

   Usage:

   ```sh
   ruby scripts/fetch_github_keys.rb <github_user>
   ```

3. Encrypt a message (or file) for the first GitHub key using age

   This uses the SSH public key line directly as an age recipient (-R).

   ```ruby
   # scripts/encrypt_for_github_key.rb
   require "open3"
   require "tempfile"

   recipient_key = ARGV.fetch(0) {
     abort "Usage: ruby encrypt_for_github_key.rb '<ssh-public-key>' <infile> <outfile>"
   }
   infile = ARGV.fetch(1)
   outfile = ARGV.fetch(2)

   Tempfile.create("recipient") do |f|
     f.write(recipient_key + "\n")
     f.flush

     cmd = ["age", "-R", f.path, "-o", outfile, infile]
     stdout, stderr, status = Open3.capture3(*cmd)
     abort "age failed: #{stderr}" unless status.success?
   end

   puts "Encrypted #{infile} -> #{outfile}"
   ```

   Create a demo secret:

   ``sh
   echo "meet me at 7 behind the bikeshed" > demo_payloads/secret.txt
   ```

   Encrypt it:

   ```sh
   KEY="$(ruby scripts/fetch_github_keys.rb <github_user> | head -n 1)"
   ruby scripts/encrypt_for_github_key.rb "$KEY" demo_payloads/secret.txt demo_payloads/secret.txt.age
   ```

4) Send an ActivityPub Create Note with ciphertext embedded

   For the demo, we’ll embed the ciphertext (armored) in the Note content. age
   output is already safe text.

   ```ruby
   # scripts/send_activitypub_note.rb
   require "json"
   require "net/http"
   require "uri"
   require "securerandom"
   require "time"

   inbox_url = ARGV.fetch(0) { abort "Usage: ruby send_activitypub_note.rb <inbox_url> <ciphertext_file>" }
   ciphertext_file = ARGV.fetch(1)

   ciphertext = File.read(ciphertext_file)

   activity = {
     "@context": ["https://www.w3.org/ns/activitystreams"],
     id: "urn:uuid:#{SecureRandom.uuid}",
     type: "Create",
     actor: "https://example.invalid/actors/throwaway", # pseudonymous placeholder for local demo
     published: Time.now.utc.iso8601,
     object: {
       id: "urn:uuid:#{SecureRandom.uuid}",
       type: "Note",
       attributedTo: "https://example.invalid/actors/throwaway",
       content: "<p>Encrypted message (age):</p><pre>#{ciphertext}</pre>",
       to: ["https://www.w3.org/ns/activitystreams#Public"]
     }
   }

   uri = URI(inbox_url)
   req = Net::HTTP::Post.new(uri)
   req["Content-Type"] = "application/activity+json"
   req.body = activity.to_json

   Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https") do |http|
     res = http.request(req)
     puts "POST #{inbox_url} -> #{res.code}"
   end
   ```

   Send to your local friend inbox:

   ```sh
   ruby scripts/send_activitypub_note.rb http://localhost:4567/inbox demo_payloads/secret.txt.age
   ```

   You’ll see the Activity JSON printed on the “friend” terminal.

   Decryption step (friend side)

   If the friend has the corresponding private SSH key loaded (e.g., their GitHub key), they can decrypt with:

   ```sh
   age -d -i ~/.ssh/id_ed25519 demo_payloads/secret.txt.age
   ```

   That’s your “mic drop”: federated transport + BYO E2E crypto.

   Optional upgrade for the finale (attachment + URL)

   Instead of embedding ciphertext in the post, you can:

   upload secret.txt.age somewhere (even a tiny local HTTP server),

   include an ActivityPub attachment:

   ```json
   "attachment": [{
     "type": "Document",
     "mediaType": "application/octet-stream",
     "name": "secret.txt.age",
     "url": "http://localhost:8000/secret.txt.age"
   }]
   ```

   Then your friend clicks/downloads and decrypts locally.

   “How to make it real fediverse” (one slide, not live)

   Explain: to deliver to actual Mastodon inboxes you’ll need:

   a real Actor URL with public key

   signed HTTP requests (HTTP Signatures / message signatures)

   inbox discovery via WebFinger / actor document

   You can mention there are Ruby libs/gems that help, but keep the live demo tight.

   Suggested demo script (what you literally say/do)

   Start inbox_server.rb (friend).

   Fetch GitHub key: fetch_github_keys.rb.

   Encrypt secret with age.

   Send ActivityPub Create(Note) to /inbox.

   Friend decrypts with age -d.

## Expand to TOR

The simplest model is:

Ruby app stays normal → bind it to 127.0.0.1 → Tor exposes it as an onion
service.
You usually do not need a special Ruby onion library for that. Tor can publish
any local TCP service by mapping an onion port to a localhost port with
HiddenServiceDir and HiddenServicePort.

For file exchange, the easiest off-the-shelf option is OnionShare: it can
anonymously share files, host websites, and chat by starting local web servers
and making them available as Tor onion services.

### Best recommendation for your meetup

Use a two-level story:

**Level 1: “Pure concept”**

- Tiny Sinatra site on a Raspberry Pi or laptop
- Tor exposes it as a .onion
- Your friend opens it in Tor Browser
- You post an encrypted message / download an encrypted file

**Level 2: “No-code convenience option”**

- Mention OnionShare as the production-ready shortcut for anonymous file
  sharing and temporary websites
- Then say your Ruby version shows the same idea with less magic

That gives you both:
- a clean protocol explanation
- a memorable live demo

### What “anonymous” means here

Running an onion service hides the server’s network location from visitors, and
onion services are only reachable over Tor. The Tor Project describes onion
services as services accessible only over Tor, with privacy benefits beyond
ordinary HTTPS.

That said, your app can still deanonymize you if it leaks identifying info in
headers, logs, page content, filenames, or timestamps. Tor’s docs explicitly
warn about web servers revealing identifying information about you, your
computer, or your location.

So for the talk, say “pseudonymous/private hosting” rather than promising
perfect anonymity.

Simplest architecture
```
Friend with Tor Browser
        |
     .onion
        |
      Tor daemon
        |
127.0.0.1:4567
        |
   Sinatra app
```

This is much simpler than “building onion routing into Ruby.”

### Minimal live demo plan

**Demo A: Host a secret page on onion**

1. Start a tiny Sinatra app on 127.0.0.1:4567
2. Configure Tor:
  - HiddenServiceDir
  - HiddenServicePort 80 127.0.0.1:4567
3. Tor generates a .onion hostname in the hidden service directory
4. Open that URL in Tor Browser

**Demo B: Exchange an encrypted file**

On the page, offer:
- a text message encrypted with age
- an encrypted file download
- optional upload form for your friend to send a file back

That ties perfectly into your earlier GitHub-public-key idea.

**Minimal Tor config**

In torrc, you can configure an onion service like this:

```conf
HiddenServiceDir /var/lib/tor/my_demo_service/
HiddenServicePort 80 127.0.0.1:4567
```

That is the standard Tor model for exposing a local service as an onion
service. Tor’s setup docs show this exact pattern.

**Minimal Ruby app**
```ruby
# app.rb
require "sinatra"
require "fileutils"

set :bind, "127.0.0.1"
set :port, 4567

get "/" do
  <<~HTML
    <h1>Secret Onion Drop</h1>
    <p>This page is reachable only through Tor.</p>
    <ul>
      <li><a href="/message.txt.age">Encrypted message</a></li>
      <li><a href="/secret.zip.age">Encrypted file</a></li>
    </ul>
  HTML
end

get "/upload" do
  <<~HTML
    <form action="/upload" method="post" enctype="multipart/form-data">
      <input type="file" name="file" />
      <button type="submit">Upload</button>
    </form>
  HTML
end

post "/upload" do
  tempfile = params.dig("file", :tempfile)
  filename = params.dig("file", :filename)

  halt 400, "No file uploaded" unless tempfile && filename

  FileUtils.mkdir_p("uploads")
  path = File.join("uploads", File.basename(filename))
  File.binwrite(path, tempfile.read)

  "Uploaded #{File.basename(filename)}"
end
```

Then place encrypted files in the same directory:
- `message.txt.age`
- `secret.zip.age`

That alone is a very strong demo.

If you want “library” simplicity

There are two practical answers:

**1) Simplest overall: no Ruby library**

Use:
- sinatra for the site
- Tor daemon for onion hosting
- age for encryption

This is the easiest to explain and the least fragile.

**2) Simplest ready-made app: OnionShare**

OnionShare already does:
- anonymous file sharing
web hosting
- chat
  by launching local web servers exposed as onion services. By default it can
  also protect services with a private key / client authentication.

So if your question is “is there a simple library?”, the honest answer is:

- for Ruby: simplest is usually not a library, but Tor as a sidecar
- for a polished tool: OnionShare is the easiest complete solution

### Raspberry Pi angle

A Raspberry Pi is a very natural fit here because the onion service only needs:

- Tor
- a tiny local web app
- a stable machine left running on the network

Tor’s onion service setup is generic and works by forwarding an onion port to a
local port, so a Pi works fine as long as it can run Tor and your web app.

### Best meetup finale

I’d structure the final demo like this:

Finale script
- “Here’s a normal Sinatra app on localhost.”
- “Now I add three Tor config lines.”
- “Tor gives me a .onion address.”
- “My friend opens it in Tor Browser.”
- “They download secret.txt.age.”
- “They decrypt it with their SSH private key.”
- “Optional: they upload a reply file back through the same onion service.”

That lands really well because it shows:
- federation/decentralization adjacent ideas
- privacy-preserving hosting
- real file exchange
- very little code

**My recommendation**
For your talk, I would not try to combine:
- ActivityPub federation
Tor onion hosting
- file exchange
- end-to-end encryption
  all equally.

That’s too much for one meetup.

Instead, make the main story:

**“A tiny Ruby app served as an onion site, exchanging an encrypted
message/file.”**

Then mention:

- ActivityPub could carry the message metadata/discovery layer
- onion service could host the payload privately
- encryption protects the content end-to-end

That’s a clean narrative.

I can turn this into a complete meetup pack with:

- a 20-minute talk outline,
- exact torrc setup steps,
- a polished Sinatra demo,

and a final live-demo script you can rehearse.

### On MacOS

Ruby + Sinatra for the local web app

Tor daemon to expose that app as an onion service

age for encrypting files/messages before download or after upload

You do not need a special “onion Ruby library” just to host the site. Tor can
publish any local TCP service by mapping an onion port to a localhost port with
HiddenServiceDir and HiddenServicePort. Sinatra is a lightweight Ruby web DSL,
and age is a simple file encryption tool with a Homebrew package on macOS.

**What to install on your Mac**

```sh
brew install tor age
brew install --cask tor-browser
gem install sinatra
```

Homebrew currently provides tor and age for macOS, and Tor Browser is available
as a cask for testing the .onion site locally.

```sh
Project layout
onion-drop/
  app.rb
  files/
  uploads/
  tor-data/
  tor-hidden-service/
```
The Ruby app

This gives you:
- a home page
- a file upload form
- a file list
- a download endpoint
- optional encryption endpoint using age

Save this as app.rb:

```ruby
require "sinatra"
require "fileutils"
require "open3"
require "shellwords"

set :bind, "127.0.0.1"
set :port, 4567

FILES_DIR = File.expand_path("files", __dir__)
UPLOADS_DIR = File.expand_path("uploads", __dir__)

FileUtils.mkdir_p(FILES_DIR)
FileUtils.mkdir_p(UPLOADS_DIR)

helpers do
  def safe_name(name)
    File.basename(name.to_s).gsub(/[^\w.\-]/, "_")
  end

  def all_files
    Dir.children(FILES_DIR).sort
  end

  def uploaded_files
    Dir.children(UPLOADS_DIR).sort
  end
end

get "/" do
  files_html = all_files.map { |f| %(<li><a href="/files/#{f}">#{f}</a></li>) }.join
  uploads_html = uploaded_files.map { |f| %(<li>#{f}</li>) }.join

  <<~HTML
    <h1>Onion Drop</h1>
    <p>This site is intended to be reached over Tor as a .onion service.</p>

    <h2>Available files</h2>
    <ul>
      #{files_html.empty? ? "<li>No files yet</li>" : files_html}
    </ul>

    <h2>Upload a file</h2>
    <form action="/upload" method="post" enctype="multipart/form-data">
      <input type="file" name="file" />
      <button type="submit">Upload</button>
    </form>

    <h2>Encrypt a local file for a recipient</h2>
    <form action="/encrypt" method="post">
      <label>Existing file name:</label><br>
      <input type="text" name="filename" placeholder="secret.txt" /><br><br>

      <label>Recipient public key (age public key or SSH public key):</label><br>
      <textarea name="recipient" rows="4" cols="80"></textarea><br><br>

      <button type="submit">Encrypt</button>
    </form>

    <h2>Uploaded files</h2>
    <ul>
      #{uploads_html.empty? ? "<li>No uploads yet</li>" : uploads_html}
    </ul>
  HTML
end

get "/files/:name" do
  name = safe_name(params[:name])
  path = File.join(FILES_DIR, name)
  halt 404, "Not found" unless File.file?(path)
  send_file path
end

post "/upload" do
  file = params[:file]
  halt 400, "No file uploaded" unless file && file[:tempfile] && file[:filename]

  filename = safe_name(file[:filename])
  dest = File.join(UPLOADS_DIR, filename)
  File.binwrite(dest, file[:tempfile].read)

  "Uploaded #{filename}"
end

post "/encrypt" do
  filename = safe_name(params[:filename])
  recipient = params[:recipient].to_s.strip

  halt 400, "Missing file name" if filename.empty?
  halt 400, "Missing recipient key" if recipient.empty?

  input_path = File.join(FILES_DIR, filename)
  halt 404, "Source file not found" unless File.file?(input_path)

  recipient_file = File.join(Dir.tmpdir, "recipient_#{Process.pid}.txt")
  output_path = File.join(FILES_DIR, "#{filename}.age")

  begin
    File.write(recipient_file, recipient + "\n")

    cmd = ["age", "-R", recipient_file, "-o", output_path, input_path]
    _stdout, stderr, status = Open3.capture3(*cmd)

    halt 500, "age failed: #{stderr}" unless status.success?
  ensure
    File.delete(recipient_file) if File.exist?(recipient_file)
  end

  "Encrypted #{filename} -> #{filename}.age"
end
```

This uses Sinatra for the site and shells out to age, which is usually much
simpler than embedding crypto logic in Ruby for a demo like this. Sinatra
serves routes and static file downloads cleanly, and age is designed as a
composable command-line encryption tool.

Start the Ruby app

From that folder:

```sh
mkdir -p files uploads tor-data tor-hidden-service
echo 'hello from onion land' > files/message.txt
ruby app.rb
```

Then check locally in a normal browser:

```sh
open http://127.0.0.1:4567
```

Tor’s onion-service setup expects your local service to already be listening on
localhost before you map it into the onion service.

Tor config for macOS

Instead of editing a system-wide torrc, use a small project-local config file.
Create torrc-demo:

```conf
DataDirectory ./tor-data
HiddenServiceDir ./tor-hidden-service
HiddenServicePort 80 127.0.0.1:4567
Log notice stdout
```

Those are the key Tor settings: HiddenServiceDir stores the onion hostname and
keys, and HiddenServicePort 80 127.0.0.1:4567 maps the onion site’s port 80 to
your Sinatra app on localhost port 4567. Tor creates the hostname file
automatically inside the hidden-service directory when it starts.

Start Tor

Run this from the same project directory:

```sh
tor -f torrc-demo
```

After Tor starts, print your onion hostname:

```sh
cat tor-hidden-service/hostname
```

The Tor Project’s setup docs say the onion hostname appears in a file named
hostname inside the hidden service directory, and the private keys in that same
directory must be kept secret.

Open it in Tor Browser

Launch Tor Browser and visit the .onion address from:

```bash
cat tor-hidden-service/hostname
```

That is the simplest end-to-end local-macOS setup: your Mac hosts Sinatra on
localhost, Tor publishes it as a .onion, and Tor Browser accesses it.

Encrypt a file for someone

If you already have a recipient public key, paste it into the web form and
click Encrypt.

For example, with a plain age public key, the value looks like:

```
age1ql3z7hjy54pw3hyww5ayyfg7zqgvc7w3j2elw8zmrj2kg5sfn9aqmcac8p
```

The age project documents that style of public key and the normal
encrypt/decrypt workflow.

Decrypt on the recipient side

If the recipient has the matching private key, they can decrypt:

```
age --decrypt -i key.txt files/message.txt.age > message.txt
```

That is the standard age CLI pattern documented by the project.

If you want to use a GitHub SSH public key

For a quick demo, you can fetch a user’s public SSH keys from GitHub’s public
.keys endpoint and use one of them as the recipient text in the form. GitHub
documents SSH keys as the mechanism for connecting/authenticating with GitHub,
and users can add public SSH keys to their accounts.

A tiny helper script:

```ruby
# fetch_github_keys.rb
require "net/http"
require "uri"

user = ARGV.fetch(0)
puts Net::HTTP.get(URI("https://github.com/#{user}.keys"))
```

Run:

```sh
ruby fetch_github_keys.rb SOME_GITHUB_USERNAME
```

Then paste one returned SSH public key into the encrypt form.

The exact “simple meetup demo” flow

Run these in separate terminals:

Terminal 1 — web app

```bash
ruby app.rb
```

Terminal 2 — tor

```bash
tor -f torrc-demo
```

Terminal 3 — inspect onion address
```bash
cat tor-hidden-service/hostname
```

Then:

1. Open the onion URL in Tor Browser.
2. Show message.txt.
3. Paste a recipient key and encrypt it into message.txt.age.
4. Download message.txt.age.
5. Decrypt it on another machine or terminal.

That is probably the cleanest “cool factor vs setup time” version.

What libraries I’d actually use

For your macOS demo, I’d keep it to this:

- Ruby gem: sinatra
- CLI tools: tor, age
- Optional: tor-browser for local testing

I would not add a Tor-specific Ruby library unless you want advanced control of
Tor itself. For simple hosting, Tor already does the onion-service part
directly through config. The Tor docs describe onion services as a Tor-level
service configuration, not something that requires an app framework
integration.

Two practical cautions

First, keep tor-hidden-service/ private. The Tor docs warn that the files in
the hidden-service directory include the onion service keys; if those leak,
someone else can impersonate the service.

Second, don’t over-claim anonymity. Tor hides the network location of the
service, but your app can still leak identifying information through file
names, content, logs, timestamps, or anything you put on the page. Tor’s
support/docs emphasize privacy benefits for onion services, but operational
details still matter.

If you want, I can turn this into a single copy-paste project with a Gemfile,
torrc-demo, and a polished app.rb ready to run on macOS.
