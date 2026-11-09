#!/usr/bin/env bash
# Regenera la tabla de actividad del README del perfil con la API de GitHub.
set -euo pipefail

ORG="${ORG:-Open-Cosmic-Project}"
README="${README:-profile/README.md}"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

# REPOS_JSON permite probar el script sin red (archivo con el JSON de la API).
if [ -n "${REPOS_JSON:-}" ]; then
  cp "$REPOS_JSON" "$TMP/repos.json"
else
  gh api "orgs/$ORG/repos?per_page=100&type=public" --paginate > "$TMP/repos.json"
fi

{
  echo "| Repositorio | Descripción | Lenguaje principal | Último push |"
  echo "|---|---|---|---|"
  jq -r '.[] | select(.name != ".github")
         | [.name, (.description // ""), (.language // "—"), .pushed_at] | @tsv' "$TMP/repos.json" \
  | sort -t$'\t' -k4 -r \
  | while IFS=$'\t' read -r nombre desc lang push; do
      desc="${desc//|/\\|}"
      printf '| [%s](https://github.com/%s/%s) | %s | %s | %s |\n' \
        "$nombre" "$ORG" "$nombre" "$desc" "$lang" "${push%%T*}"
    done
} > "$TMP/bloque.md"

awk -v f="$TMP/bloque.md" '
  /<!-- REPOS:START -->/ { print; while ((getline l < f) > 0) print l; skip = 1; next }
  /<!-- REPOS:END -->/   { skip = 0 }
  !skip { print }
' "$README" > "$TMP/nuevo.md"

cat "$TMP/nuevo.md" > "$README"
