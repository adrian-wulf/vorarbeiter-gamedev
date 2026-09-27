#!/usr/bin/env bash
# Weryfikacja projektu Godot: wszystkie testy <feature>/tests/test_*.gd headless + wykrywanie ostrzeżeń.
# Kontrakt: exit 0 = wszystkie testy zielone i bez ostrzeżeń przy wyjściu.
set -uo pipefail
GODOT="${GODOT:-godot}"
command -v "$GODOT" >/dev/null || { echo "Brak Godota ($GODOT) w PATH — ustaw zmienną GODOT" >&2; exit 1; }
rc=0; n=0
while IFS= read -r t; do
  n=$((n+1))
  out=$("$GODOT" --headless --path . --script "res://${t#./}" 2>&1); code=$?
  if [[ $code -ne 0 ]]; then
    echo "FAIL $t (exit $code)"; echo "$out" | tail -20; rc=1
  elif grep -Eq 'ObjectDB instances? (was |were )?leaked|leaked at exit|still in use|SCRIPT ERROR' <<<"$out"; then
    echo "WARN→FAIL $t"; grep -E 'leaked|still in use|SCRIPT ERROR' <<<"$out"; rc=1
  else
    echo "ok   $t"
  fi
done < <(find . -path ./.godot -prune -o -path ./addons -prune -o -path '*/tests/test_*.gd' -print | sort)
echo "Testów: $n"
(( n == 0 )) && { echo "Brak testów (*/tests/test_*.gd) — nie ma czego zweryfikować." >&2; exit 1; }
exit $rc
