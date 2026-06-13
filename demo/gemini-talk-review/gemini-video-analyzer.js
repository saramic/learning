#!/usr/bin/env node

/**
 * Analyzes a local MP4 video using Google Gemini AI.
 *
 * Usage: node gemini-video-analyzer.js <video.mp4> <api-key> [prompt-file]
 */

import { GoogleGenAI } from '@google/genai';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

function loadPrompt(promptFilePath) {
  const resolved = path.isAbsolute(promptFilePath)
    ? promptFilePath
    : path.resolve(__dirname, promptFilePath);

  if (!fs.existsSync(resolved)) {
    throw new Error(`Prompt file not found: ${resolved}`);
  }

  console.log(`Loaded prompt from: ${resolved}`);
  return fs.readFileSync(resolved, 'utf-8');
}

class GeminiVideoAnalyzer {
  constructor(apiKey, prompt) {
    this.client = new GoogleGenAI({ apiKey });
    // this.model = 'gemini-2.5-flash';
    this.model = 'gemini-3.5-flash';
    this.prompt = prompt;
  }

  async uploadVideo(filePath) {
    const stats = fs.statSync(filePath);
    const fileSizeMB = stats.size / (1024 * 1024);
    console.log(`Uploading ${filePath} (${fileSizeMB.toFixed(2)}MB) to Gemini...`);

    if (fileSizeMB > 100) {
      throw new Error('Video file too large. Maximum size is 100MB.');
    }

    const uploadResult = await this.client.files.upload({
      file: filePath,
      config: { mimeType: 'video/mp4' }
    });

    console.log(`Upload complete. URI: ${uploadResult.uri}`);
    return uploadResult;
  }

  async waitForProcessing(fileName) {
    console.log('Waiting for Gemini to process video...');

    const maxAttempts = 60; // 5 minutes max
    for (let attempt = 0; attempt < maxAttempts; attempt++) {
      const file = await this.client.files.get({ name: fileName });
      console.log(`Processing status: ${file.state} (${attempt + 1}/${maxAttempts})`);

      if (file.state === 'ACTIVE') return file;
      if (file.state === 'FAILED') throw new Error('Video processing failed');

      await new Promise(resolve => setTimeout(resolve, 5000));
    }

    throw new Error('Video processing timed out after 5 minutes');
  }

  async analyzeVideo(file) {
    console.log('Sending video to Gemini for analysis...');
    const startTime = Date.now();

    const response = await this.client.models.generateContent({
      model: this.model,
      contents: [
        {
          role: 'user',
          parts: [
            { fileData: { mimeType: file.mimeType, fileUri: file.uri } },
            { text: this.prompt }
          ]
        }
      ],
      config: {
        temperature: 0.3,
        topP: 0.8,
        topK: 40,
        maxOutputTokens: 16384
      }
    });

    console.log(`Analysis completed in ${Date.now() - startTime}ms`);

    if (!response?.text) {
      throw new Error('No text content in Gemini response');
    }

    return response.text.trim();
  }

  async cleanup(fileName) {
    try {
      await this.client.files.delete({ name: fileName });
      console.log(`Deleted uploaded file from Gemini: ${fileName}`);
    } catch (error) {
      console.warn(`Could not delete uploaded file: ${error.message}`);
    }
  }

  async processVideo(filePath) {
    if (!fs.existsSync(filePath)) {
      throw new Error(`Video file not found: ${filePath}`);
    }

    let uploadedFile = null;
    try {
      uploadedFile = await this.uploadVideo(filePath);
      const processedFile = await this.waitForProcessing(uploadedFile.name);
      return await this.analyzeVideo(processedFile);
    } finally {
      if (uploadedFile) await this.cleanup(uploadedFile.name);
    }
  }
}

async function main() {
  const args = process.argv.slice(2);

  if (args.length < 2) {
    console.error(`
Usage: node gemini-video-analyzer.js <video.mp4> <api-key> [prompt-file]

  video.mp4    Local video file to analyse
  api-key      Gemini API key
  prompt-file  Optional path to a prompt .md file (default: PROMPT_TECH_TALK_ANALYSIS.md)

Environment:
  GEMINI_API_KEY  Alternative to passing the api-key argument
    `);
    process.exit(1);
  }

  const [videoPath, apiKeyArg] = args;
  const apiKey = apiKeyArg || process.env.GEMINI_API_KEY;
  const promptFile = args[2] || 'PROMPT_TECH_TALK_ANALYSIS.md';

  if (!apiKey) {
    console.error('API key required. Pass as argument or set GEMINI_API_KEY.');
    process.exit(1);
  }

  const prompt = loadPrompt(promptFile);
  const analyzer = new GeminiVideoAnalyzer(apiKey, prompt);
  const rawResponse = await analyzer.processVideo(videoPath);

  console.log('\n' + '='.repeat(60));
  console.log('ANALYSIS RESULTS:');
  console.log('='.repeat(60) + '\n');

  try {
    console.log(JSON.stringify(JSON.parse(rawResponse), null, 2));
  } catch {
    console.warn('Response is not valid JSON. Raw output:');

    // Attempt to extract JSON if it was wrapped in markdown or has trailing text
    const jsonMatch = rawResponse.match(/\{[\s\S]*\}/);
    if (jsonMatch) {
      try {
        console.log(JSON.stringify(JSON.parse(jsonMatch[0]), null, 2));
        return;
      } catch {
        // fall through to raw output
      }
    }

    console.log(rawResponse);
  }
}

if (import.meta.url === `file://${process.argv[1]}`) {
  main().catch(err => {
    console.error(err.message);
    process.exit(1);
  });
}

export { GeminiVideoAnalyzer };
