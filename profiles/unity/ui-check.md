# Weryfikacja UI — Unity

Testy EditMode nie wystarczą dla zadań z UI, kamerą ani wejściem.

1. Test PlayMode, który ładuje scenę, ustawia rozdzielczość inną niż
   referencyjna (`Screen.SetResolution`) i po kilku klatkach robi zrzut:
   `ScreenCapture.CaptureScreenshot("Temp/shot.png")`.
   Uruchamiany BEZ `-nographics`, np.:
   ```bash
   "$UNITY" -batchmode -projectPath . -runTests -testPlatform PlayMode -testFilter <NazwaTestu>
   ```
2. Alternatywnie zrzut przez MCP Unity.
3. Obejrzyj zrzut (Claude Code czyta obrazy przez Read) — układ, skalowanie
   Canvas, czytelność tekstów.
4. Sterowanie testuj zdarzeniami wejścia (Input System: `InputTestFixture`).
