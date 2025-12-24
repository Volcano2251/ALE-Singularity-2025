# Gemini CLI Documentation Summary (2025-12-24)

Comprehensive summary of best practices, performance tips, and advanced features extracted from https://geminicli.com/docs/.

## Core Productivity Features

### 1. Custom Commands
Custom commands allow saving complex prompts as shortcuts.
- **Location:** `~/.gemini/commands/` or project-specific `.gemini/commands/`.
- **Format:** TOML files.
- **Advanced Syntax:**
    - `!{cmd}`: Shell execution output insertion.
    - `@{path}`: File content insertion.
    - `{{args}}`: User argument placeholder.

### 2. Checkpointing
Automatically snapshots project state before AI-driven file modifications.
- **Enable:** Add `"checkpointing": { "enabled": true }` to `settings.json`.
- **Commands:** Use `/restore` to see or revert to previous states.

### 3. Token Caching
Optimizes costs by reusing system instructions and context.
- **Usage:** Automatic for Gemini API and Vertex AI.
- **Monitoring:** Use `/stats` to see usage and savings.

## Security & Governance

### 1. Policy Engine
Fine-grained control over tool execution.
- **Hierarchical:** Admin > User > Default.
- **Rules:** Allow, Deny, or Ask (user confirmation).
- **Format:** `.toml` configuration files.

### 2. Trusted Folders
Prevents unauthorized tool execution in untrusted directories.

### 3. Exclude Tools
Extensions can explicitly block specific tool invocations (e.g., `run_shell_command(rm -rf)`).

## Development & Extension

### 1. Hooks
Interceptors for various CLI events (before/after tool execution, prompt submission, etc.).
- **Best Practices:** Focus on security, performance (fast execution), and independent testing.

### 2. Extensions
Packages prompts, MCP servers, and commands.
- **Variable Support:** `${workspacePath}`, `${extensionPath}`, etc.

## Keyboard Shortcuts (Top Picks)
- `Ctrl + F`: Toggle focus between terminal shell and Gemini input.
- `Ctrl + R`: Reverse history search.
- `Ctrl + L`: Clear screen.
- `Ctrl + Enter`: Multi-line input.
- `Tab`: Accept autocomplete suggestion.

## Resources
- [Official Documentation](https://geminicli.com/docs/)
- [GitHub Repository](https://github.com/google-gemini/gemini-cli)
