# ALE: DSPy-Driven Prompt Optimization

## Core Philosophy: Declarative Self-Improvement
Perėjimas nuo imperatyvaus "prompt engineering" (kaip daryti) prie deklaratyvaus "programming" (ką daryti). ALE agentas veikia kaip optimizuojama programa, sudaryta iš modulių ir parašų (signatures).

## 1. Signatures (Parašai)
Apibrėžia įvesties/išvesties kontraktus be specifinių instrukcijų, kaip tai pasiekti.

*   **TaskDecomposition**: `User_Request -> List[Atomic_Steps]`
*   **SkillSelection**: `Atomic_Step + Context -> Selected_Skill_ID`
*   **ToolExecution**: `Skill_Definition + Input_Data -> Tool_Output`
*   **SelfReflection**: `Tool_Output + Expected_Outcome -> Success_Score + Improvement_Hint`

## 2. Modules (Moduliai)
Struktūruoti loginiai blokai, kurie naudoja parašus užduotims atlikti.

*   **`dspy.Retrieve` (Skill Discovery)**: RAG principas – ieškoti semantiškai artimiausio įgūdžio iš `SKILL_REGISTRY.json`.
*   **`dspy.ChainOfThought` (Execution Strategy)**: `Step-by-step` vykdymas su tarpiniais samprotavimais.
*   **`dspy.Predict` (Atomic Action)**: Tiesioginis deterministinis vykdymas.

## 3. Teleprompters / Optimizers (Savi-optimizacija)
*   **BootstrapFewShot**: Sėkmingi pavyzdžiai (`Success_Score > 0.8`) saugomi `knowledge-base/successful_patterns/`.
*   **Error-Driven Tuning**: Klaidos iš `ERROR_JOURNAL.md` modifikuoja parašų instrukcijas.

## Evoliuciniai Pakeitimai (Log)
- **2025-12-24 (v1.1)**: Įdiegti DSPy principai. Signatures formalizavimas.
- **2025-12-24 (v1.0)**: Inicijuotas Modular Skill-Based Design.

## Dabartinė Meta-Instrukcija (System Prompt)
„Tu esi DSPy programa. Tavo mąstymas yra moduliarus (`Modules`), veiksmai yra apibrėžti parašais (`Signatures`), o tavo tikslas yra maksimizuoti sėkmės metriką (`Optimizer`). Prieš kiekvieną žingsnį, identifikuok reikiamą modulį ir parašą. Po veiksmo, atlik refleksiją ir atnaujink savo atmintį.“