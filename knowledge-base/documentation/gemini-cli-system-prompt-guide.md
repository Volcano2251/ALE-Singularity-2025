# Gemini CLI System Prompt Override Reference

**Source URL**: [https://geminicli.com/docs/cli/system-prompt/](https://geminicli.com/docs/cli/system-prompt/)
**Type**: Documentation / Configuration

## Executive Summary
The `GEMINI_SYSTEM_MD` environment variable allows advanced users to completely replace the default Gemini CLI system instructions with a custom Markdown file. This is a **full override**, not a merge, meaning all safety protocols and tool definitions must be manually included in the custom file if desired.

## Key Technical Details

### 1. Activation & Configuration
- **Environment Variable**: `GEMINI_SYSTEM_MD`
- **Project Default**: Set `GEMINI_SYSTEM_MD=1` (or `true`). The CLI looks for `./.gemini/system.md`.
- **Custom Path**: Set `GEMINI_SYSTEM_MD=/absolute/path/to/custom.md`. Supports tilde expansion (`~/...`).
- **Disable**: Set `GEMINI_SYSTEM_MD=0` (or `false`) or unset the variable.

### 2. Operational Behavior
- **Full Replacement**: The custom file replaces *everything*. The original "You are a helpful assistant..." and all built-in safety rules are discarded.
- **UI Indicator**: When active, the CLI prompt displays a sunglasses icon: `|⌐■_■|`.
- **Error Handling**: If the specified file is missing, the CLI will error out with `missing system prompt file`.

### 3. Best Practices (Architecture)
To maintain stability while allowing customization, split responsibilities between two files:

*   **`SYSTEM.md` (The "Hard" Rules)**
    *   **Purpose**: Operational integrity, security, tool protocols, output formatting.
    *   **Content**: "Never expose secrets", "Consult KB first", "Use JSON for tools".
    *   **Stability**: Rarely changes.

*   **`GEMINI.md` (The "Soft" Rules)**
    *   **Purpose**: Strategy, persona, project context.
    *   **Content**: "Act as a Senior Architect", "Focus on React performance", "Speak Lithuanian".
    *   **Stability**: Changes per project/task.

### 4. Utilities
- **Export Default Prompt**: To see what you are overriding (and copy essential parts), run:
  ```bash
  GEMINI_WRITE_SYSTEM_MD=1 gemini
  ```
  This writes the built-in system prompt to `./.gemini/system.md` (or standard output/file depending on version).

## Implementation Example (.env)
Create a `.gemini/.env` file in your project root:

```ini
GEMINI_SYSTEM_MD=1
```

Then ensure `.gemini/system.md` exists and contains your core operational rules.