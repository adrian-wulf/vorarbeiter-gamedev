# CODING_STYLE.md — {{TYTUL}}

> Konwencje kodu C# (Unity) dla tego projektu. Trzymaj się ich konsekwentnie
> — jeśli napotkasz istniejący kod niezgodny z tym dokumentem, popraw go
> przy okazji zamiast dodawać kolejną niespójność.

<!-- kickoff: szablon z profilu Unity. Dopasuj do odpowiedzi użytkownika. -->

## 1. Nazewnictwo

| Element | Konwencja | Przykład |
|---|---|---|
| Klasy, struktury, enumy, metody, właściwości | PascalCase | `PlayerController`, `TakeDamage()` |
| Interfejsy | `I` + PascalCase | `IDamageable` |
| Pola prywatne | `_camelCase` | `_currentHealth` |
| Pola serializowane | `[SerializeField] private` + `_camelCase` | `[SerializeField] private float _speed;` |
| Parametry, zmienne lokalne | camelCase | `targetPosition` |
| Stałe | PascalCase | `const int MaxPlayers = 4;` |
| Zdarzenia | PascalCase, czas przeszły | `public event Action<int> HealthChanged;` |
| Pliki | nazwa pliku = nazwa klasy | `PlayerController.cs` |

## 2. Zasady

- Pola publiczne tylko wyjątkowo — do inspektora `[SerializeField] private`.
- Dane gry (statystyki, przedmioty, konfiguracja) w `ScriptableObject`.
- Referencje pobieraj raz (`Awake`/`Start`) — nigdy `GetComponent`/`Find`
  w `Update`.
- Subskrypcje zdarzeń: `OnEnable` ↔ `OnDisable` (zawsze para).
- Kod podzielony na assembly definitions (`.asmdef`) per system; testy we
  własnych asmdef.
- `namespace` odpowiada folderowi systemu.

## 3. Dokumentacja

Publiczne API: komentarz XML `/// <summary>` — co robi, nie jak.

## 4. Struktura klasy

1. Pola serializowane
2. Pola prywatne
3. Właściwości i zdarzenia
4. Callbacki Unity (`Awake`, `OnEnable`, `Start`, `Update`, `OnDisable`, `OnDestroy`)
5. Metody publiczne
6. Metody prywatne

## 5. Komentarze

- Komentarz wyjaśnia **dlaczego**, nie **co**.
- Rzeczy do zrobienia nie zostają w kodzie — trafiają do `ROADMAP.md`
  albo `DECISIONS.md`.

## 6. Testy

- Unity Test Framework (NUnit): `Assets/Tests/EditMode/` i
  `Assets/Tests/PlayMode/`, każdy z własnym `.asmdef`.
- Logika gry możliwie w czystych klasach C# (testowalnych w EditMode);
  `MonoBehaviour` jako cienka warstwa.
- Wszystkie testy: `bash executor/verify.sh`.
