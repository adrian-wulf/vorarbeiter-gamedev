#!/usr/bin/env bash
# Szablon nie może zawierać pozostałości po projekcie, z którego powstał, ani TODO/TBD.
cd "$(dirname "$0")/.." && source tests/lib.sh
hits=$(grep -rniE 'goblin|korpo|kenney|burnout|godot 4\.7' --include='*.md' --include='*.sh' --include='*.json' . \
  | grep -v '^./tests/' | grep -v '^./NOTICE' | grep -v '^./.git/' || true)
assert_eq "brak pozostałości po projekcie źródłowym" "" "$hits"
placeholders=$(grep -rn 'TODO\|TBD' --include='*.md' . | grep -v '^./tests/' | grep -v '^./.git/' || true)
assert_eq "brak TODO/TBD" "" "$placeholders"
finish
