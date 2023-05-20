#!/usr/bin/env bash

function get_username() {
  pass show "$PASS" | rg login: | sed "s/^login:\ //" | wl-copy -o --trim-newline
}

function get_password() {
  pass show "$PASS" | head -1 | wl-copy -o --trim-newline
}

PASS=$(fd --regex ".gpg$" --base-directory ~/.password-store/ | sed "s/.gpg$//" | fzf)

while true;
do
RESP=$(cat <<EOF | fzf
username
password
EOF
);

  case "$RESP" in
    username)
      get_username
      ;;
    password)
      get_password
      break
      ;;
    *)
      exit 1
  esac
done
