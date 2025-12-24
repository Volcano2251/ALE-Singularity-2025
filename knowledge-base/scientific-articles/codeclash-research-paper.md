# CodeClash: Benchmarking Goal-Oriented Software Engineering

**Source:** https://arxiv.org/html/2511.00839v1
**Authors:** John Yang, Kilian Lieret, Joyce Yang, Carlos E. Jimenez, Ofir Press, Ludwig Schmidt, Diyi Yang
**Date:** November 2, 2025

## Executive Summary
This paper introduces **CodeClash**, a novel benchmark designed to evaluate Large Language Models (LLMs) on "goal-oriented software engineering." Unlike traditional benchmarks that test isolated tasks (like bug fixing), CodeClash simulates a competitive environment where LLMs must iteratively develop and refine a codebase to achieve high-level, open-ended goals (e.g., winning a game tournament). The study reveals significant limitations in current LLMs' ability to think strategically and maintain long-term code quality.

## Key Takeaways

### 1. The Problem with Current Benchmarks
*   Existing benchmarks focus on well-defined, static tasks.
*   Real-world engineering requires pursuing open-ended goals without explicit step-by-step instructions.
*   Current models lack evaluation in environments where they must self-direct improvements based on competitive feedback.

### 2. The CodeClash Methodology
*   **Structure:** LLMs compete in multi-round tournaments within 6 different "code arenas."
*   **Process:**
    1.  **Edit Phase:** Agents revise their code.
    2.  **Competition Phase:** Codebases execute head-to-head.
*   **Goal:** Maximize points, acquire resources, or survive, requiring the model to strategize against opponents.

### 3. Key Findings & Limitations
*   **Strategic Failure:** Even top models like **Claude Sonnet 4.5** consistently lost against expert human-written bots (e.g., losing 150/150 rounds against the "gigachad" bot).
*   **Code Rot:** Models struggle to maintain a clean codebase over time. Repositories became cluttered and redundant, with file creation increasing linearly rather than converging on an optimized structure.
*   **Recovery Issues:** Models rarely recover from a losing streak; once they start losing, the probability of a comeback drops significantly.
*   **Hallucination:** Models frequently misinterpreted execution logs, inventing false reasons for why they lost a round.

### 4. Results
*   **Diversity:** Solutions became more diverse over time, indicating creativity but a lack of convergence on "best practices."
*   **Ranking:** Claude Sonnet 4.5 generally achieved the highest Elo rating among LLMs, but no single model dominated across all arenas.
*   **Root Cause:** Failures were attributed to a lack of strategic reasoning and code maintenance skills, rather than syntax or interface errors (bash errors were rare).

## Relevant Resources
*   [RobotRumble Leaderboard](https://robotrumble.org/boards/2)
*   [Reference Bot ("gigachad")](https://robotrumble.org/entropicdrifter/gigachad)
