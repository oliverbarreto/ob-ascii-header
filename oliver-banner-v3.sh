#!/usr/bin/env bash
# Oliver banner v3 — concept: left wordmark "B1 💡" in the f.note green palette.

print_banner() {
  local oliver=(
    ' ██████╗ ██╗     ██╗██╗   ██╗███████╗██████╗ '
    '██╔═══██╗██║     ██║██║   ██║██╔════╝██╔══██╗'
    '██║   ██║██║     ██║╚██╗ ██╔╝█████╗  ██████╔╝'
    '██║   ██║██║     ██║ ╚████╔╝ ██╔══╝  ██╔══██╗'
    '╚██████╔╝███████╗██║  ╚██╔╝  ███████╗██║  ██║'
    ' ╚═════╝ ╚══════╝╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝'
  )
  local b1=(
    '██████╗  ██╗'
    '██╔══██╗███║'
    '██████╔╝╚██║'
    '██╔══██╗ ██║'
    '██████╔╝ ██║'
    '╚═════╝  ╚═╝'
  )
  local emoji='💡'
  local emoji_row=3
  local subtitle='Build One Ideas'
  local -a grad=(
    '62;107;92'
    '62;107;92'
    '94;143;124'
    '236;238;234'
    '87;183;142'
    '87;183;142'
  )
  local left_width=15 gap=2 right_width=45
  local row right i plain_w
  for ((row = 0; row < 8; row++)); do
    right=''
    if ((row <= 5)); then
      right="$(printf '\033[1;38;5;189m%s\033[0m' "${oliver[row]}")"
    elif ((row == 7)); then
      right="$(printf '\033[38;5;189m%*s%s\033[0m' "$((right_width - ${#subtitle}))" '' "$subtitle")"
    fi
    if ((row >= 1 && row <= 6)); then
      i=$((row - 1))
      plain_w=${#b1[i]}
      printf '\033[38;2;%sm%s\033[0m' "${grad[i]}" "${b1[i]}"
      if ((i == emoji_row)); then
        printf ' %s' "$emoji"
        plain_w=$((plain_w + 3))
      fi
      printf '%*s' "$((left_width + gap - plain_w))" ''
    else
      printf '%*s' "$((left_width + gap))" ''
    fi
    printf '%s\n' "$right"
  done
}

# --- demo ---
print_banner
echo
echo "  Oliver's script — description line goes here"
