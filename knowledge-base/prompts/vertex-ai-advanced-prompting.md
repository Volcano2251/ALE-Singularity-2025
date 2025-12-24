# Vertex AI Advanced Prompting Guide

**Sources:**
*   [Prompt Design Strategies](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/learn/prompts/prompt-design-strategies)
*   [Multimodal Prompts](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/multimodal/design-multimodal-prompts)
*   [Chat Prompts](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/chat/chat-prompts)
*   [Image Generation](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/image/img-gen-prompt-guide)
*   [System Instructions](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/learn/prompts/system-instructions)
*   [Prompt Optimizer](https://docs.cloud.google.com/vertex-ai/generative-ai/docs/learn/prompts/prompt-optimizer)

## Executive Summary
This comprehensive guide covers advanced strategies for prompt engineering on Vertex AI. It moves beyond basic prompting to cover multimodal inputs (text, images, video), chat-specific structures, precise image generation control, and the use of system instructions to define model behavior. It also introduces tools for optimizing and sharing prompts.

## Key Takeaways

### 1. General Prompting Strategies
*   **Workflow:** Prompt engineering is an iterative cycle of testing, refining, and evaluating.
*   **Structure:** Organize prompts clearly using separators (like Markdown headers or XML tags) to distinguish between instructions, examples, and data.
*   **Checklist:** Ensure prompts have a clear task, zero ambiguity, relevant examples (few-shot), and specified output formats.
*   **Safety:** Always test for fallback behaviors when the model encounters policy-violating inputs.

### 2. Multimodal Prompts
*   **Definition:** Prompts that combine text with images, video, or audio.
*   **Strategies:**
    *   **Focus:** explicitly tell the model which part of an image or video to analyze.
    *   **Pre-computation:** For complex tasks, ask the model to describe the image first, then reason about it.
    *   **Chain-of-Thought:** Ask the model to "think step-by-step" to break down complex reasoning involving visual data.
*   **Parameters:** Adjust `temperature` (randomness) and `top-p` (token selection) to balance creativity and determinism.

### 3. Chat Prompts
*   **Context Management:** Chat models rely on history. Ensure the "context" (system instruction or initial prompt) establishes the persona and rules clearly.
*   **Grounding:** To reduce hallucinations, provide reference text or data and instruct the model to answer *only* using that source.
*   **Structure:** A chat prompt consists of a sequence of messages (User/Model). "System" messages set the global behavior.

### 4. Image Generation (Imagen)
*   **Core Components:** Subject, Context/Background, Style.
*   **Modifiers:** Use technical terms like "4K", "HDR", "macro lens", "golden hour" to control quality and lighting.
*   **Negative Prompts:** Explicitly list what *not* to include (e.g., "blur, distortion, text").
*   **Iterative Refinement:** Start with a simple concept and add modifiers layer by layer.

### 5. System Instructions
*   **Purpose:** A persistent instruction that applies to the entire interaction, separate from the user's turn-by-turn input.
*   **Use Cases:** defining a strict persona (e.g., "You are a senior SQL database administrator"), enforcing output formats (JSON only), or setting safety boundaries.
*   **Position:** These are processed *before* user prompts, making them harder for users to override.

### 6. Optimization & Tools
*   **Prompt Optimizer:** Vertex AI offers tools to automatically refine system instructions (Zero-shot) or optimize prompts based on a dataset of examples (Data-driven).
*   **Prompt Gallery:** A resource for finding pre-built, tested prompts for common tasks like classification, extraction, and summarization.
*   **Sharing:** Prompts can be saved and shared within a Google Cloud project to standardize team workflows.
