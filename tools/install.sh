#!/usr/bin/env bash
# Install awesome-australian-compliance skills into the user's Claude Code skills directory.
#
# Default behaviour symlinks every directory under skills/ into ~/.claude/skills/ so updates
# from `git pull` flow through. Pass --copy to copy instead of symlink, or --target <path> to
# install into a different directory (for example a Cursor or OpenCode skills directory).
#
# Usage:
#   ./tools/install.sh
#   ./tools/install.sh --copy
#   ./tools/install.sh --target ~/.cursor/skills
#   ./tools/install.sh --dry-run

set -euo pipefail

mode="symlink"
target="${HOME}/.claude/skills"
dry_run=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --copy)
      mode="copy"
      shift
      ;;
    --symlink)
      mode="symlink"
      shift
      ;;
    --target)
      target="$2"
      shift 2
      ;;
    --dry-run)
      dry_run=1
      shift
      ;;
    -h|--help)
      sed -n '2,12p' "$0"
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 2
      ;;
  esac
done

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
skills_dir="${repo_root}/skills"

if [[ ! -d "${skills_dir}" ]]; then
  echo "No skills directory at ${skills_dir}" >&2
  exit 1
fi

run() {
  if [[ "${dry_run}" -eq 1 ]]; then
    printf 'dry-run: %s\n' "$*"
  else
    "$@"
  fi
}

run mkdir -p "${target}"

installed=0
for skill_path in "${skills_dir}"/*/; do
  [[ -d "${skill_path}" ]] || continue
  skill_name="$(basename "${skill_path}")"
  dest="${target%/}/${skill_name}"

  if [[ -e "${dest}" || -L "${dest}" ]]; then
    if [[ -L "${dest}" ]] && [[ "$(readlink "${dest}")" == "${skill_path%/}" ]]; then
      echo "skip:    ${skill_name} already linked"
      continue
    fi
    echo "replace: ${dest}"
    run rm -rf "${dest}"
  fi

  case "${mode}" in
    symlink)
      run ln -s "${skill_path%/}" "${dest}"
      echo "linked:  ${skill_name} -> ${skill_path%/}"
      ;;
    copy)
      run cp -R "${skill_path%/}" "${dest}"
      echo "copied:  ${skill_name}"
      ;;
  esac
  installed=$((installed + 1))
done

if [[ "${installed}" -eq 0 ]]; then
  echo "No skills installed. Add skills under ${skills_dir} and re-run."
  exit 0
fi

echo
echo "Installed ${installed} skill(s) into ${target}."
echo "Restart Claude Code (or your agent) so new skills are picked up."
