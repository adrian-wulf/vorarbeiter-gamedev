## ZASADY SILNIKA: Godot

1. W kodzie gry nie odwołuj się do globalnej nazwy autoloadu — pobieraj go
   przez `get_node("/root/<Nazwa>")` albo wstrzykuj referencję (ułatwia testy).
2. Każde połączenie sygnału do obiektu spoza węzła i każdy zasób sprzątaj
   w `_exit_tree`.
3. Testy dodawaj w `<system>/tests/test_*.gd` (extends SceneTree) i uruchamiaj
   `bash executor/verify.sh` — wynik (liczba testów, ostrzeżenia) wpisz do raportu.
4. Nie edytuj katalogu `.godot/` ani plików `*.import`.
5. Nie zmieniaj `project.godot` (autoloady, input map, ustawienia) poza
   zakresem zlecenia — jeśli musisz, wypisz każdą zmianę w raporcie.
6. Sceny `.tscn` edytuj ostrożnie: zachowuj istniejące `uid` i `ExtResource`.
