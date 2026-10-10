#!/usr/bin/env bash
# Oliver banner — paste the print_banner() function below into any script.

print_banner() {
  local oliver=(
    ' ██████╗ ██╗     ██╗██╗   ██╗███████╗██████╗ '
    '██╔═══██╗██║     ██║██║   ██║██╔════╝██╔══██╗'
    '██║   ██║██║     ██║╚██╗ ██╔╝█████╗  ██████╔╝'
    '██║   ██║██║     ██║ ╚████╔╝ ██╔══╝  ██╔══██╗'
    '╚██████╔╝███████╗██║  ╚██╔╝  ███████╗██║  ██║'
    ' ╚═════╝ ╚══════╝╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝'
  )
  local big=(
    '  ████████████╗╗  ████████████╗╗'
    '  ████████████╗╗  ████████████╗╗'
    '████╔╔══════████╗╗████╔╔════████╗╗'
    '████╔╔══════████╗╗████╔╔════████╗╗'
    '████║║      ████║║████████████╔╔╝╝'
    '████║║      ████║║████████████╔╔╝╝'
    '████║║      ████║║████╔╔════████╗╗'
    '████║║      ████║║████╔╔════████╗╗'
    '╚╚████████████╔╔╝╝████████████╔╔╝╝'
    '╚╚████████████╔╔╝╝████████████╔╔╝╝'
    '  ╚╚══════════╝╝  ╚╚══════════╝╝  '
    '  ╚╚══════════╝╝  ╚╚══════════╝╝  '
  )
  local subtitle='Build One Ideas'
  local -a grad=(27 21 57 93 129 165)
  local right_width=45 gap=6
  local row plain right
  for ((row = 0; row < ${#big[@]}; row++)); do
    plain=''
    right=''
    if ((row >= 2 && row <= 7)); then
      plain="${oliver[row - 2]}"
      right="$(printf '\033[1;38;5;189m%s\033[0m' "$plain")"
    elif ((row == 9)); then
      plain="$(printf '%*s%s' "$((right_width - ${#subtitle}))" '' "$subtitle")"
      right="$(printf '\033[38;5;189m%s\033[0m' "$plain")"
    fi
    printf '\033[38;5;%dm%s\033[0m' "${grad[row / 2]}" "${big[row]}"
    printf '%*s' "$gap" ''
    printf '%s\n' "$right"
  done
}

# --- demo ---
print_banner
echo
echo "  Oliver's script — description line goes here"
