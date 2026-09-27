# Weryfikacja UI — Godot

Testy headless nie wystarczą dla zadań z UI, kamerą ani wejściem.

1. Uruchom scenę w oknie **o rozmiarze innym niż bazowa kanwa** (błędy
   skalowania/anchorów wychodzą tylko wtedy):
   ```bash
   godot --path . --resolution 1600x900 res://<ścieżka>/scena.tscn
   ```
2. Zrzut ekranu:
   - przez MCP Godota (narzędzie do screenshotu edytora/gry), albo
   - testem `extends SceneTree`, który po kilku klatkach zapisuje
     `get_root().get_texture().get_image().save_png("user://shot.png")`
     (uruchamiany BEZ `--headless`).
3. Obejrzyj zrzut (Claude Code czyta obrazy przez Read) — sprawdź układ,
   czytelność tekstów, nachodzenie elementów.
4. Skróty klawiszowe i sterowanie testuj prawdziwymi zdarzeniami wejścia
   (`Input.parse_input_event`) z całą sceną — wychwytuje konflikty handlerów.
