# ARCHITECTURE.md — {{TYTUL}}

<!-- kickoff: jak zbudowany jest projekt. Agent czyta to przed każdym zadaniem technicznym.
Każda decyzja z uzasadnieniem w 1 zdaniu; szczegóły → DECISIONS.md. -->

## 1. Stack techniczny

<!-- kickoff: silnik + wersja, język, platforma docelowa, 2D/3D. -->

## 2. Struktura projektu

<!-- kickoff: drzewo folderów (blok kodu) z komentarzem przy każdym katalogu.
Domyślna rekomendacja: organizacja według funkcji/systemu (feature-based), nie według typu pliku —
agent widzi pełny kontekst systemu w jednym miejscu. -->

## 3. Warstwa danych

<!-- kickoff: jak definiujemy dane gry (zasoby silnika / pliki JSON / arkusze), gdzie leżą, kto je ładuje. -->

## 4. Zapis i wczytywanie gry

<!-- kickoff: format (JSON/binarny/zasoby silnika), wersjonowanie, gdzie zapisujemy, kiedy (autozapis). -->

## 5. Pętla symulacji

<!-- kickoff: stały deterministyczny tick czy klatka; ile ticków/s; co jest symulacją, a co prezentacją. -->

## 6. Przestrzeń gry

<!-- kickoff: siatka (rozmiar komórki) czy swobodne pozycjonowanie; warstwy mapy; pathfinding. -->

## 7. Komunikacja między systemami

<!-- kickoff: sygnały/eventy lokalne vs globalny event bus; zasada, kiedy które. -->

## 8. Architektura encji

<!-- kickoff: węzły/obiekty + komponenty; dziedziczenie vs kompozycja; przykłady encji z GDD. -->

## 9. AI

<!-- kickoff: maszyna stanów / drzewa zachowań / utility; jak encja wybiera, co robić. -->

## 10. Addony i zależności

<!-- kickoff: lista zależności z uzasadnieniem; zasada: nowa zależność tylko za zgodą użytkownika. -->

## 11. Jak uruchomić / testować

<!-- kickoff: DOKŁADNE komendy: uruchomienie gry, jeden test, wszystkie testy (= bash executor/verify.sh),
konwencja testów (gdzie leżą, jak nazwane, jak sterować czasem w testach). -->

## 12. Środowisko agenta

<!-- kickoff: przepisz najważniejsze z profiles/<silnik>/SETUP.md i ui-check.md (profile zostaną usunięte):
MCP silnika, skille wykonawcy, jak zweryfikować UI w oknie i zrobić zrzut ekranu. -->

## 13. Otwarte pytania / do ustalenia później
