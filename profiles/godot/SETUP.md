# SETUP — środowisko agenta dla Godota

## 1. Godot

- Zainstaluj Godota 4.x i upewnij się, że komenda `godot` jest w `PATH`
  (albo ustaw zmienną `GODOT=/ścieżka/do/godot` dla `executor/verify.sh`).
- Sprawdź: `godot --version`.

## 2. MCP Godota dla wykonawcy (opcjonalne, zalecane)

MCP pozwala wykonawcy widzieć realny stan edytora (drzewo sceny, błędy,
zrzuty). Wybierz jeden serwer MCP dla Godota (np. `godot-ai` z PyPI albo
inny z listy „Godot MCP” na GitHubie) i zainstaluj go wg jego README.
Rejestracja w agy:

```bash
agy mcp add <nazwa> <komenda-serwera> [argumenty...]
agy mcp list        # sprawdź, czy jest „enabled”
```

Weryfikacja: `bash executor/run.sh` z krótkim zleceniem w trybie `read`:
„Użyj MCP Godota i podaj wersję silnika oraz nazwę projektu”.

## 3. Skille dla agy

Skille dla wykonawcy kładź w `.agents/skills/<nazwa>/SKILL.md` w repo
projektu. Przydatne dla Godota: wzorce GDScript (sygnały, sceny, maszyny
stanów), podstawy gier 2D/3D. Każdy skill przejrzyj przed dodaniem —
wykonawca potraktuje go jak instrukcję.

## 4. Claude Code (kierownik)

Kierownik nie potrzebuje MCP do weryfikacji — wystarczy
`bash executor/verify.sh` i uruchomienie gry w oknie (patrz `ui-check.md`).
Jeśli masz MCP Godota także w Claude Code, możesz go użyć do zrzutów ekranu.
