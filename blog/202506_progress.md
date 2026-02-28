# Progress June 2025

## look into AI

- [ ] where to keep up to date?
- [ ] command line Aider
    - https://piotrzan.medium.com/5-must-have-command-line-ai-tools-839b0cf95c97
    - https://github.com/Aider-AI/aider
    - https://aider.chat/
- [ ] https://www.warp.dev/
- [ ] what about AI in iTerm2?
- [ ] https://cline.bot/

## MCP

**Why MCP really is a big deal | Model Context Protocol with Tim Berglund -
Confluent Developer**

[![
  Why MCP really is a big deal | Model Context Protocol with Tim Berglund -
  Confluent Developer
](
  http://img.youtube.com/FLpS7OfD5-s/0.jpg
)](https://youtu.be/FLpS7OfD5-s)

```sh
Prompt -> LLM (RAG) -> Response

Host/Agent                     Server
(client)    <--- JSON/RPC --->
                               tools
                               resources
                               prompts
                               ...
                               CAPABILITIES
```

- kind of an overview, why you need MCP's but not too much more

seem a bunch of build videos


**Learn MCP Servers with Python (EASY) - Alejandro AO - Software & Ai**

[![
  Learn MCP Servers with Python (EASY) - Alejandro AO - Software & Ai
](
  http://img.youtube.com/Ek8JHgZtmcI/0.jpg
)](https://youtu.be/Ek8JHgZtmcI)

**MCP Crash Course for Python Developers - Dave Ebbelaar**

[![
  MCP Crash Course for Python Developers - Dave Ebbelaar
](
  http://img.youtube.com/5xqFjh56AwM/0.jpg
)](https://youtu.be/5xqFjh56AwM)

**MCP vs API: Simplifying AI Agent Integration with External Data - IBM Technology**

[![
  MCP vs API: Simplifying AI Agent Integration with External Data - IBM
  Technology
](
  http://img.youtube.com/7j1t3UZA1TY/0.jpg
)](https://youtu.be/7j1t3UZA1TY)

## RAG vs CAG

## AI Agent patterns

**How to Build Effective AI Agents (without the hype) - Dave Ebbelaar**

[![
  How to Build Effective AI Agents (without the hype) - Dave Ebbelaar
](
  http://img.youtube.com/tx5OapbK-8A/0.jpg
)](https://youtu.be/tx5OapbK-8A)

- what is an Agent vs Workflow
- anthropic blog post
    - [Building effective agents - Dec 19, 2024](
      https://www.anthropic.com/engineering/building-effective-agents)
    - Agent - makes decision in how to solve problem vs follow a predefined
      workflow
- Augmentations - make LLM better:
    1. "retrieval" - RAG using vector database - "long term memory"
    2. "Tools" - make API calls etc
    3. "memory" - past interactions
- Workflow
    - "prompt chaining"
        - break down into a number of calls feeding into next call - like a chain.
    - "routing"
        - multiple choice which way to go
    - "parallelization"
        - do in parallell and aggregate prior to output
    - "orghestrator-worker"
        - LLM to decide what to do based on the problem and then send requests
          to do it.
    - "evaluator optimizer"
        - LLM call sent to another LLM to evaluate it
- some more tips on adding these things slowly with guardrails etc.
- links
    - https://www.datalumina.com/data-freelancer
    - https://academy.datalumina.com/genai-launchpad
    - https://github.com/datalumina/datalumina-project-template
    - https://github.com/datalumina/genai-launchpad-chat-example-frontend
        - using Supabase
            - https://supabase.com/docs/guides/self-hosting/docker

**Building AI Agents in Pure Python - Beginner Course - Dave Ebbelaar**

[![
  Building AI Agents in Pure Python - Beginner Course - Dave Ebbelaar
](
  http://img.youtube.com/bZzyPscbtI8/0.jpg
)](https://youtu.be/bZzyPscbtI8)


- [How to Build Agentic AI Systems from Scratch? - Ali Hamza](
  https://medium.com/@ali_hamza/how-to-build-agentic-ai-systems-from-scratch-22c33999df91)
    - Learn to build autonomous AI systems that perceive, reason, and act
      independently with this step-by-step guide.
