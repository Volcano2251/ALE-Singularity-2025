# Gemini CLI: Išsamus Konfigūracijos Vadovas (2025)

Šis dokumentas yra **„Auksinis Standartas“** pradedantiesiems. Jei ką tik įsidiegėte Gemini CLI ir nežinote, nuo ko pradėti – sekite šiuos žingsnius. Tai sukonfigūruos jūsų aplinką pagal profesionalų (Senior Developer) lygį.

---

## 1 Žingsnis: Autentifikacija (Raktas į variklį)
Prieš pradedant darbą, CLI turi žinoti, kas jūs esate, kad galėtų naudoti Google AI modelius.

1.  Atidarykite terminalą (PowerShell, CMD arba Bash).
2.  Įveskite komandą:
    ```bash
    gemini login
    ```
3.  Atsidarys naršyklės langas. Prisijunkite su savo Google paskyra ir suteikite leidimus.
4.  **Patikrinimas**: Grįžkite į terminalą ir įveskite:
    ```bash
    gemini models
    ```
    *Jei matote sąrašą (pvz., `gemini-1.5-pro`, `gemini-1.5-flash`), sveikiname – jūs prisijungėte!*

---

## 2 Žingsnis: Projekto Strategija (`GEMINI.md`)
AI veikia geriausiai, kai žino savo vaidmenį. Šis failas apibrėžia **strategiją** ir **asmenybę**.

1.  Savo projekto pagrindiniame aplanke sukurkite failą pavadinimu `GEMINI.md`.
2.  Įkopijuokite šį šabloną (pakoreguokite pagal save):

```markdown
# Projekto Strategija (GEMINI.md)

## Vaidmuo ir Tikslas
- **Vaidmuo**: Tu esi patyręs programuotojas ir architektas.
- **Tikslas**: Padėti man kurti švarų, testuotą ir saugų kodą.
- **Stilius**: Būk konkretus, venk ilgų įžangų.

## Kalba
- Su manimi bendrauk: **Lietuviškai**.
- Kodą ir komentarus rašyk: **Angliškai**.
```

---

## 3 Žingsnis: Sistemos Branduolys (`.gemini/system.md`)
**SVARBU:** Tai yra profesionalų paslaptis. Mes atskiriame „asmenybę“ nuo „geležinių taisyklių“. Čia surašome tai, ko AI **niekada** negali laužyti.

1.  Sukurkite aplanką `.gemini` (su tašku priekyje).
2.  Tame aplanke sukurkite failą `system.md`.
3.  Įkopijuokite šį „Saugumo Branduolio“ šabloną:

```markdown
# Sistemos Branduolys (SYSTEM.md)

## Saugumas (Security)
- **Niekada** nerašyk API raktų, slaptažodžių ar privačių duomenų į kodą ar konsolę.
- Prieš vykdant komandas, kurios trina failus, visada gauk vartotojo patvirtinimą.

## Darbo Protokolas
1. **Plan**: Pirmiausia parašyk veiksmų planą.
2. **Execute**: Tik patvirtinus planą, rašyk kodą.
3. **Verify**: Po pakeitimų, pasiūlyk arba paleisk testą.

## Techniniai Standartai
- Naudok tik egzistuojančias bibliotekas (patikrink `package.json` ar `requirements.txt`).
- Kodas turi būti formatuotas pagal projekto standartus.
```

---

## 4 Žingsnis: Aktyvavimas (`.env`)
Dabar turime pasakyti Gemini CLI, kad jis naudotų mūsų sukurtą `system.md` failą vietoj gamyklinio.

1.  Tame pačiame `.gemini` aplanke sukurkite failą pavadinimu `.env`.
2.  Įrašykite vieną eilutę:
    ```ini
    GEMINI_SYSTEM_MD=1
    ```
3.  **Vizualus Patikrinimas**: Kitą kartą paleidus `gemini`, eilutės pradžioje pamatysite piktogramą `|⌐■_■|`. Tai reiškia „Custom System Prompt Active“.

---

## 5 Žingsnis: Pirmoji Sesija (Bandomasis važiavimas)
Viskas paruošta. Išbandykime sistemą realioje situacijoje.

1.  Terminale paleiskite: `gemini`
2.  Įveskite užklausą:
    > „Labas! Aš ką tik tave sukonfigūravau. Prašau perskaityti mano `GEMINI.md` ir pasakyti, koks tavo vaidmuo šiame projekte. Taip pat patvirtink, kad laikysiesi saugumo taisyklių iš `system.md`.“

**Tikėtinas atsakymas:**
AI turėtų atsakyti lietuviškai, patvirtinti, kad yra „Patyręs programuotojas“ ir užtikrinti, kad laikysis saugumo protokolų.

---

## Dažniausios Klaidos
- **Klaida**: `missing system prompt file`
  - **Sprendimas**: Patikrinkite, ar tikrai sukūrėte failą `.gemini/system.md` ir ar aplanko pavadinimas prasideda tašku.
- **Klaida**: AI kalba angliškai, nors prašiau lietuviškai.
  - **Sprendimas**: Patikrinkite `GEMINI.md` failą. Įsitikinkite, kad jis yra tame pačiame aplanke, iš kurio paleidžiate `gemini`.

Sėkmės kuriant! 🚀