# LearnLM Prompt Guide (Gemini 3)

**Original PDF:** [learnlm_prompt_guide.pdf](./pdfs/learnlm_prompt_guide.pdf)
**Source URL:** https://services.google.com/fh/files/misc/learnlm_prompt_guide.pdf
**Date:** November 2025

## Executive Summary
This guide explains how **LearnLM** capabilities (fine-tuned for learning science) are now infused directly into **Gemini 3**. It provides a framework for creating high-quality educational prompts, specific examples of system instructions for various use cases (tutors, coaches, assessment creators), and strategies for developers to build learning applications using Google AI Studio and the Gemini API.

**Core Value Proposition:** Gemini 3 with LearnLM capabilities does not just generate content; it scaffolds learning, stimulates curiosity, and adapts to the learner without requiring complex fine-tuning by the developer.

## Key Takeaways

### 1. The PARTS Framework for Prompting
To guide Gemini effectively, use the **PARTS** framework:
*   **P - Persona:** Set the role (e.g., "Act like a high school biology coach").
*   **A - Act:** Define the task clearly (e.g., "Design a 5E lesson plan").
*   **R - Recipient:** Specify the audience (e.g., "10th-grade students").
*   **T - Theme:** Provide the topic/context (e.g., "DNA structure").
*   **S - Structure:** Define the output format (e.g., "Include a lab activity and CER exit ticket").

### 2. Learning Science Principles
LearnLM is grounded in five key principles:
1.  **Inspire Active Learning:** Move students from passive reading to active reasoning.
2.  **Manage Cognitive Load:** Break down complex topics into digestible steps.
3.  **Adapt to the Learner:** Personalize tone, difficulty, and examples.
4.  **Stimulate Curiosity:** Ask Socratic questions rather than just giving answers.
5.  **Deepen Metacognition:** Encourage reflection on *how* an answer was reached.

### 3. Example Use Cases & Prompts
The guide provides specific system instruction examples for:
*   **Image-based Science Tutor:** Visual reasoning from uploaded diagrams.
*   **Adaptive Quiz Generator:** Scaffolding questions that increase in difficulty.
*   **Reading Comprehension Coach:** "Book Buddy" for literary discussions.
*   **Math Discourse Coach:** Validating reasoning and identifying misconceptions (not just checking answers).
*   **Instructional Content Authoring:** Generating scenarios based on uploaded videos.

### 4. Developer Workflow
1.  **Prototype:** Draft and test prompts in **Google AI Studio**.
2.  **Deploy:** Use the **Gemini API** or **Vertex AI** to integrate into apps.
3.  **Monitor:** Log interactions to refine quality.
4.  **Optimize:** Use Vertex AI prompt optimization tools to scale.

## Relevant Resources
*   [Google AI Studio](https://aistudio.google.com/)
*   [Gemini API](https://ai.google.dev/)
*   [Vertex AI](https://cloud.google.com/vertex-ai)
*   [LearnLM Research Report](https://arxiv.org/abs/2412.16429) (arXiv link inferred from context)
