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

## 7. Perpetual Loop Planning (Nenutrūkstamas Ciklas)
Sistema niekada nebūna „būdėjimo“ režime. Jei nėra tiesioginių vartotojo užklausų, agentas vykdo šį ciklišką algoritmą:
1. **Analizė**: Skenuoti kodo bazę, ieškant `deprecated` funkcijų, saugumo skylių ar optimizavimo galimybių.
2. **Hipotezė**: Formuluoti teiginį (pvz., „Migravus šią funkciją į Rust, sutaupysime 50ms“).
3. **Planavimas**: Įrašyti planą į `TODO.md` backlog'ą.
4. **Vykdymas**: Inicijuoti autonomines Jules sesijas užduotims atlikti.
5. **Auditas**: Atlikti `sanity-check.ps1` ir atnaujinti `ERROR_JOURNAL.md`.
6. **Repeat**: Grįžti prie 1 žingsnio.

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
