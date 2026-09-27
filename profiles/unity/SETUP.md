# SETUP — środowisko agenta dla Unity

## 1. Unity

- Zainstaluj Unity (przez Unity Hub) w wersji zapisanej w `ARCHITECTURE.md`.
- `executor/verify.sh` potrzebuje ścieżki do edytora: ustaw
  `UNITY=/ścieżka/do/Unity` (Linux: `~/Unity/Hub/Editor/<wersja>/Editor/Unity`,
  Windows: `C:\Program Files\Unity\Hub\Editor\<wersja>\Editor\Unity.exe`,
  macOS: `/Applications/Unity/Hub/Editor/<wersja>/Unity.app/Contents/MacOS/Unity`).
- Zainstaluj Git LFS (`git lfs install`) — `.gitattributes` kieruje przez
  LFS binarne assety.
- Testy batchmode nie mogą działać, gdy ten sam projekt jest otwarty
  w edytorze — zamknij edytor przed `executor/verify.sh`.

## 2. MCP Unity dla wykonawcy (opcjonalne, zalecane)

MCP pozwala wykonawcy edytować sceny i prefaby przez edytor zamiast przez
ręczną edycję YAML. Wybierz serwer MCP dla Unity (np. pakiet „Unity MCP”
instalowany przez Package Manager) i skonfiguruj go wg jego README.
Rejestracja w agy:

```bash
agy mcp add <nazwa> <komenda-lub-URL-serwera> [argumenty...]
agy mcp list        # sprawdź, czy jest „enabled”
```

## 3. Skille dla agy

Skille dla wykonawcy kładź w `.agents/skills/<nazwa>/SKILL.md` w repo
projektu (wzorce C#/Unity, architektura komponentów). Każdy skill przejrzyj
przed dodaniem.
