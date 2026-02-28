---
layout: post
title:  "AI driven collaborative whiteboarding system"
date:   2026-02-16 12:00:00 +1000
categories: ai
---

## Prompt

> if I wanted to build an agent that streamed sound that is being said by one
> of 2 speakers (people) that is about building software - and we want the
> streamed text to near real time have the AI whiteboard the ideas on a
> whiteboard and later build that or augment an existing system with what has
> been drawn on the whiteboard - what are the steps you recommend to build such
> a system? what existing whiteboarding software would be best for the AI to
> easily draw the ideas, augment them as descussed by the speakers and build a
> system based on a block diagram architecture?
>
> build a plan and suggest some tools for the main components like voice
> streaming, voice to system design, whiteboarding, whiteboard to code

## AI response

I'll help you create a comprehensive plan for building this real-time
AI-powered software development assistant. This is a fascinating multi-modal
system that combines voice streaming, AI interpretation, and visual
diagramming.

Let me start by researching the existing landscape and technical approaches for
each component.

Based on this research, I can see this is a sophisticated system with multiple
technical challenges. Before I create the detailed plan, I need to clarify some
key requirements that will significantly impact the architecture and tool
choices.

Asked 4 questions (Deployment, Users, Budget, Integration)

How do you plan to deploy this system?
Desktop/local application
- Runs on user's machine
What's the expected usage pattern?
2 speakers only (as stated)
- Always exactly 2 people
What's your preference for AI service costs?
Cloud APIs (OpenAI, Google)
- Pay-per-use, higher accuracy
Do you need integration with existing tools?
IDE/editor integration
- VS Code, IntelliJ plugins

Perfect! Based on your preferences for a desktop application with 2 speakers,
cloud AI services, and IDE integration, I can now create a focused plan. This
simplifies the architecture significantly while maintaining the core real-time
capabilities.

### Plan: Real-Time AI Software Whiteboard Assistant

**TL;DR:** Build a desktop application that captures audio from 2 speakers,
converts speech to text via cloud APIs, uses AI to interpret software
development discussions, renders ideas on a real-time collaborative whiteboard,
and generates code scaffolding. The system integrates with IDEs and focuses on
pair programming/design sessions.

Steps

1. Audio Capture & Streaming Pipeline
  - Implement WebRTC-based audio capture for 2 microphones using browser APIs
    or Electron
  - Create audio buffer management system (1-3 second chunks for optimal STT
    processing)
  - Add speaker identification using simple audio input selection (left/right
    channels or separate devices)
  - Build WebSocket connection for real-time audio streaming to processing
    backend

2. Speech-to-Text Integration
  - Integrate OpenAI Whisper API for high-accuracy transcription with software
    development vocabulary
  - Implement chunked audio processing pipeline (streaming 2-3 second segments
    for ~3s latency)
  - Add Google Speech-to-Text as fallback with custom vocabulary for technical
    terms
  - Create transcript buffer with speaker attribution and conversation context
    management

3. AI Interpretation Engine
  - Build GPT-4 integration with specialized prompts for extracting software
    architecture concepts
  - Create structured output parser for entities (services, databases, APIs,
    frameworks) and relationships
  - Implement real-time conversation context tracking with sliding window
    approach
  - Add entity resolution and relationship mapping for architectural components

4. Real-Time Whiteboard Implementation
  - Integrate tldraw library for programmatic diagram generation and real-time
    collaboration
  - Create diagram templates for common software patterns (microservices, MVC,
    data flow, etc.)
  - Build shape and connector generation from AI-extracted entities and
    relationships
  - Implement real-time updates as conversation evolves with conflict
    resolution

5. Diagram-to-Code Generation
  - Create architecture pattern recognition from whiteboard state using diagram
    analysis
  - Build code scaffolding generators for common frameworks (React, Express,
    Spring Boot, etc.)
  - Integrate with template engines (Handlebars) for generating project
    structures, configs, and boilerplate
  - Add export capabilities for Infrastructure-as-Code (Terraform, Docker
    Compose, Kubernetes YAML)

6. IDE Integration Layer
  - Develop VS Code extension for launching whiteboard sessions and importing
    generated code
  - Create file watching and project structure integration for augmenting
    existing codebases
  - Build IntelliJ plugin with similar capabilities for Java/Kotlin projects
  - Add project context awareness to improve AI interpretation accuracy

7. Desktop Application Framework
  - Build Electron application with React frontend for cross-platform
    deployment
  - Implement local data persistence with SQLite for session history and
    preferences
  - Create session recording/playback capabilities for review and iteration
  - Add keyboard shortcuts and window management for seamless workflow
    integration

### Verification

#### Manual Testing:

  - Audio capture quality test with 2 speakers in typical dev environment
  - latency measurement: audio → transcript → diagram updates (target <10
    seconds)
  - Accuracy validation: software architecture discussions → correct diagram
    generation

#### Integration Testing:

  - VS Code extension: whiteboard → code import → project compilation
  - Multiple conversation styles: architectural planning, debugging sessions,
    feature design

#### Performance Testing:

Extended conversation sessions (30+ minutes) for memory/performance validation
Real-time responsiveness during rapid conversation changes

### Decisions

**Audio Processing:** Chose OpenAI Whisper API over local deployment for
simplicity and accuracy, with Google STT fallback

**Whiteboard Engine:** Selected tldraw over Excalidraw for better programmatic
control and React integration

**AI Services:** GPT-4 for interpretation over local models due to superior
software development context understanding

**Desktop Framework:** Electron for cross-platform IDE integration capabilities
vs native applications

**Real-time Architecture:** WebSocket-based event streaming vs polling for
responsive diagram updates

The system prioritizes accuracy and ease of development over maximum
performance, making it ideal for focused pair programming and design sessions
while leaving room for future optimization.

## State of Voice to Diagram

Peter Steinberger of [https://openclaw.ai/](https://openclaw.ai/) clearly likes
the ide3a of talking to his code editor as mentioned at time stamp in the
interview with Lex below

**OpenClaw: The Viral AI Agent that Broke the Internet - Peter Steinberger |
Lex Fridman Podcast #491**

[![
  OpenClaw: The Viral AI Agent that Broke the Internet - Peter Steinberger |
  Lex Fridman Podcast #491
](
  http://img.youtube.com/vi/YFjfBk8HI5o/0.jpg
)](https://youtu.be/YFjfBk8HI5o?t=4526)

seems [ExcaliDraw](https://excalidraw.com/) had a text to diagram feature 1
year ago. It sounds like it used [Mermaid](https://mermaid.js.org/) as an
intermediary step to diagram.

**This AI Tool Turns Text Prompts to Diagrams - Aurelius Tjin**
[![
  This AI Tool Turns Text Prompts to Diagrams - Aurelius Tjin
](
  http://img.youtube.com/vi/wUeJcSOXGI8/0.jpg
)](https://youtu.be/wUeJcSOXGI8)

There are others in the space like
[https://www.visily.ai/diagram-ai/](https://www.visily.ai/diagram-ai/) but
driven by text prompts

**Visily's Design Instructions & Deep Design Mode walkthrough - Visily**
[![
  Visily's Design Instructions & Deep Design Mode walkthrough - Visily
](
  http://img.youtube.com/vi/76vg0ADXgTU/0.jpg
)](https://youtu.be/76vg0ADXgTU)

And something that sounds like voice-to-diagram that may be worth looking at
[https://www.synergycodes.com/voice-to-diagram](
https://www.synergycodes.com/voice-to-diagram)

- natural speech input
- Real-time AI processing
- interactive diagram

> **Voice to diagram:** Turn speech into visual diagrams with
> AIEnhance your diagramming app with voice to diagram AI. Add
> accessibility-first features that convert natural speech into professional
> diagrams.

and building STT (Speech-to-text) using amazon
[https://aws.amazon.com/blogs/machine-learning/building-real-time-voice-assistants-with-amazon-nova-sonic-compared-to-cascading-architectures/](
https://aws.amazon.com/blogs/machine-learning/building-real-time-voice-assistants-with-amazon-nova-sonic-compared-to-cascading-architectures/)

> **Amazon Web Services**
> Building real-time voice assistants with Amazon Nova Sonic compared to
> cascading architectures | Amazon Web ServicesAmazon Nova Sonic delivers
> real-time, human-like voice conversations through the bidirectional streaming
> interface. In this post, you learn how Amazon Nova Sonic can solve some of
> the challenges faced by cascaded approaches, simplify building voice AI
> agents, and provide natural conversational capabilities. We also provide
> guidance on when to choose each approach to help you make informed decisions
> for your voice AI projects.

Conversational AI Design - maybe thats the "name" we need to be inspired by
[https://www.designsystemscollective.com/conversational-ai-design-creating-natural-voice-user-interfaces-f45f57ea5b92MediumConversational](
https://www.designsystemscollective.com/conversational-ai-design-creating-natural-voice-user-interfaces-f45f57ea5b92MediumConversational)

> **AI Design:** Creating Natural Voice User InterfacesExplore how to craft
> intuitive, human-like voice interactions that connect users and technology
> through natural language. Learn the…

this is a set of papers on the topic?
[https://www.emergentmind.com/topics/ai-assisted-diagramming-applicationsemergentmind.com](
https://www.emergentmind.com/topics/ai-assisted-diagramming-applicationsemergentmind.com)

> **AI-Assisted Diagramming Apps**
> AI-assisted diagramming apps leverage LLMs, VLMs, and DSLs to automate
> diagram creation, enhance semantic accuracy, and foster human-AI
> collaboration.
