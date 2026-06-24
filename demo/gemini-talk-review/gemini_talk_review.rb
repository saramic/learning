#!/usr/bin/env ruby
# frozen_string_literal: true

unless system("gem list ruby-gemini-api -i --silent 2>/dev/null")
  puts "Installing ruby-gemini-api ..."
  system("gem install ruby-gemini-api")
end

require "gemini"

# ─────────────────────────── Animated Progress ───────────────────────────────

class AnimatedProgress
  BAR_W   = 28
  LABEL_W = 22
  TICK    = 0.055

  PHASES = [
    { label: "Connecting to Gemini", emoji: "🔌", color: "\e[36m", style: :spin  },
    { label: "Uploading video",      emoji: "📤", color: "\e[33m", style: :slide },
    { label: "AI processing",        emoji: "🧠", color: "\e[35m", style: :wave  },
  ].freeze

  BRAILLE = %w[⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏].freeze
  WAVE    = %w[░ ▒ ▓ █ ▓ ▒].freeze

  def initialize
    @phase       = 0
    @stop        = false
    @start_times = {}
    @end_times   = {}
  end

  def start
    @start_times[0] = Time.now
    print "\e[?25l"
    trap("INT") { teardown; print "\e[31m✗  Cancelled\e[0m\n"; exit 1 }
    @thread = Thread.new { animate }
    self
  end

  def advance
    now = Time.now
    @end_times[@phase]   = now
    @phase               = [@phase + 1, PHASES.size - 1].min
    @start_times[@phase] ||= now
  end

  def finish(msg = nil)
    @end_times[@phase] = Time.now
    @stop = true
    @thread&.join
    # Final redraw: all phases shown as done
    print "\e[#{PHASES.size}A"
    PHASES.each_with_index { |ph, i| print "\r\e[K#{done_line(ph, i)}\n" }
    print "\e[?25h\n"
    puts msg if msg
  end

  private

  def teardown
    @stop = true
    @thread&.join
    print "\r\e[K\e[?25h"
  end

  def animate
    f     = 0
    first = true
    until @stop
      print "\e[#{PHASES.size}A" unless first
      PHASES.each_with_index do |ph, i|
        line =
          if i < @phase
            done_line(ph, i)
          elsif i == @phase
            active_line(ph, f)
          else
            pending_line(ph)
          end
        print "\r\e[K#{line}\n"
      end
      $stdout.flush
      first = false
      sleep TICK
      f += 1
    end
  end

  # ── line renderers ──────────────────────────────────────────────────────────

  def done_line(ph, i)
    "\e[32m#{ph[:emoji]}✅  #{ph[:label].ljust(LABEL_W)}  [#{"█" * BAR_W}]  #{elapsed(i)}s\e[0m"
  end

  def active_line(ph, f)
    "#{ph[:color]}#{ph[:emoji]}⬜  #{ph[:label].ljust(LABEL_W)}  #{bar(ph[:style], f)}\e[0m"
  end

  def pending_line(ph)
    "\e[2m#{ph[:emoji]}⬜  #{ph[:label].ljust(LABEL_W)}  [#{"·" * BAR_W}]\e[0m"
  end

  def elapsed(i)
    s, e = @start_times[i], @end_times[i]
    s && e ? format("%.1f", e - s) : "?"
  end

  # ── bar animations ──────────────────────────────────────────────────────────

  def bar(style, f)
    case style
    when :spin
      # braille spinner + lone diamond traversing the bar
      dot = (f / 2) % (BAR_W - 2)
      row = Array.new(BAR_W - 2) { |i| i == dot ? "◆" : "·" }.join
      "[#{BRAILLE[f % BRAILLE.size]} #{row}]"

    when :slide
      # solid block of 7 slides left → right and wraps
      block = 7
      pos   = f % (BAR_W + block)
      row   = Array.new(BAR_W, "░")
      block.times { |i| j = pos - block + i; row[j] = "▓" if j.between?(0, BAR_W - 1) }
      "[#{row.join}]"

    when :wave
      # repeating wave pattern scrolls rightward
      "[#{Array.new(BAR_W) { |i| WAVE[(i - f) % WAVE.size] }.join}]"
    end
  end
end

# ──────────────────────────────── Main ───────────────────────────────────────

video_path  = ARGV[0] || abort("Usage: #{$PROGRAM_NAME} <talk.mp4> <prompt_file>")
prompt_path = ARGV[1] || abort("Usage: #{$PROGRAM_NAME} <talk.mp4> <prompt_file>")

abort("File not found: #{video_path}")  unless File.exist?(video_path)
abort("File not found: #{prompt_path}") unless File.exist?(prompt_path)

PROMPT = File.read(prompt_path)

api_key = ENV["GEMINI_API_KEY"] || abort("Set GEMINI_API_KEY")
client  = Gemini::Client.new(api_key, request_timeout: 600)

puts "\n🎬  Gemini Talk Review — #{File.basename(video_path)}\n\n"

# Estimate upload phase duration (~3 MB/s, minimum 1.5 s)
upload_secs = [File.size(video_path).to_f / (3 * 1_024 * 1_024), 1.5].max

result  = nil
api_err = nil

api_thread = Thread.new do
  begin
    result = client.video.analyze(
      file_path: video_path,
      prompt:    PROMPT,
      model:     "gemini-2.5-flash"
    )
  rescue => e
    api_err = e
  end
end

progress = AnimatedProgress.new.start

sleep 0.6
progress.advance   # connecting → uploading

sleep upload_secs
progress.advance   # uploading → processing

api_thread.join
progress.finish("✅  Analysis complete — #{File.basename(video_path)}")

abort("Error: #{api_err.message}") if api_err

response = result[:response]

if response.success?
  puts response.text
  out = video_path.sub(/\.\w+$/, "_review.md")
  File.write(out, response.text)
  puts "\n💾  Saved → #{out}"
else
  abort("Gemini error: #{response.error}")
end
