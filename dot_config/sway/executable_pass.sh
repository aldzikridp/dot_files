#!/usr/bin/env bash

PASSWORD_STORE_PATH="${PASSWORD_STORE_DIR:-$HOME/.password-store}"
WHICH_PATH="$(find "$PASSWORD_STORE_PATH" -maxdepth 1 -type d -exec realpath --relative-to "$PASSWORD_STORE_PATH" {} \; | sed '/^\./d' | fzf)"

if [[ -z $WHICH_PATH ]]; then
  exit 1
fi

function lists_password(){ 
  find "${PASSWORD_STORE_PATH}/${WHICH_PATH}" -name '*.gpg' -exec realpath --relative-to "${PASSWORD_STORE_PATH}" {} \; | sed "s/\.gpg$//" | fzf
}

function get_username() {
  pass show "$PASS" | sed -e '2 !d' -e "s/^login:\ //" | wl-copy --trim-newline
}

function get_password() {
  pass show "$PASS" | head -1 | wl-copy --trim-newline
}

PASS="$(lists_password)"

IS_OTP="$(pass show "$PASS" | head -1 | grep '^otpauth:\/\/' | wc -l)"
if [[ $IS_OTP -eq 1 ]]; then
  pass otp "$PASS" | wl-copy --trim-newline
else

while [ -n "$PASS" ];
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
fi
