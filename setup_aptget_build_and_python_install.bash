
# dump commands
set -x

#
# apt-get
#

# Update apt-get and install basic development packages
sudo echo
sudo apt-get update -y
sudo apt-get full-upgrade -y

sudo apt-get install -y autoconf bison build-essential curl freetds-dev gfortran ghostscript libatlas-base-dev libblas-dev libbz2-dev libcairo2 libcups2 libdbus-glib-1-2 libffi-dev libfreetype6-dev libgdbm-dev libgdk-pixbuf2.0-0 libglu1-mesa libhdf5-dev libjpeg-dev liblapack-dev libldap2-dev liblzma-dev libncurses5-dev libpango-1.0-0 libpangocairo-1.0-0 libpq-dev libreadline-dev libreadline6-dev libsasl2-dev libsm6 libsqlite3-dev libssl-dev libxinerama1 libxml2-dev libxmlsec1-dev libxslt1-dev libyaml-dev llvm make shared-mime-info tk-dev wget xz-utils zlib1g-dev libclang-dev python-dev python3-dev

sudo apt-get install -y make binutils gcc build-essential \
 git curl zlib1g-dev openssl libssl-dev libreadline-dev \
 libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev \
 software-properties-common wget dnsutils vim zip unzip htop \
 libffi-dev redis-server libxrender1 apt-transport-https ca-certificates curl software-properties-common postgresql-client libpq-dev libreoffice libreoffice-l10n-pt-br

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

sudo apt-get install -y curl ca-certificates gnupg

# docker keys
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# postgresql keys
curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# update
sudo apt-get update -y

# install postgresql 12 and docker
sudo apt-get install -y postgresql-12 pgadmin4
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# add current user to docker group
sudo usermod -aG docker $USER

#
# nodejs
#
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# Clean apt-get
sudo apt-get autoremove -y
sudo apt-get autoclean -y
sudo apt-get clean -y

#
# python/pip
#

# Install / update pip
curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
sudo -H python3 /tmp/get-pip.py
sudo -H python /tmp/get-pip.py
rm /tmp/get-pip.py

sudo -H chown $USER:$USER -R /home/$USER/.cache/pip
sudo -H chmod o+wrx -R /home/$USER/.cache/pip

# pip base packages
pip3 install --user -U setuptools
pip3 install --user -U virtualenv
pip3 install --user -U black
pip3 install --user -U pylint
pip3 install --user -U pylint-django
pip3 install --user -U pylint-celery
pip3 install --user -U mccabe
pip3 install --user -U bandit
pip3 install --user -U pydocstyle
pip3 install --user -U pycodestyle
pip3 install --user -U pep8-naming
pip3 install --user -U doc8
pip3 install --user -U flake8
pip3 install --user -U flake8-bugbear
pip3 install --user -U flake8-commas
pip3 install --user -U flake8-docstrings
pip3 install --user -U flake8-import-order
pip3 install --user -U flake8-2020
pip3 install --user -U flake8-alfred
pip3 install --user -U flake8-black
pip3 install --user -U flake8-broken-line
pip3 install --user -U flake8-builtins
pip3 install --user -U flake8-coding
pip3 install --user -U flake8-comprehensions
pip3 install --user -U flake8-debugger
pip3 install --user -U flake8-django
pip3 install --user -U flake8-eradicate
pip3 install --user -U flake8-executable
pip3 install --user -U flake8-fixme
pip3 install --user -U flake8-mutable
pip3 install --user -U flake8-mypy
pip3 install --user -U flake8-pep3101
pip3 install --user -U flake8-pie
pip3 install --user -U flake8-print
pip3 install --user -U flake8-quotes
pip3 install --user -U flake8-pyi
pip3 install --user -U flake8-spellcheck
pip3 install --user -U flake8-strict
pip3 install --user -U flake8-todo
pip3 install --user -U flake8-variables-names
pip3 install --user -U flake8-walrus
pip3 install --user -U flake8-cognitive-complexity
pip3 install --user -U flake8-functions
pip3 install --user -U flake8-expression-complexity
pip3 install --user -U flake8-bandit
pip3 install --user -U cohesion
pip3 install --user -U dodgy
pip3 install --user -U ipython
pip3 install --user -U mypy
pip3 install --user -U pytype
pip3 install --user -U pytest
pip3 install --user -U isort
pip3 install --user -U boto3
pip3 install --user -U poetry
pip3 install --user -U numpy
pip3 install --user -U matplotlib
pip3 install --user -U scikit-learn
pip3 install --user -U pyside2
pip3 install --user -U tabulate
pip3 install --user -U prettyprinter
pip3 install --user -U pelican[Markdown]

# pip tools
pip3 install --user -U tldr
pip3 install --user -U youtube-dl

#
# bashrc .local/bin/
#
grep -qxF '# pip' $HOME/.bashrc || echo '# pip' >> $HOME/.bashrc
grep -qxF 'export PATH="$PATH:$HOME/.local/bin/"' $HOME/.bashrc || echo 'export PATH="$PATH:$HOME/.local/bin/"' >> $HOME/.bashrc
export PATH="$PATH:$HOME/.local/bin/"

#
# rust
#
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env

# rust update and setup completions
rustup update
rustup completions bash > ~/.local/share/bash-completion/completions/rustup

# rust tools
cargo install cargo-update
cargo install ripgrep
cargo install bat
cargo install fd-find
cargo install tin-summer
cargo install exa
cargo install tokei
cargo install hyperfine
cargo install du-dust
cargo install kibi
cargo install sfz
cargo install --git https://github.com/cjbassi/ytop ytop

cargo install-update --all --git

#
# bashrc .cargo/bin/
#
grep -qxF '# rust' $HOME/.bashrc || echo '# rust' >> $HOME/.bashrc
grep -qxF 'source $HOME/.cargo/env' $HOME/.bashrc || echo 'source $HOME/.cargo/env' >> $HOME/.bashrc
