# ALE Error Journal: Lessons Learned

## [2025-12-26] Rust `format!` Bracket Mismatch
- **Klaida:** Bandymas naudoti `format!` Rust kalboje įterpiant PowerShell skriptus su riestinėmis skliaustelėmis `{}` sukėlė sintaksės klaidą.
- **Priežastis:** Rust interpretuoja `{}` kaip kintamųjų vietas. Jei string'e yra realios skliaustelės, jos turi būti padvigubintos `{{}}`.
- **Sprendimas:** PowerShell skriptams naudoti statinius string'us (raw strings `r#""#`) ir kintamuosius įterpti per `.replace("PLACEHOLDER", &value)` vietoj `format!`.

## [2025-12-26] `write_file` Escaping Issues (Windows)
- **Klaida:** `write_file` įrankis kartais klaidingai interpretuoja `\"` arba `\` pabaigas string'uose, nukirpdamas simbolius.
- **Sprendimas:** Peržiūrėti failą su `read_file` iškart po įrašymo. Jei kodas sudėtingas, naudoti kelis mažesnius `replace` žingsnius vietoj vieno didelio `write_file`.

## [2025-12-26] Tauri Resource Path
- **Klaida:** Build'as nepavyko, nes `tauri.conf.json` nurodė nebeegzistuojantį `server.js` resursą.
- **Sprendimas:** Visada atnaujinti `tauri.conf.json` pašalinus Sidecar komponentus.
