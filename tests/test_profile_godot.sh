#!/usr/bin/env bash
# profiles/godot/verify.sh: uruchamia testy headless, łapie porażki i ostrzeżenia przy wyjściu.
cd "$(dirname "$0")/.." && source tests/lib.sh
command -v "${GODOT:-godot}" >/dev/null || { echo "SKIP: brak godot w PATH"; exit 0; }
V="$PWD/profiles/godot/verify.sh"
P=$(mktemp -d); mkdir -p "$P/core/tests"
printf 'config_version=5\n\n[application]\nconfig/name="t"\n' > "$P/project.godot"
printf 'extends SceneTree\nfunc _init() -> void:\n\tprint("ALL TESTS PASSED")\n\tquit(0)\n' > "$P/core/tests/test_ok.gd"
out=$(cd "$P" && bash "$V" 2>&1); rc=$?
assert_eq "zielony test → 0" 0 "$rc"
assert_contains "wypisuje wynik" "ok   ./core/tests/test_ok.gd" "$out"
printf 'extends SceneTree\nfunc _init() -> void:\n\tquit(1)\n' > "$P/core/tests/test_fail.gd"
(cd "$P" && bash "$V" >/dev/null 2>&1); assert_eq "czerwony test → 1" 1 $?
rm "$P/core/tests/test_fail.gd"
printf 'extends SceneTree\nfunc _init() -> void:\n\tvar n := Node.new()\n\tquit(0)\n' > "$P/core/tests/test_leak.gd"
out=$(cd "$P" && bash "$V" 2>&1); rc=$?
assert_eq "wyciek przy wyjściu → 1" 1 "$rc"
assert_contains "wyciek zgłoszony" "WARN→FAIL" "$out"
P2=$(mktemp -d); printf 'config_version=5\n' > "$P2/project.godot"
(cd "$P2" && bash "$V" >/dev/null 2>&1); assert_eq "brak testów → 1" 1 $?
finish
