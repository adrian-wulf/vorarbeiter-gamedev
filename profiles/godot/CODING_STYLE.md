# CODING_STYLE.md — {{TYTUL}}

> Konwencje kodu GDScript dla tego projektu. Trzymaj się ich konsekwentnie
> — jeśli napotkasz istniejący kod niezgodny z tym dokumentem, popraw go
> przy okazji zamiast dodawać kolejną niespójność.

<!-- kickoff: szablon z profilu Godot. Dopasuj do odpowiedzi użytkownika (typizacja, komentarze, testy). -->

## 1. Typizacja

**Statyczna typizacja wszędzie, gdzie to możliwe.**

```gdscript
# Dobrze
var health: int = 100
func get_speed() -> float:
	return _speed

# Źle — unikaj
var health = 100
func get_speed():
	return _speed
```

Typuj: zmienne, parametry funkcji, wartości zwracane, argumenty sygnałów.
`var x := SomeClass.new()` (inferencja przy jawnej inicjalizacji) jest
akceptowalna i preferowana zamiast powtarzania typu.

## 2. Nazewnictwo

Zgodnie z oficjalnym stylem Godota:

| Element | Konwencja | Przykład |
|---|---|---|
| Pliki skryptów i scen | snake_case | `player_controller.gd`, `main_menu.tscn` |
| Zmienne, parametry, funkcje | snake_case | `target_cell`, `func take_damage():` |
| Sygnały | snake_case, czas przeszły dla zdarzeń | `signal health_changed` |
| Klasy (`class_name`) | PascalCase | `class_name PlayerController` |
| Nazwy węzłów w scenie | PascalCase | `HealthComponent` |
| Stałe | ALL_CAPS_SNAKE_CASE | `const MAX_SPEED := 200.0` |
| Prywatne zmienne/metody | prefiks `_` | `_speed`, `func _update_state():` |

## 3. Dokumentacja funkcji

Każda **publiczna** funkcja dostaje docstring `##` nad definicją — co robi,
nie jak działa w środku:

```gdscript
## Zadaje obrażenia i emituje health_changed.
## Zwraca false, jeśli cel jest już martwy.
func take_damage(amount: int) -> bool:
	...
```

Prywatne funkcje (`_`) nie wymagają docstringa, chyba że logika jest
nieoczywista.

## 4. Struktura skryptu

1. `class_name` i `extends`
2. Sygnały
3. `@export` zmienne
4. Stałe
5. Zmienne publiczne
6. Zmienne prywatne (`_`)
7. Wbudowane callbacki (`_ready`, `_process`, `_physics_process`, `_exit_tree`)
8. Metody publiczne
9. Metody prywatne (`_`)

## 5. Sygnały vs bezpośrednie wywołania

Zgodnie z `ARCHITECTURE.md`: lokalne, powiązane węzły komunikują się
sygnałami; zdarzenia międzysystemowe idą przez globalny event bus.
Nie sięgaj „z góry drzewa” w dół po niepowiązane systemy — preferuj
sygnały i wstrzykiwanie zależności. Połączenia i zasoby sprzątaj
w `_exit_tree`.

## 6. Komentarze

- Komentarz wyjaśnia **dlaczego**, nie **co**.
- Rzeczy do zrobienia nie zostają w kodzie — trafiają do `ROADMAP.md`
  albo `DECISIONS.md`.

## 7. Formatowanie

- Wcięcia: taby (domyślne w Godocie).
- Długość linii: ok. 100 znaków (miękki limit).
- Jedna pusta linia między metodami, dwie między głównymi sekcjami pliku.

## 8. Testy

- Bez addonów na start: skrypt testowy `extends SceneTree` w podfolderze
  `tests/` danego systemu, np. `player/tests/test_player_controller.gd`.
- Test drukuje `ALL TESTS PASSED` i kończy `quit(0)`, przy porażce `quit(1)`.
- Czas w testach sterowany ręcznie (np. metoda `advance(delta)` przy
  wyłączonym `_physics_process`) — testy muszą być deterministyczne.
- Test nie może zostawiać wycieków przy wyjściu (węzły zwalniane
  `free()`/`queue_free()`); `executor/verify.sh` traktuje wyciek jak porażkę.
- Wszystkie testy: `bash executor/verify.sh`.
