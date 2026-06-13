# Analyze tech talk video

using Gemini AI

downscale video for AI processing

```sh
ffmpeg \
  -i input.mp4 \
  -vf "scale=1280:720,fps=1" \
  -c:v libx264 \
  -crf 28 \
  -preset fast \
  -c:a aac \
  -b:a 32k \
  -ac 1 \
  output-ai.mp4
```

process it in Gemini

```sh
node gemini-video-analyzer.js <video.mp4> <api-key> [prompt-file]
```

