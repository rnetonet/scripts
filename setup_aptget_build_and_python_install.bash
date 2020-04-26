
# dump commands
set -x

#
# apt-get
#

# Update apt-get and install basic development packages
sudo echo
sudo apt-get update -y
sudo apt-get full-upgrade -y

sudo apt-get install -y cmake
sudo apt-get install -y autoconf
sudo apt-get install -y bison
sudo apt-get install -y build-essential
sudo apt-get install -y curl
sudo apt-get install -y freetds-dev
sudo apt-get install -y gfortran
sudo apt-get install -y ghostscript
sudo apt-get install -y libatlas-base-dev
sudo apt-get install -y libblas-dev
sudo apt-get install -y libbz2-dev
sudo apt-get install -y libcairo2
sudo apt-get install -y libcups2
sudo apt-get install -y libdbus-glib-1-2
sudo apt-get install -y libffi-dev
sudo apt-get install -y libfreetype6-dev
sudo apt-get install -y libgdbm-dev
sudo apt-get install -y libgdk-pixbuf2.0-0
sudo apt-get install -y libglu1-mesa
sudo apt-get install -y libhdf5-dev
sudo apt-get install -y libjpeg-dev
sudo apt-get install -y liblapack-dev
sudo apt-get install -y libldap2-dev
sudo apt-get install -y liblzma-dev
sudo apt-get install -y libncurses5-dev
sudo apt-get install -y libpango-1.0-0
sudo apt-get install -y libpangocairo-1.0-0
sudo apt-get install -y libpq-dev
sudo apt-get install -y libreadline-dev
sudo apt-get install -y libreadline6-dev
sudo apt-get install -y libsasl2-dev
sudo apt-get install -y libsm6
sudo apt-get install -y libsqlite3-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y libxinerama1
sudo apt-get install -y libxml2-dev
sudo apt-get install -y libxmlsec1-dev
sudo apt-get install -y libxslt1-dev
sudo apt-get install -y libyaml-dev
sudo apt-get install -y llvm
sudo apt-get install -y make
sudo apt-get install -y shared-mime-info
sudo apt-get install -y wget
sudo apt-get install -y xz-utils
sudo apt-get install -y zlib1g-dev
sudo apt-get install -y libclang-dev
sudo apt-get install -y python3-dev
sudo apt-get install -y binutils
sudo apt-get install -y gcc
sudo apt-get install -y git
sudo apt-get install -y openssl
sudo apt-get install -y sqlite3
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y software-properties-common
sudo apt-get install -y dnsutils
sudo apt-get install -y vim
sudo apt-get install -y zip
sudo apt-get install -y unzip
sudo apt-get install -y htop
sudo apt-get install -y redis-server
sudo apt-get install -y libxrender1
sudo apt-get install -y apt-transport-https
sudo apt-get install -y ca-certificates
sudo apt-get install -y postgresql-client
sudo apt-get install -y libreoffice
sudo apt-get install -y libreoffice-l10n-pt-br
sudo apt-get install -y gnupg-agent
sudo apt-get install -y gnupg

# FIXME: Docker has no packages for Focal Fossa yet
# docker keys
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo apt-key fingerprint 0EBFCD88
# sudo add-apt-repository \
#    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#    $(lsb_release -cs) \
#    stable"

# postgresql keys
curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb [ arch=amd64 ] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# update
sudo apt-get update -y

# install postgresql 12 and docker
sudo apt-get install -y postgresql-12
sudo apt-get install -y pgadmin4
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
pip3 install --user Nikola
pip3 install --user "Nikola[extras]"


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

# rg -> a better grep
cargo install ripgrep

# bat -> a better cat
cargo install bat

# fd -> a better find
cargo install fd-find

# tokei -> count your project lines of code
cargo install tokei

# hyperfine -> command line benchmark tool
cargo install hyperfine

# dust -> better du
cargo install du-dust

# sfz -> serves the current dir
cargo install sfz

# lsd -> better ls
cargo install lsd

# grex -> build regex from examples
cargo install grex

# a better shell prompt
cargo install starship

# ddh -> a fast duplicate file finder
cargo install --git https://github.com/darakian/ddh ddh

# kibi -> a lightweight text editor
cargo install kibi

cargo install-update --all --git

#
# bashrc .cargo/bin/
#
grep -qxF '# rust' $HOME/.bashrc || echo '# rust' >> $HOME/.bashrc
grep -qxF 'source $HOME/.cargo/env' $HOME/.bashrc || echo 'source $HOME/.cargo/env' >> $HOME/.bashrc

#
# starship
#
grep -qxF '# starship' $HOME/.bashrc || echo '# starship' >> $HOME/.bashrc
grep -qxF 'eval "$(starship init bash)"' $HOME/.bashrc || echo 'eval "$(starship init bash)"' >> $HOME/.bashrc

# startship configuration
cat > $HOME/.config/starship.toml <<EOL
# Disable the newline at the start of the prompt
add_newline = false

# Replace the "❯" symbol in the prompt with "➜"
[character]      # The name of the module we are configuring is "character"
symbol = "➜"     # The "symbol" segment is being set to "➜"

[hostname]
ssh_only = false

[username]
show_always = true

[directory]
truncate_to_repo = false
EOL