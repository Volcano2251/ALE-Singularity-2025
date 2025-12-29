# ALE: Deep Knowledge Base

## CrewAI Process Models (Integrated 2025-12-24)

### 1. Sequential Process (Nuoseklusis)
- **Mechanika**: Užduotys perduodamos iš vieno agento kitam griežta seka.
- **Panaudojimas ALE**: Naudojama kasdienėms "Health Check" operacijoms.

### 2. Hierarchical Process (Hierarchinis)
- **Mechanika**: LLM veikia kaip "Manager", priima sprendimus kam deleguoti darbą.
- **Panaudojimas ALE**: Tai mūsų ateities vizija – ARCHITECT vaidmuo automatiškai valdys RESEARCHER ir CODER veiksmus be žmogaus priežiūros.

### 4. Small Language Models (SLM) & Phi-4 (Integrated 2025-12-24)
- **Modelis**: Microsoft Phi-4 (14B parametrų).
- **Galimybės**: Multimodalus (tekstas, garsas, vaizdas), 32k-64k kontekstas.
- **Panaudojimas ALE**:
    - Rutininis kodavimas ir klaidų taisymas.
    - Lokalus agentų orkestravimas taupant token'us.
    - Deterministinis įrankių iškvietimas (Tool Use).
