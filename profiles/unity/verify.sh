#!/usr/bin/env bash
# Weryfikacja projektu Unity: testy EditMode + PlayMode w batchmode, wynik z XML (NUnit).
# UWAGA: niezweryfikowane na żywo przy tworzeniu szablonu — przy pierwszym użyciu sprawdź ścieżki i flagi.
# Kontrakt: exit 0 = wszystkie testy zielone, brak błędów kompilacji.
set -uo pipefail
UNITY="${UNITY:-unity-editor}"
command -v "$UNITY" >/dev/null || [[ -x "$UNITY" ]] || { echo "Ustaw UNITY=/ścieżka/do/Unity (np. ~/Unity/Hub/Editor/<wersja>/Editor/Unity)" >&2; exit 1; }
rc=0
for platform in EditMode PlayMode; do
  xml="$(mktemp --suffix=.xml)"; log="$(mktemp)"
  "$UNITY" -batchmode -nographics -projectPath . -runTests -testPlatform "$platform" \
    -testResults "$xml" -logFile "$log"; code=$?
  if grep -Eq 'error CS[0-9]+' "$log"; then
    echo "Błędy kompilacji ($platform):"; grep -E 'error CS[0-9]+' "$log" | sort -u; rc=1; continue
  fi
  if [[ ! -s "$xml" ]]; then
    echo "FAIL $platform: brak pliku wyników (exit $code)"; tail -30 "$log"; rc=1; continue
  fi
  total=$(grep -o 'total="[0-9]*"' "$xml" | head -1 | grep -o '[0-9]*')
  failed=$(grep -o 'failed="[0-9]*"' "$xml" | head -1 | grep -o '[0-9]*')
  echo "$platform: ${total:-?} testów, ${failed:-?} nieudanych"
  [[ "${failed:-1}" == 0 ]] || rc=1
done
exit $rc
