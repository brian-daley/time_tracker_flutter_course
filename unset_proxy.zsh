#!/bin/zsh -x
setopt NO_RCS

if [[ -o login ]]; then
  print yes
else
  print no
fi

if [[ ! -o norcs ]]; then
  print yes
else
  print no
fi

unset HTTPS_PROXY
unset HTTPS_PROXY
unset HTTP_PROXY
unset NO_PROXY
unset _JAVA_OPTIONS
unset http_proxy
unset https_proxy
unset no_proxy
export no_proxy="github.com|127.0.0.1|localhost"
export _JAVA_OPTIONS="-Dhttp.nonProxyHosts=github.com|127.0.0.1|localhost"
