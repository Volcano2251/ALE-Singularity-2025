# Jules TUI Tyrimas ir Analizė

**Statusas:** Užbaigta
**Data:** 2025-12-23

## Išvados

1.  **Techninis Suderinamumas:**
    - Jules TUI (paleidžiamas su komanda `jules`) **nepalaikomas** dabartinėje agento aplinkoje. Bandymas paleisti baigiasi "pakibimu" arba reikalauja interaktyvios įvesties, kurios negalime suteikti.
    - **Sprendimas:** Naudoti tik CLI komandas su vėliavomis (`--flags`), pvz., `jules new`, `jules remote list`.

2.  **Naudingumo Analizė:**
    - TUI suteikia vizualų sesijų sąrašą ir būsenos stebėjimą, tačiau **visą šią informaciją** galima gauti ir per CLI komandas (`jules remote list`).
    - CLI yra efektyvesnis automatizacijai ir skriptams.

3.  **Rekomendacija:**
    - Vengti `jules` komandos be argumentų.
    - Visas sąveikas vykdyti per `jules [command] [args]`.
    - Vartotojui pateikti nuorodas į Jules internetinę konsolę (`jules.google.com`) vizualiam valdymui, kai to reikia.

## Veiksmų Planas
- [x] Ištirti TUI veikimą.
- [x] Dokumentuoti ribojimus.
- [x] Pereiti prie 100% CLI darbo eigos.