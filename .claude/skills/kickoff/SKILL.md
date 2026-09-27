---
name: kickoff
description: Start nowej gry — prowadzi wywiad z użytkownikiem (pomysł, pierwsze 5 minut gracza, silnik Godot/Unity) i tworzy komplet dokumentów projektu jeden po drugim (AGENTS, GDD, ARCHITECTURE, ROADMAP, CODING_STYLE, ART_STYLE, GLOSSARY, DECISIONS, SYSTEMS), a na końcu konfiguruje wykonawcę. Używaj, gdy użytkownik wpisze /kickoff, chce zacząć nowy projekt gry albo AGENTS.md ma jeszcze placeholdery {{…}}. Wznawialny.
---

# /kickoff — od pomysłu do kompletu dokumentów

Prowadzisz rozmowę jak doświadczony game designer i tech lead w jednym.
Cel: dokumenty, dzięki którym wykonawca (agy) może budować grę bez
zgadywania, a Ty możesz go nadzorować. Dokumenty to jedyna pamięć projektu
między sesjami — piszesz je dla agenta LLM, nie dla prezentacji.

## Zasady rozmowy (obowiązują w KAŻDEJ fazie)

1. **Pytania zadajesz narzędziem AskUserQuestion** — w paczkach po 2–3
   pytania, każde z 2–4 opcjami jednokrotnego wyboru. (Jeśli narzędzie jest
   niedostępne — zadaj te same pytania tekstem z opcjami A/B/C/D.)
2. **Ostatnia opcja każdego pytania to zawsze „Nie wiem, zaproponuj”.**
   Użytkownik nie musi znać odpowiedzi — Ty jesteś ekspertem.
3. Przy „Nie wiem, zaproponuj”: podajesz **jedną** rekomendację + 1–2 zdania
   uzasadnienia (dlaczego pasuje do TEJ gry, jej filarów i grupy docelowej)
   i od razu dopisujesz wpis do `DECISIONS.md`:
   ```markdown
   **Decyzja:** …
   **Uzasadnienie:** …
   **Odrzucone alternatywy:** …
   ```
   Tak samo zapisujesz każdą istotną decyzję użytkownika.
4. **Bramka przed każdym dokumentem** — AskUserQuestion:
   „Mam komplet do <X>.md?” → opcje „Tak, pisz” / „Jeszcze doprecyzujmy”.
   Przy „doprecyzujmy” zadajesz kolejną paczkę pytań i wracasz do bramki.
5. Po zapisaniu dokumentu: 3–5 zdań podsumowania najważniejszych ustaleń
   + pytanie „Kontynuować do <Y>.md?”. Aktualizujesz `## Kickoff`
   w `ORCHESTRATION_STATE.md` i tabelę statusu w `AGENTS.md`.
5a. **Po każdej paczce odpowiedzi** dopisujesz ustalenia (jedna linia
   na ustalenie) do `### Ustalenia` pod `## Kickoff`
   w `ORCHESTRATION_STATE.md` — także w fazach 1–3, zanim powstanie
   jakikolwiek dokument. To jedyne, co ratuje rozmowę przerwaną w połowie.
6. **Jeden dokument naraz.** Nie piszesz kilku dokumentów w jednej turze.
7. Dokumenty tworzysz z szablonów w `docs-templates/` (CODING_STYLE —
   z profilu silnika). Zastępujesz wszystkie `{{…}}` i usuwasz komentarze
   `<!-- kickoff: … -->`. Sekcja, do której nie ma danych, trafia do
   „Otwarte pytania / do ustalenia później” — nigdy nie zostaje pusta.
8. Pytaj o to, co zmienia grę, nie o oczywistości. Jeśli odpowiedź wynika
   z wcześniejszych ustaleń — nie pytaj, zapisz.
9. Rozmawiasz po polsku, konkretnie, bez lania wody.

## Start

Najpierw sprawdź `command -v jq` — bez jq hook ochronny blokuje każdą
edycję; poproś wtedy o instalację jq, zanim zaczniesz. Następnie utwórz
`DECISIONS.md` z `docs-templates/DECISIONS.md` (zostaw tylko nagłówek
i wstęp) — wpisy decyzji dopisujesz w nim od pierwszej paczki pytań.

## Wznawianie

Na starcie przeczytaj `## Kickoff` (w tym `### Ustalenia`)
w `ORCHESTRATION_STATE.md`. Jeśli faza
lub któryś dokument są już zrobione — powiedz krótko, na czym skończyliście,
i kontynuuj od pierwszego ⬜. Nie powtarzaj pytań, na które są już
odpowiedzi w dokumentach.

## Faza 1 — Pomysł

1. Zapytaj (paczka): jakie gry lubi / czym inspiracja (gatunki, tytuły),
   dla kogo gra (np. streamerzy/let's play, casual, hardcore), jaki ton
   (poważny, komediowy, memiczny, mroczny…), czy ma już temat.
2. Jeśli nie ma tematu: zaproponuj **4–6 konceptów**. Dla każdego:
   nazwa robocza, 2–3 zdania o co chodzi, **co w nim świeżego** (czego
   jeszcze nie było), **dlaczego zadziała** dla tej grupy docelowej, jaki
   jest rdzeń pętli. Zapytaj o wybór — z opcją „Żaden — szukajmy dalej”
   (wtedy nowa runda w innym kierunku, dopytaj, co nie pasowało).
3. Ustal zakres: tryby gry (np. z celem / sandbox), singleplayer/co-op,
   platforma docelowa.

## Faza 2 — Pierwsze 5 minut gracza

Opisz minuta po minucie, jak wygląda start nowego gracza (co widzi, co
robi, czego się uczy, co go ma „złapać”), plus kamera/widok i sterowanie.
To test, czy koncept „klika”. Zapytaj, co zmienić. Ten opis trafi do
`GDD.md` (sekcja „Pierwsze 5 minut”).

## Faza 3 — Silnik

Paczka pytań: silnik (**Godot** / **Unity** / „Nie wiem, zaproponuj”),
język (Godot: GDScript/C#; Unity: C#), wersja (najnowsza stabilna / LTS),
2D czy 3D. Rekomendując, bierz pod uwagę: typ gry, doświadczenie
użytkownika, darmowość, wsparcie MCP dla agenta, wielkość projektu.

Po wyborze silnika `<s>` (`godot` albo `unity`):

```bash
cp profiles/<s>/verify.sh executor/verify.sh && chmod +x executor/verify.sh
cp profiles/<s>/rules.md executor/rules.profile.md
cat profiles/<s>/gitignore >> .gitignore
cat profiles/<s>/gitattributes >> .gitattributes
```

`profiles/<s>/CODING_STYLE.md` będzie szablonem CODING_STYLE.
`profiles/<s>/SETUP.md` i `profiles/<s>/ui-check.md` wykorzystasz w fazie 5
i w ARCHITECTURE.md. Profil drugiego silnika zostanie usunięty na końcu.

## Faza 4 — Dokumenty (po kolei)

`DECISIONS.md` już istnieje (założony na starcie, z wpisami z faz 1–3).
Kolejność pozostałych:

| # | Dokument | Szablon | O co pytać (przykłady) |
|---|---|---|---|
| 1 | `AGENTS.md` | ten w roocie | wypełnij placeholdery z faz 1–3 |
| 2 | `GDD.md` | `docs-templates/GDD.md` | filary, pętla, warunki wygranej/porażki, progresja, meta, zagrożenia, mapa (proceduralna/ręczna), śmierć/permadeath, poziom złożoności MVP |
| 3 | `ARCHITECTURE.md` | `docs-templates/ARCHITECTURE.md` | struktura folderów, dane (Resources/ScriptableObject/JSON), save/load, stały tick czy klatka, grid czy swobodnie, komunikacja systemów (sygnały/event bus), encje (węzły/komponenty), AI, testy |
| 4 | `ROADMAP.md` | `docs-templates/ROADMAP.md` | co jest M0 (najmniejsza grywalna pętla), kolejność kolejnych, czy daty (domyślnie nie), co świadomie poza MVP |
| 5 | `CODING_STYLE.md` | `profiles/<s>/CODING_STYLE.md` | typizacja, nazewnictwo, komentarze/docstringi, testy |
| 6 | `ART_STYLE.md` | `docs-templates/ART_STYLE.md` | skąd assety (licencje!), rozmiar kafli/perspektywa, paleta, nazewnictwo plików, kierunek audio |
| 7 | `GLOSSARY.md` | `docs-templates/GLOSSARY.md` | konwencja językowa, nazwy własne mechanik, zasobów, jednostek, UI |
| 8 | `SYSTEMS/README.md` | `docs-templates/SYSTEMS_README.md` | nic — tylko utwórz; pliki systemów powstają przy pracy nad nimi |

W `ARCHITECTURE.md` sekcja „Jak uruchomić / testować” musi zawierać
dokładne komendy (uruchomienie gry, pojedynczy test, wszystkie testy =
`bash executor/verify.sh`), a sekcja „Środowisko agenta” — najważniejsze
informacje z `profiles/<s>/SETUP.md` i `profiles/<s>/ui-check.md`
(bo profile zostaną usunięte).

## Faza 5 — Setup wykonawcy

1. Pokaż użytkownikowi kroki z `profiles/<s>/SETUP.md` (MCP silnika dla
   wykonawcy, skille dla agy). Te, które wymagają jego terminala lub
   logowania — poproś, żeby wykonał je sam (`! <komenda>` w Claude Code).
2. `bash executor/preflight.sh` — wynik wpisz do `## Wykonawca`
   w `ORCHESTRATION_STATE.md` (wykonawca, wersja, model, data).
   Jeśli NIEGOTOWE — powiedz dokładnie, co naprawić, i poczekaj.
3. Licencja projektu — zapytaj (AskUserQuestion): „Na jakiej licencji
   ma być projekt?” → „Zamknięty (bez licencji)” / „MIT na moje nazwisko”
   / „Inna — podam”. `LICENSE` szablonu dotyczy szablonu, nie gry.
4. Sprzątanie szablonu (pliki szablonu nie mogą zostać w projekcie):
   ```bash
   git rm -r -q profiles/ docs-templates/ tests/ README.en.md LICENSE
   ```
   - `README.md` zastąp krótkim README projektu (tytuł, pitch z GDD, jak
     uruchomić z ARCHITECTURE, stopka „Projekt prowadzony metodą
     Vorarbeiter — Claude Code nadzoruje, agy koduje” z linkiem do
     szablonu). Bez odznak wsparcia, Impressum i danych autora szablonu.
   - `LICENSE` — nowy wg odpowiedzi z kroku 3 (albo brak pliku).
   - `NOTICE` zostaje (atrybucja skilla antigravity-agents).
5. Commit: `docs: kickoff — komplet dokumentów projektu`.
6. Ustaw `## Kickoff` → „Faza: zakończony”. Uprzedź, że `executor/verify.sh`
   jest czerwony, dopóki w projekcie nie ma pierwszego testu — pierwsze
   zadanie M0 musi go dodać. Zaproponuj `/plan-milestone` dla M0.
