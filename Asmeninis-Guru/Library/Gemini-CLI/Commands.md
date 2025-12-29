# Gemini CLI Komandos ir Naudojimas

## Slash Komandos (/)
Tai komandos, skirtos valdyti patį CLI įrankį ir sesijos kontekstą:

- `/model <model_id>`: Pakeisti aktyvų AI modelį (pvz., `gemini-1.5-pro`).
- `/memory refresh`: Iš naujo įkelti `GEMINI.md` ir sistemos failus (atnaujina "atmintį").
- `/memory show`: Peržiūrėti visą tekstą, kurį Gemini šiuo metu mato kaip kontekstą.
- `/chat save <tag>`: Išsaugoti visą susirašinėjimą su nurodyta žyme.
- `/chat list`: Pamatyti visas išsaugotas sesijas.
- `/tools`: Pateikia visų prieinamų įrankių (filesystem, shell, web) sąrašą ir aprašymus.
- `/settings`: Atidaro arba parodo konfigūracijos nustatymus.
- `/stats`: Parodo žetonų (tokens) sąnaudas ir sesijos trukmę.

## At Komandos (@)
Naudojamos greitam failų ar katalogų įtraukimui į užklausą:

- `@failas.txt`: Įkelia konkretaus failo turinį.
- `@katalogas/`: Įkelia visų faile esančių tekstinių failų turinį (atsargiai su dideliais katalogais!).
- `@URL`: Kai kurie išplėtimai leidžia įtraukti svetainės turinį tiesiogiai.

## Shell Integracija (!)
Leidžia vykdyti komandas tiesiai iš čato lango:

- `!<komanda>`: Vienkartinis komandos vykdymas (pvz., `!git status`).
- `!`: Perjungia į pilną Shell režimą, kur visos įvestys traktuojamos kaip sisteminės komandos (išėjimas su `exit`).

## Naudingi Trumpiniai
- `ctrl+c`: Nutraukti generavimą.
- `ctrl+l`: Išvalyti ekraną.
