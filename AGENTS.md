# AGENTS.md

> Ten plik czytasz jako pierwszy, zanim zaczniesz jakąkolwiek pracę nad projektem.
> Zawiera podstawowe zasady, strukturę i to, czego NIE wolno robić bez pytania.
>
> <!-- Wypełnia /kickoff. Dopóki są tu placeholdery {{…}}, projekt nie ma dokumentów. -->

## Czym jest ten projekt

**Roboczy tytuł:** {{TYTUL}}

**Gatunek:** {{GATUNEK}}

**Silnik:** {{SILNIK}} (wersja i język — patrz `ARCHITECTURE.md`)

**Grafika:** {{GRAFIKA}} (patrz `ART_STYLE.md`)

**Grupa docelowa:** {{GRUPA_DOCELOWA}}

**Ton:** {{TON}}

Pełny opis mechanik: patrz `GDD.md`.

## Kolejność czytania dokumentacji

1. `AGENTS.md` (ten plik) — zawsze najpierw
2. `GDD.md` — co robimy i dlaczego
3. `ARCHITECTURE.md` — jak jest zbudowany projekt, jak uruchomić i testować
4. `ROADMAP.md` — na jakim etapie jesteśmy, co jest w zakresie obecnego milestone'a
5. `SYSTEMS/*.md` — szczegóły konkretnego systemu, nad którym akurat pracujesz
6. `CODING_STYLE.md` — konwencje kodu
7. `ART_STYLE.md` — konwencje assetów
8. `GLOSSARY.md` — ustalone nazwy własne, żeby nie wymyślać nowych terminów
9. `DECISIONS.md` — historia decyzji, zanim zaproponujesz coś, co mogło już
   zostać rozważone i odrzucone

## Zasady pracy dla agenta

- **Nie zmieniaj zakresu.** Pracuj tylko nad zleconym zadaniem z bieżącego
  milestone'a w `ROADMAP.md`.
- **Nie zmieniaj architektury ani struktury scen/projektu** bez wyraźnej
  zgody — jeśli coś wymaga refaktoru, opisz to w raporcie.
- **Nie dodawaj nowych zależności/pluginów/addonów** bez wyraźnego polecenia.
- **Trzymaj się `CODING_STYLE.md`** — nie wprowadzaj własnych konwencji.
- **Teksty dla gracza** (nazwy, komunikaty, opisy) — zgodnie z tonem z `GDD.md`
  i nazwami z `GLOSSARY.md`.
- **Istotne decyzje projektowe** zapisuj w `DECISIONS.md` (co, dlaczego,
  jakie były alternatywy).
- **Nie usuwaj i nie nadpisuj assetów** bez potwierdzenia.
- Jeśli czegoś brakuje w dokumentacji, żeby wykonać zadanie — napisz to
  w raporcie, zamiast zgadywać.

## Jak uruchomić / testować

Patrz `ARCHITECTURE.md` → „Jak uruchomić / testować”. Pełna weryfikacja
projektu: `bash executor/verify.sh` (exit 0 = zielono).

## Status dokumentacji

| Dokument | Status |
|---|---|
| AGENTS.md | ⬜ |
| GDD.md | ⬜ |
| ARCHITECTURE.md | ⬜ |
| ROADMAP.md | ⬜ |
| CODING_STYLE.md | ⬜ |
| ART_STYLE.md | ⬜ |
| GLOSSARY.md | ⬜ |
| DECISIONS.md | ⬜ |
| SYSTEMS/README.md | ⬜ |

*(Aktualizuj tę tabelę przy tworzeniu/kończeniu każdego dokumentu.)*
