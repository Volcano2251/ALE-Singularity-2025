# Gemini CLI Konfigūracija (Išrašas iš Docs)

## Konfigūracijos Hierarchija
1. Numatytosios reikšmės.
2. Sistemos numatytieji (`C:\ProgramData\gemini-cli\system-defaults.json`).
3. Vartotojo nustatymai (`~/.gemini/settings.json`).
4. **Projekto nustatymai** (`.gemini/settings.json`).
5. Aplinkos kintamieji (`.env`).
6. CLI argumentai (pvz., `--yolo`).

## Svarbūs Aplinkos Kintamieji (.env)
- `GEMINI_MODEL`: Nurodo numatytąjį modelį.
- `GEMINI_SYSTEM_MD`: Galima nurodyti specifinį sisteminį promptą.
- `GEMINI_SANDBOX`: Saugumo nustatymai įrankių vykdymui.

## Konteksto Valdymas
- `context.fileName`: Nustato, kokius failus Gemini skaito automatiškai (pvz., `GEMINI.md`).
- `context.includeDirectories`: Leidžia įtraukti išorinius katalogus į "atmintį".
