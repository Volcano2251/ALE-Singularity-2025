# Plan Mode: Project Singularity

## Vizija
Sukurti sistemą, kuri pati save kuria, testuoja ir optimizuoja be žmogaus įsikišimo.

## 🛠 Self-Healing Strategija (Integrated 2025-12-24)
Remiantis naujausiais tyrimais, ALE sistema diegia šiuos mechanizmus:
1. **Resilience Patterns**: Circuit Breaker užklausoms, Exponential Backoff klaidoms.
2. **AI-Driven Observability**: Watchdog agentas analizuoja `HEALTH_LOG.json` ir `ERROR_JOURNAL.md`.
3. **Hot-swap Correction**: Automatinis kodo taisymas per Jules sesijas aptikus anomaliją.

## Tyrimo gairės (Sekančias 7 dienas)
1. **Agentinė Architektūra**: Kaip priversti kelis AI agentus dirbti komandoje.
2. **Infinite Feedback Loop**: Mechanizmas, leidžiantis klaidoms tapti mokymosi medžiaga.
3. **Mokslinis Pagrindas**: Ištirti `scientific-articles/`.
4. **Saugumo Barjerai**: Guardrails diegimas.

5. **Hybrid LLM/SLM Architecture**: Gemini (Complex reasoning) + Phi-4 (Routine tool use).

## Esamos hipotezės
- [ ] Hipotezė 1: Naudojant MCP (Model Context Protocol), agentas gali valdyti visą OS lygį efektyviau.
- [ ] Hipotezė 2: Rekursyvinis planavimas (Plan -> Audit -> Plan) sumažina klaidų skaičių 90%.

## Darbo žurnalas
- **2025-12-24**: Projekto inicijavimas. Sukurta laboratorija `X-RESEARCH-LAB`. Įjungtas `Infinite Plan Mode`. Pridėta Self-Healing strategija.