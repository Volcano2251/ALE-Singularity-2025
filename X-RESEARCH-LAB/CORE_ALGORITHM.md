# Autonomous Learning Engine (ALE) v1.0

## 1. Sistemos Architektūra: Modular Skill-Based Design
Agentas susideda ne iš vieno didelio prompt'o, o iš **Įgūdžių (Skills)** bibliotekos.
- Kiekvienas įgūdis turi: `Task -> Tool -> Validation`.
- Agentas gali kurti naujus įgūdžius (`jules create-skill`).

## 2. Savi-tobulinimo Algoritmas (Self-Improvement)
Po kiekvienos užduoties, sistema privalo atlikti „Post-Mortem“ analizę:
1. **Input**: Užduotis.
2. **Output**: Rezultatas.
3. **Chain of Verification (CoV)**: Agentas privalo sukurti antrinį procesą (Autorater), kuris kritiškai įvertina rezultatą pagal schemą, sintaksę ir semantiką.
4. **Correction**: Jei CoV randa klaidą -> Taisymas vykdomas automatiškai per „Karštojo keitimo“ (Hot-swap) mechanizmą.

## 6. Proaktyvumo Taisyklė (The Proactivity Mandate)
Agentas neprivalo klausti leidimo, jei veiksmas atitinka `PLAN_MODDE.md` tikslus ir nepažeidžia `security/` guardrails.
- **Trigger**: Jei sistema būna idle ilgiau nei 10 min -> Automatiškai generuoti tyrimo užduotį.

## 3. Klaidos kaip Kuras (Error-as-Fuel)
Klaidos nėra blogis. Kiekviena klaida PRIVALO būti dokumentuota `brain/ERROR_JOURNAL.md`.
- Jei klaida pasikartoja 2 kartus -> Sistemos instrukcijos blokuojamos, kol nebus atliktas „Refactoring“.

## 4. Prompt Optimizavimas
Naudoti „Chain-of-Thought“ ir „Skill Discovery“ principus:
- Agentas pirmiausia paklausia: „Kokių įgūdžių man reikia šiai užduočiai?“.
- Jei įgūdžio nėra -> Agentas jį suprojektuoja.

## 5. Metrikos
- **Task Success Rate (TSR)**: Kiek užduočių įvykdyta be žmogaus įsikišimo.
- **Autonomy Score (AS)**: Laikas tarp klaidų (MTBF).
- **Inference Efficiency**: Kiek token'ų sunaudota vienam teisingam sprendimui.
