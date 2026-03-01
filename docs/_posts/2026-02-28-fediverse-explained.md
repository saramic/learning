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
