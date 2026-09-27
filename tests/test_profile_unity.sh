#!/usr/bin/env bash
# profiles/unity/verify.sh na atrapie edytora: parsowanie XML wyników i błędów kompilacji.
cd "$(dirname "$0")/.." && source tests/lib.sh
V="$PWD/profiles/unity/verify.sh"; T=$(mktemp -d); export UNITY="$T/unity"
fake() { # $1 = failed, $2 = linia do logu
  cat > "$UNITY" <<F
#!/usr/bin/env bash
while [[ \$# -gt 0 ]]; do case "\$1" in -testResults) xml="\$2"; shift;; -logFile) log="\$2"; shift;; esac; shift; done
echo '$2' > "\$log"
echo '<test-run total="5" passed="5" failed="$1">' > "\$xml"
F
  chmod +x "$UNITY"; }
fake 0 "Build ok";                     out=$(cd "$T" && bash "$V" 2>&1); assert_eq "zielone → 0" 0 $?
assert_contains "podsumowanie" "EditMode: 5 testów, 0 nieudanych" "$out"
fake 2 "Build ok";                     (cd "$T" && bash "$V" >/dev/null 2>&1); assert_eq "nieudane testy → 1" 1 $?
fake 0 "Assets/A.cs(3,1): error CS1002: ; expected"; out=$(cd "$T" && bash "$V" 2>&1); rc=$?
assert_eq "błąd kompilacji → 1" 1 "$rc"; assert_contains "wypisuje błąd" "error CS1002" "$out"
UNITY="$T/nie-ma" bash "$V" >/dev/null 2>&1; assert_eq "brak edytora → 1" 1 $?
fake_total0() { cat > "$UNITY" <<'F'
#!/usr/bin/env bash
while [[ $# -gt 0 ]]; do case "$1" in -testResults) xml="$2"; shift;; -logFile) log="$2"; shift;; esac; shift; done
echo ok > "$log"; echo '<test-run total="0" passed="0" failed="0">' > "$xml"
F
chmod +x "$UNITY"; }
fake_total0; (cd "$T" && bash "$V" >/dev/null 2>&1); assert_eq "zero testów → 1" 1 $?
# BSD/macOS mktemp nie zna --suffix
fake 0 "Build ok"; BSD=$(mktemp -d)
printf '#!/usr/bin/env bash\n[[ "$*" == *--suffix* ]] && { echo "mktemp: illegal option" >&2; exit 1; }\nexec %s "$@"\n' "$(command -v mktemp)" > "$BSD/mktemp"; chmod +x "$BSD/mktemp"
(cd "$T" && PATH="$BSD:$PATH" bash "$V" >/dev/null 2>&1); assert_eq "działa z BSD mktemp" 0 $?
finish
