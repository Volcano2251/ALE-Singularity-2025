# Gemini CLI: Ultimate Getting Started Guide (2025)

This guide is designed for absolute beginners who have just installed Gemini CLI and want to set up a professional, "Senior Developer" grade environment from scratch.

## 1. Authentication (The Key to the Engine)
Before anything else, you must connect the CLI to your Google account.
- **Command**: `gemini login`
- **Action**: A browser window will open. Accept the permissions.
- **Verification**: Run `gemini models` to see if you can list available AI models. If you see a list, you are connected.

## 2. Project Context (Teaching the AI)
Gemini CLI needs to know *what* you are working on and *how* you want it to behave. This is done via the `GEMINI.md` file in your project root.
- **Create File**: `GEMINI.md`
- **Content Strategy**: Keep this file focused on **Strategy** and **Persona**.
  ```markdown
  # Project Strategy (GEMINI.md)
  - **Role**: Senior React Developer.
  - **Goal**: Build a high-performance dashboard.
  - **Language**: Lithuanian (for user interaction), English (for code/docs).
  ```

## 3. System Core (The Safety Net)
This is the modern "Best Practice" step often missed by beginners. We separate the AI's *personality* from its *rules*.
- **Create Directory**: `.gemini/`
- **Create File**: `.gemini/system.md`
- **Content Strategy**: Put your **non-negotiable rules** here.
  ```markdown
  # System Core Rules (system.md)
  - **Security**: Never output API keys.
  - **Protocol**: Always Plan -> Execute -> Test.
  - **Tools**: Use tools efficiently and safely.
  ```
- **Activate It**: Create a `.gemini/.env` file:
  ```ini
  GEMINI_SYSTEM_MD=1
  ```
  *Visual Check: You will see a `|⌐■_■|` icon in the CLI prompt when this is active.*

## 4. First Run & Verification
Now that the engine is tuned, let's take it for a spin.
- **Start the CLI**: Run `gemini` in your terminal.
- **Sanity Check**: Ask it: *"What are your core rules?"*
  - It should quote the rules from your `.gemini/system.md`.
- **First Task**: Try a simple context-aware request:
  - *"Analyze the current directory structure and suggest a README.md."*

## 5. Pro Tips for Efficiency
- **Use `@`**: Reference files directly. `Explain @package.json`.
- **Use `/`**: Use slash commands. `/help`, `/clear`.
- **Context7**: If using libraries, use `/context7` to fetch up-to-date docs.

---
**Summary Checklist:**
1. [ ] `gemini login`
2. [ ] `GEMINI.md` (Strategy) created.
3. [ ] `.gemini/system.md` (Rules) created.
4. [ ] `.gemini/.env` (Activation) created.
5. [ ] First prompt executed successfully.
