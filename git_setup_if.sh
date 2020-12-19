# cant run as root
if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "Do not execute as root"
    exit
fi

git config user.name ruivaldo.lobao
git config user.email ruivaldo.lobao@ifbaiano.edu.br
git config credential.helper cache
git config credential.helper 'cache --timeout=9003600'
git config core.autocrlf false
git config core.safecrlf false
git config color.ui true
git config format.pretty oneline
git config core.autocrlf false
git config push.default simple
git config http.postbuffer 1048576000
git config core.compression 0
