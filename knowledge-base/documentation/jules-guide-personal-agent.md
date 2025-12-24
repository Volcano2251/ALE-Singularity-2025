# Jules: Jūsų Asmeninis Asinchroninis Programavimo Agentas

Šis dokumentas aprašo, kaip maksimaliai išnaudoti Jules kaip "asmeninį tarną" programinės įrangos kūrimo užduotims.

## Kas yra Jules?

Jules yra autonominis agentas, veikiantis fone. Skirtingai nuo manęs (Gemini CLI), kuris veikia interaktyviai "čia ir dabar", Jules dirba su jūsų GitHub saugyklomis asinchroniškai. Tai reiškia, kad galite jam duoti užduotį ir pamiršti apie ją, kol ji bus atlikta.

## "Master" Strategija: Kaip įdarbinti Jules 24/7

Norint išnaudoti Jules kaip nuolatinį darbuotoją, rekomenduojama taikyti šią strategiją:

### 1. Masinis Refaktūrizavimas (Bulk Actions)
Jules puikiai tinka užduotims, kurios reikalauja pakeitimų daugybėje failų. Užuot gaišę laiką patys, deleguokite tai:
*   **Komanda:** `/jules Atnaujink visas React klases į funkcinius komponentus.`
*   **Komanda:** `/jules Pakeisk visus 'var' į 'const' arba 'let' visame projekte.`
*   **Komanda:** `/jules Sutvarkyk importavimo tvarką pagal ABC visuose failuose.`
*   **Oficialus pavyzdys:** Migracija iš CommonJS į ES Modules visame projekte.

### 2. "Sanitarinės" Užduotys (Hygiene)
Palikite Jules tvarkyti nuobodžius darbus, kol jūs kuriate naujas funkcijas:
*   **Testų padengimas:** `/jules Parašyk unit testus failui utils/helper.ts, kad padengimas būtų 100%.`
*   **Dokumentacija:** `/jules Sugeneruok JSDoc komentarus visoms eksportuojamoms funkcijoms.`
*   **Klaidų taisymas:** `/jules Išanalizuok projektą ir pasiūlyk pataisymus dažniausioms ESLint klaidoms.`

### 3. Nakties Režimas (Fire and Forget)
Prieš baigdami darbą, duokite Jules sudėtingą užduotį nakčiai:
*   **Pavyzdys:** `/jules Išanalizuok visą 'src' aplanką ir pasiūlyk architektūrinius patobulinimus, kad sumažintum 'coupling'.`
*   Ryte galėsite peržiūrėti pasiūlymus ir juos pritaikyti.

## Google Oficialios Rekomendacijos (Best Practices)

Remiantis oficialia Google dokumentacija (Introducing the Jules extension):

1.  **Asinchroniškumas yra Raktas:** Jules sukurtas tam, kad netrukdytų jūsų darbui. Paleiskite užduotį ir iškart grįžkite prie savo darbų. Nėra prasmės laukti.
2.  **Saugus Darbas (Sandbox):** Jules veikia saugioje virtualioje mašinoje (VM). Jis klonuoja jūsų kodą, įdiegia priklausomybes ir atlieka pakeitimus izoliuotai.
3.  **Naujos Šakos (Branches):** Geriausia praktika – leisti Jules sukurti naują Git šaką (`branch`) su pakeitimais. Tai leidžia lengvai peržiūrėti kodą per "Pull Request" (PR) procesą.
4.  **Tikslingos Užduotys:** Jules geriausiai veikia, kai užduotis yra aiški, bet plati (pvz., "fix multiple bugs in background", "convert modules").

## Darbo Eiga (Workflow)

1.  **Užduoties skyrimas:** Tiesiog parašykite man (`/jules [užduotis]`). Aš automatiškai nustatysiu repozitoriją ir sukursiu sesiją.
2.  **Būsena:** Norėdami sužinoti, kaip sekasi, naudokite `/jules status`.
3.  **Peržiūra:** Kai Jules baigs, aš pateiksiu konsolės nuorodą.
4.  **Pritaikymas:** 
    *   **Standartinis:** Aš galiu parsiųsti pakeitimus (`diff`) ir juos pritaikyti tiesiai jūsų darbo aplinkoje.
    *   **Saugus (Rekomenduojamas):** Aš galiu sukurti naują Git šaką su pakeitimais, kad galėtumėte juos saugiai ištestuoti.

## Techninė Informacija

*   **Autentifikacija:** `jules login` (jau atlikta).
*   **Įdiegimas:** `npm install -g @google/jules` (jau atlikta).
*   **Integracija:** Veikia tiesiogiai su GitHub (reikia sukonfigūruoti prieigą `jules.google.com`, jei kyla problemų).

## Komandų Santrauka (Man, kaip Agentui)

*   `jules new "užduotis"` - Pradeda darbą.
*   `jules remote list --session` - Rodo progresą.
*   `jules remote pull --session <id>` - Parsisiunčia kodą.
*   `jules teleport <id>` - Greitas būdas viską parsiųsti ir paruošti (labai naudinga norint greitai "peršokti" į Jules atliktą darbą).

---
*Šis įrašas sukurtas 2025-12-23 ir atnaujintas remiantis oficialiu Google tinklaraščiu.*