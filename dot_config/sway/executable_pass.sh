#!/usr/bin/env bash

function lists_password(){ 
  gopass list -f | fzf
}

function get_username() {
  #gopass show "$PASS" login | wl-copy --trim-newline
  gopass -c "$PASS" login > /dev/null
}

function get_password() {
  gopass -c "$PASS" > /dev/null
}

function get_otp() {
  gopass otp -c "$PASS" > /dev/null
}

PASS="$(lists_password)"

while [ -n "$PASS" ];
do
RESP=$(cat <<EOF | fzf
username
password
otp
EOF
);
  
case "$RESP" in
  username)
    get_username
    ;;
  password)
    get_password
    ;;
  otp)
    get_otp
    break
    ;;
  *)
    exit 1
esac
done
fi
