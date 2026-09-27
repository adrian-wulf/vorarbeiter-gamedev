## ZASADY SILNIKA: Unity

1. Nie edytuj ręcznie plików `.meta` ani YAML scen/prefabów (`.unity`, `.prefab`,
   `.asset`) — jeśli zadanie wymaga zmian w scenie, zrób to przez MCP Unity
   albo skrypt edytora i opisz to w raporcie.
2. Nowe skrypty umieszczaj w assembly definition odpowiedniego systemu;
   testy w `Assets/Tests/EditMode|PlayMode` z własnym `.asmdef`.
3. Nie zmieniaj `ProjectSettings/` ani `Packages/manifest.json` poza zakresem
   zlecenia — każdą taką zmianę wypisz w raporcie.
4. Po zmianach uruchom `bash executor/verify.sh` — wynik (liczba testów,
   błędy kompilacji) wpisz do raportu.
5. Nie ruszaj katalogów `Library/`, `Temp/`, `Logs/`, `UserSettings/`.
