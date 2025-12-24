# Gemini CLI Project Architecture

## Apžvalga
Ši aplinka yra konfigūruota kaip aukšto našumo AI agentų darbo vieta, naudojanti Gemini CLI ir Jules agentą.

## Struktūra
- `commands/`: Custom PowerShell įrankiai automatizavimui.
  - `start-tasks.ps1`: Masinis užduočių paleidimas iš `TODO.md`.
  - `sync-github-issues.ps1`: GitHub Issues integracija.
- `knowledge-base/`: AI atmintis ir geriausios praktikos.
- `extensions/`: Funkcionalumo plėtiniai (Jules, Code Review, Browserbase).
- `TODO.md`: Centrinis užduočių valdymo taškas.

## Automatinės eigos (Pipelines)
1. **GitHub Sync**: `gh` -> `sync-github-issues.ps1` -> `Jules Sessions`.
2. **Local Work**: `TODO.md` -> `start-tasks.ps1` -> `Jules Sessions`.
3. **Gemini Feedback**: Gemini CLI analizuoja kodą -> įrašo į `TODO.md` -> Jules sutvarko.

## Geriausios praktikos
- Naudoti `checkpointing` prieš bet kokius masinius pakeitimus.
- Visas naujas žinias saugoti `knowledge-base/` kataloge.
- Naudoti `/jules` didelės apimties refaktūrizavimui.
