#!/usr/bin/env ruby

# frozen_string_literal: true

# install rqrcode if it is not available
unless system("gem list rqqrcode -i --silent")
  puts "Installing RQRCode ..."
  system("gem install rqrcode")
end
# install image_processing if it is not available
unless system("gem list image_processing -i --silent")
  puts "Installing ImageProcessing ..."
  system("gem install image_processing")
end

require "rqrcode"
require "image_processing/mini_magick"

[
  {
    url: 'https://asf.org.au/projects/paddle-victoria/2024-australian-womens-canoe-polo-team',
    name: "womens",
  },
  {
    url: 'https://asf.org.au/projects/paddle-victoria/2024-australian-u21-womens-canoe-polo-team',
    name: "u21_womens",
  }
].map do |args|
  qr = RQRCode::QRCode.new(args[:url])
  qr.as_png(
    size: 400,
    bit_depth: 1,
    border_modules: 4,
    color_mode: ChunkyPNG::COLOR_GRAYSCALE,
    color: "black",
    file: "out/#{args[:name]}_demo.png",
    fill: :white
  )
  qr_code_image = MiniMagick::Image.open("out/#{args[:name]}_demo.png")
  logo_image = MiniMagick::Image.open("#{args[:name]}_canoe_polo.png")
  updated_logo_image = ImageProcessing::MiniMagick.source(logo_image)
    .resize_and_pad(105, 105, background: "white").call
  composite_qr_code = qr_code_image.composite(updated_logo_image) do |c|
    c.compose "Over"
    c.gravity "center"
    c.colorspace "sRGB"
  end
  File.binwrite(
    "out/#{args[:name]}_logo_qr.png", 
    File.read(composite_qr_code.path, encoding: 'BINARY'),
  )
end
