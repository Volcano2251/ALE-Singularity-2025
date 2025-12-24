# Gemini CLI Konfigūracijos Vadovas

Šis vadovas paaiškina visus galimus `config` nustatymus, jų paskirtį ir rekomendacijas, kada juos naudoti. Tai padės optimizuoti darbo eigą priklausomai nuo jūsų tikslų (programavimas, tekstų rašymas, analizė).

## 1. Vartotojo sąsaja (UI) ir Išvaizda

Šie nustatymai keičia tai, kaip programa atrodo jūsų terminale.

| Nustatymas | Aprašymas | Rekomendacija |
| :--- | :--- | :--- |
| **Vim Mode** | Įjungia `Vim` stiliaus valdymą klaviatūra (navigacija su `h/j/k/l`). | **Išjungta** (nebent esate `Vim` fanatikas). |
| **Use Full Width** | Leidžia tekstui užimti visą terminalo plotį, o ne būti apribotam centre. | **Įjungta**. Būtina skaitant ilgus straipsnius ar kodą plačiame ekrane. |
| **Show Line Numbers** | Rodo eilučių numerius kodo blokuose. | **Įjungta**. Kritiškai svarbu, kai reikia nurodyti klaidą konkrečioje eilutėje. |
| **Show Color** | Naudoja spalvotą tekstą (syntax highlighting). | **Įjungta**. Pagerina skaitomumą. |
| **Hide Context Summary** | Paslepia informaciją apie tai, kokius failus Gemini "mato" savo atmintyje. | **Išjungta**. Svarbu matyti, ar modelis turi prieigą prie reikiamų failų. |
| **Hide Tips / Banner** | Paslepia pagalbinius pranešimus. | **Įjungta**, kai jau priprantate prie sistemos. |
| **Output Format** | `Text` (skaitomas tekstas) arba `JSON` (duomenų formatas). | **Text**. `JSON` naudojamas tik kuriant automatizuotus skriptus. |

## 2. Funkcionalumas ir Failų Valdymas

Šie nustatymai veikia tai, kaip Gemini skaito failus ir vykdo komandas.

| Nustatymas | Aprašymas | Rekomendacija |
| :--- | :--- | :--- |
| **Use Ripgrep** | Naudoja `ripgrep` (labai greitą paieškos įrankį) vietoj standartinio. | **Įjungta**. Žymiai pagreitina failų paiešką dideliuose projektuose. |
| **Respect .gitignore** | Ignoruoja failus, kurie įtraukti į `.gitignore` (pvz., `node_modules`). | **Įjungta**. Apsaugo nuo nereikalingų failų skaitymo ir taupo resursus. |
| **Auto Accept** | Automatiškai patvirtina įrankių vykdymą (nereikia spausti `y/n`). | **Įjungta** darbui "flow" būsenoje. **Išjungta**, jei dirbate su jautriais duomenimis ir norite kontrolės. |
| **Enable Recursive File Search** | Leidžia ieškoti failų ne tik esamame, bet ir vidiniuose aplankuose. | **Įjungta**. |
| **Tool Output Truncation** | Nukerpa labai ilgus įrankių atsakymus (pvz., skaitant 10k eilučių failą). | **Įjungta**. Apsaugo terminalą nuo užkimšimo nereikalingu tekstu. |

## 3. Sistemos Veikimas (Advanced)

Nustatymai skirti derinimui arba specifiniams sistemos poreikiams.

| Nustatymas | Aprašymas | Rekomendacija |
| :--- | :--- | :--- |
| **Debug Keystroke Logging** | Įrašo kiekvieną klavišo paspaudimą į žurnalą. | **Išjungta**. Reikalinga tik kūrėjams taisant klaidas. |
| **IDE Mode** | Optimizuoja veikimą integracijai su redaktoriais (pvz., VS Code). | **Įjungta**, jei naudojate integruotą terminalą. |
| **Max Session Turns** | Riboja pokalbio ilgį (maksimalus žinučių skaičius). `-1` = neribota. | **-1**. Nebent norite priverstinai valyti atmintį kas X žinučių. |
| **Show Memory Usage** | Rodo RAM sunaudojimą. | **Išjungta**, nebent sistema veikia lėtai. |
| **Disable Auto Update** | Išjungia automatinį atnaujinimą. | **Išjungta**, kad visada gautumėte naujausias funkcijas. |

## Konfigūracijos Keitimas

Norėdami pakeisti nustatymą, naudokite komandą `/config`.
Pavyzdys:
```bash
/config set AutoAccept true
```
arba redaguokite failą tiesiogiai: `C:\Users\User\.gemini\settings.json`.
