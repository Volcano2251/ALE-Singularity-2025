# Jules CLI Reference

**Data:** 2025-12-26
**Šaltinis:** vertexaisearch.cloud.google.com

## Apžvalga
Google Jules CLI yra įrankis, skirtas sąveikauti su Google autonominiu AI kodavimo agentu „Jules“. Jis leidžia valdyti sesijas tiesiai iš terminalo.

## Įdiegimas
```bash
npm install -g @google/jules
```

## Pagrindinės Komandos

### 1. Sesijų Valdymas (`jules remote`)
Tai yra pagrindinė komanda darbui su debesyje veikiančiomis Jules sesijomis.

- **Sąrašo peržiūra:**
  - `jules remote list --repo` - Rodo visas prijungtas saugyklas.
  - `jules remote list --session` - Rodo visas aktyvias ir buvusias sesijas.
- **Naujos sesijos kūrimas:**
  - `jules remote new --repo <owner/repo> --session "<užduoties_aprašymas>"`
  - Pavyzdys: `jules remote new --repo Volcano2251/ALE-Singularity-2025 --session "Fix typo in README"`
- **Rezultatų gavimas:**
  - `jules remote pull --session <session_id>` - Atsisiunčia Jules atliktus pakeitimus į vietinį diską.

### 2. Autentifikavimas
- `jules login` - Atidaro naršyklę GitHub autorizacijai.
- `jules logout` - Atjungia paskyrą.

### 3. Pagalba ir Konfigūracija
- `jules help` - Bendras sąrašas.
- `jules version` - CLI versija.
- `jules completion <shell>` - Skirta bash/zsh autocomplete.

## Globalios Vėliavėlės
- `--theme <dark|light>` - Keičia TUI (Terminal UI) išvaizdą.
- `-h`, `--help` - Pagalba.

## Geriausios Praktikos
1. **Tikslus aprašymas:** Kuriant naują sesiją, `--session` parametrą naudokite kaip išsamų prompt'ą.
2. **Pipelines:** Naudokite `jules remote new` skriptuose (pvz., `commands/start-tasks.ps1`), kad automatizuotumėte didelius refaktorinimus.
3. **Audit:** Prieš darant `pull`, visada peržiūrėkite Jules atliktus pakeitimus per Jules Console (jules.google.com).
