#!/usr/bin/env bash

function get_username() {
  pass show "$PASS" | rg login: | sed "s/login:\ //" | wl-copy
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
      pass show -c "$PASS" > /dev/null
      break
      ;;
    *)
      exit 1
  esac
done
