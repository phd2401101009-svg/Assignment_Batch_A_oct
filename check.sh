#!/usr/bin/env bash
# IC151 — Lab A1a. Builds each question, runs five cases against it, and reports
# exactly which ones pass. Boundary cases are in there on purpose.

set -u

compiler="${CXX:-g++}"
binary=".ic151-laba1a-check"
trap 'rm -f "$binary"' EXIT

total_pass=0
total_cases=0
scoreboard=""
still_failing=""

# question <source> <keyword it has to use, or "">
# Cases arrive on stdin, one "input|expected output" per line.
question() {
  local src="$1" needs="$2" cases input expected actual shown pass=0 count=0 note="" hint=""

  # Read the case table before anything can go wrong, so a question that does not
  # build still reports how many cases it was going to be marked out of.
  cases="$(cat)"
  count="$(printf '%s\n' "$cases" | grep -c '|')"

  printf '=== %s ===\n' "$src"

  if [ ! -f "$src" ]; then
    note="not found — run this check from inside the assignment folder"
  # ponytail: plain grep, so the keyword inside a comment would also count.
  elif [ -n "$needs" ] && ! grep -qE "(^|[^A-Za-z0-9_])${needs}([^A-Za-z0-9_]|$)" "$src"; then
    note="has to use a ${needs} — see README.md"
  elif ! "$compiler" -std=c++17 -Wall -Wextra -pedantic "$src" -o "$binary" 2>/dev/null; then
    note="did not compile as C++17"
    hint="$(printf '%s -std=c++17 -Wall -Wextra -pedantic %s -o q' "$compiler" "$src")"
  fi

  if [ -n "$note" ]; then
    printf '  %s\n' "$note"
    [ -n "$hint" ] && printf '  Build it yourself to see the errors:\n    %s\n' "$hint"
    printf '  0 of %d cases passed\n\n' "$count"
    scoreboard="${scoreboard}  ${src}   0 of ${count}   (${note})"$'\n'
    still_failing="${still_failing}  ${src}  all ${count} cases: ${note}"$'\n'
    total_cases=$((total_cases + count))
    return
  fi

  while IFS='|' read -r input expected; do
    [ -n "$input" ] || continue
    actual="$(printf '%s\n' "$input" | "./$binary" 2>&1)" || actual="<the program crashed>"
    if [ "$actual" = "$expected" ]; then
      pass=$((pass + 1))
      printf '  pass  input %-16s -> %s\n' "$input" "$expected"
    else
      # A program that prints more than one line -- a switch case missing its break,
      # say -- would otherwise wreck the column layout and hide what went wrong.
      shown="${actual//$'\n'/ ⏎ }"
      printf '  FAIL  input %-16s -> expected %-16s got %s\n' "$input" "$expected" "$shown"
      still_failing="${still_failing}  ${src}  input ${input}  ->  expected ${expected}, got ${shown}"$'\n'
    fi
  done <<< "$cases"

  printf '  %d of %d cases passed\n\n' "$pass" "$count"
  scoreboard="${scoreboard}  ${src}   ${pass} of ${count}"$'\n'
  total_pass=$((total_pass + pass))
  total_cases=$((total_cases + count))
  rm -f "$binary"
}

question q1.cpp "" <<'CASES'
3 10 0|NORMAL
9 10 0|NORMAL
9.5 10 0|WARNING
12 10 0|TRIP
-0.5 10 1|INVALID
CASES

question q2.cpp "" <<'CASES'
10 20 14|BELOW
10 20 15|EQUAL
10 20 16|ABOVE
3 4 3|BELOW
-4 4 0|EQUAL
CASES

question q3.cpp "" <<'CASES'
12 4|DIVISIBLE
13 4|NOT DIVISIBLE
-9 3|DIVISIBLE
0 5|DIVISIBLE
7 0|INVALID
CASES

echo "=== summary ==="
printf '%s' "$scoreboard"
printf '  ------------------\n'
printf '  TOTAL   %d of %d cases passed\n' "$total_pass" "$total_cases"

if [ "$total_pass" -eq "$total_cases" ]; then
  printf '\nPASS: all %d cases\n' "$total_cases"
  exit 0
fi

printf '\nStill failing:\n'
printf '%s' "$still_failing"
printf '\nFAIL: %d of %d cases still to fix\n' "$((total_cases - total_pass))" "$total_cases" >&2
exit 1
