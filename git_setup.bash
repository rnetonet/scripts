# cant run as root
if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "Do not execute as root"
    exit
fi

git config --global user.name rnetonet
git config --global user.email rneto@rneto.net
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=9003600'
git config --global core.autocrlf false
git config --global core.safecrlf false
git config --global color.ui true
git config --global format.pretty oneline
git config --global core.autocrlf false
git config --global push.default simple
git config --global http.postbuffer 1048576000
git config --global core.compression 0
