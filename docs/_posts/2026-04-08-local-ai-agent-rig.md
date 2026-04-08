---
layout: post
title:  "Local AI agent rig"
date:   2026-04-08 21:00:00 +1000
categories: ai hardware
---

Something intrigued me about running an Eleven labs clone via
[Quen3-TTS](https://github.com/QwenLM/Qwen3-TTS) on a local raspberry pi 5 and
an GTX card as mentioned by Adam Curry on [No Agenda Episode 1856
1:19:00](https://noagenda.clipgenie.com/episode/0951c853933eaa74cccbe40087a8290a?q=nvidia&t=1%3A19%3A01).
Most recently watching Silicon Valley and building an Alexa skill, I thought it
would be cool to add a Jin Yang voice to say desparaging morning inspiration to
my 15 year old son.

Having a Manning subscription, I though I would look for books about the topic
but didn't find much. There is some books aobut [Domain Specific small language
models](https://www.manning.com/books/domain-specific-small-language-models)
and [CUDA for Deep
learning](https://www.manning.com/books/cuda-for-deep-learning), but not really
much about building a rig.

After being completely confused on Reddit and EBay of what is what, I turned to
YouTube. The most informative was this video with a metaphor for a chef (the
GPU) and counter top (the VRAM) and how it is actually really all about the
VRAM. He did also mention a Ras Pi but recommended it for small AI on the edge.

**Want to Run AI Agents Locally? Here is The Bare Minimum Setup/Build - Daniel
Jindoo**

[![
  Want to Run AI Agents Locally? Here is The Bare Minimum Setup/Build - Daniel
  Jindoo
](
  http://img.youtube.com/vi/P-Fmo_CCIbY/0.jpg
)](https://youtu.be/P-Fmo_CCIbY)

The final recommendation here was probably to go with a **RTX 4060 Ti with 16GB
of VRAM** but once you add the ram, CPU and 2TB of disk it all starts adding
up. And a Mac M4 can do a little bit of it, so maybe I at least start there.

Next up was

**DONT Buy these GPU's for Local AI! (learn from my mistake) - Ai Flux**

[![
  DONT Buy these GPU's for Local AI! (learn from my mistake) - Ai Flux
](
  http://img.youtube.com/vi/ozqorev2_34/0.jpg
)](https://youtu.be/ozqorev2_34)

This was again informative as it overviewed a lot of the rubbish out there but also pointed me to a few resources:

- See what people are building at
  [LlamaBuilds](https://www.llamabuilds.ai/browse)
- for my conference talk idea [wisperflow](https://wisprflow.ai/)

  > **Don’t type, just speak**
  >
  > The voice-to-text AI that turns speech into clear, polished writing in
  > every app.

- **DO THIS** and at ~ < $2/hour probably the most logical place to start, rent in the
  cloud with [https://cloud.vast.ai/](https://cloud.vast.ai/)
- there was also mention of a build on reddit of a multi card setup
  [Reddit/LocalLLaMA](https://www.reddit.com/r/LocalLLaMA/comments/1eqklu0/update_overclocked_3060_12gb_x_4_running/)

I do still have a dream of building a Ras Pi 5 powered AI even if it's not the right thing

**GPU-Powered Private AI on Raspberry Pi 5 – Vulkan Acceleration with RX
6700XT! - Jeffs Pi in the Sky**

[![
  GPU-Powered Private AI on Raspberry Pi 5 – Vulkan Acceleration with RX
  6700XT! - Jeffs Pi in the Sky
](
  http://img.youtube.com/vi/A6T8650QT8A/0.jpg
)](https://youtu.be/A6T8650QT8A)

- [https://www.reddit.com/r/LocalLLaMA/comments/1jr0oy2/howto_building_a_gpu_server_with_8xrtx_4090s_for/](https://www.reddit.com/r/LocalLLaMA/comments/1jr0oy2/howto_building_a_gpu_server_with_8xrtx_4090s_for/)
- [https://a16z.com/building-an-efficient-gpu-server-with-nvidia-geforce-rtx-4090s-5090s/](https://a16z.com/building-an-efficient-gpu-server-with-nvidia-geforce-rtx-4090s-5090s/)

There are more Qwen3 articles and videos to review
- https://medium.com/data-science-collective/high-quality-long-form-tts-with-qwen3-open-weight-models-cdd6e3d00df0

- **How to Clone Voice LOCALLY with Qwen3-TTS with ONE-CLICK Install - AsapGuide**

  [![
    How to Clone Voice LOCALLY with Qwen3-TTS with ONE-CLICK Install - AsapGuide
  ](
    http://img.youtube.com/vi/HvjKkFjDR9c/0.jpg
  )](https://youtu.be/HvjKkFjDR9c)

- **Qwen3-TTS Tutorial: Open-Source Voice Design & Cloning - Thorsten-Voice**

  [![
    Qwen3-TTS Tutorial: Open-Source Voice Design & Cloning - Thorsten-Voice
  ](
    http://img.youtube.com/vi/MOIyC9w1Wi0/0.jpg
  )](https://youtu.be/MOIyC9w1Wi0)

- **Qwen 3 TTS - How to Finetune and Install Locally - Jarods Journey**

  [![
    Qwen 3 TTS - How to Finetune and Install Locally - Jarods Journey
  ](
    http://img.youtube.com/vi/PMzO7N8sIHY/0.jpg
  )](https://youtu.be/PMzO7N8sIHY)

- https://tinycomputers.io/posts/the-real-cost-of-running-qwen-tts-locally-three-machines-compared.html

- **Running Deepseek-R1 671B without a GPU - ServeTheHome**

  [![
    Running Deepseek-R1 671B without a GPU - ServeTheHome
  ](
    http://img.youtube.com/vi/av1eTzsu0wA/0.jpg
  )](https://youtu.be/av1eTzsu0wA)

- amazon instances
  - [https://aws.amazon.com/ec2/instance-types/g4/](https://aws.amazon.com/ec2/instance-types/g4/)
- [https://io.net/blog/gpu-cluster](https://io.net/blog/gpu-cluster)
- [https://greennode.ai/blog/what-is-a-gpu-cluster](https://greennode.ai/blog/what-is-a-gpu-cluster)

and in the end I need a no **beeps** 🔊 version of some training data

**Jian-Yang's Best Moments Silicon Valley Max - HBO Max**

[![
  Jian-Yang's Best Moments | Silicon Valley | Max - HBO Max
](
  http://img.youtube.com/vi/IvJhA8jjcSM/0.jpg
)](https://youtu.be/IvJhA8jjcSM)
