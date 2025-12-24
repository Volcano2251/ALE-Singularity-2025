# Development Guide (High Performance Workflow)

Šis gidas paaiškina, kaip naudoti optimizuotą `gemini-cli` aplinką kasdieniam darbui.

## 1. Naujos užduoties pradžia
Užuot patys rašę kodą, naudokite šią eigą:
1.  Atidarykite `TODO.md`.
2.  Pridėkite užduotį Backlog skiltyje formatu: `- [ ] Aprašymas`.
3.  Paleiskite terminale: `./commands/start-tasks.ps1`.
4.  **Jules** agentas sukurs sesiją ir pradės vykdyti užduotį fone.

## 2. GitHub užduočių importavimas
Jei dirbate su komanda arba turite GitHub Issues:
1.  Paleiskite: `./commands/sync-github-issues.ps1`.
2.  Skriptas paims paskutines 10 užduočių ir sukurs Jules sesijas.

## 3. Saugumas ir Checkpointing
Prieš darant didelius pakeitimus rankiniu būdu:
- CLI automatiškai daro **checkpointus** (konfigūruota `settings.json`).
- Jei kažkas nepavyko, galite grįžti į ankstesnę būseną (naudokite `git checkout` arba CLI checkpoint funkciją).

## 4. Efektyvumo patarimai
- **Naudokite /jules**: Dideliems refaktūrizavimams ar testų rašymui per visą projektą.
- **Naudokite /code-review**: Prieš darant `git commit`, paprašykite AI peržiūrėti pakeitimus.
- **Knowledge Base**: Jei radote naudingą instrukciją internete, išsaugokite ją naudodami `/utils:save-info <link>`.

## 5. Kaip pridėti naujas komandas?
Visi pagalbiniai skriptai turėtų būti dedami į `commands/` katalogą. Jei sukuriate naudingą `.ps1` skriptą, nepamirškite jo aprašyti `ARCHITECTURE.md`.
