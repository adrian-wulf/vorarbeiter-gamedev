# SYSTEMS/

Ten folder zawiera osobne, małe dokumenty `.md` dla każdego kluczowego
systemu gry — zamiast jednego wielkiego dokumentu. Dzięki temu agentowi
LLM łatwiej wrzucić do kontekstu tylko to, co potrzebne do konkretnego
zadania, bez zaśmiecania go resztą projektu.

## Kiedy tworzyć nowy plik tutaj

Przy rozpoczynaniu pracy nad nowym, samodzielnym systemem. Plik powstaje
**przy pracy nad danym systemem**, nie na zapas.

## Konwencja nazywania

`SYSTEM_<nazwa>.md`, np.:

- `SYSTEM_inventory.md` — ekwipunek, sloty, stackowanie
- `SYSTEM_combat.md` — obrażenia, trafienia, statusy
- `SYSTEM_save.md` — format zapisu, wersjonowanie, migracje

## Co powinien zawierać dokument systemu

- Krótki opis odpowiedzialności systemu (co robi, czego NIE robi).
- Kluczowe dane/struktury używane przez system.
- Główne sygnały/zdarzenia wysyłane i odbierane (lokalne vs globalne —
  zgodnie z `ARCHITECTURE.md`).
- Zależności od innych systemów.
- Jak go testować.
- Otwarte pytania/decyzje do podjęcia.
