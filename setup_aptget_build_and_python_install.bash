
# dump commands
set -x

# cant run as root
if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "Do not execute as root"
    exit
fi

#
# apt-get
#

# Update apt-get and install basic development packages
sudo echo
sudo apt-get update -y
sudo apt-get full-upgrade -y

sudo apt-get install -y python3-venv
sudo apt-get install -y pkg-config
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
sudo apt-get install -y libgmp3-dev
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
sudo apt-get install -y libsdl2-dev
sudo apt-get install -y libsdl2-image-dev
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
sudo apt-get install -y tree
sudo apt-get install -y openvpn
sudo apt-get install -y redis-server
sudo apt-get install -y libxrender1
sudo apt-get install -y apt-transport-https
sudo apt-get install -y ca-certificates
sudo apt-get install -y libreoffice
sudo apt-get install -y libreoffice-l10n-pt-br
sudo apt-get install -y gnupg-agent
sudo apt-get install -y gnupg

# touchpad
# sudo apt-get install -y xserver-xorg-input-synaptics

# keep sudo
sudo echo

# vscode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y code
rm packages.microsoft.gpg

# keep sudo
sudo echo

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update -y
sudo apt-get install -y docker-ce

# add current user to docker group
sudo usermod -aG docker ${USER}

# keep sudo
sudo echo

# postgresql keys
curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb [ arch=amd64 ] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# update
sudo apt-get update -y

# install postgresql 12 and docker
sudo apt-get install -y postgresql-12
sudo apt-get install -y pgadmin4

# keep sudo
sudo echo

#
# nodejs
#
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# Clean apt-get
sudo apt-get autoremove -y
sudo apt-get autoclean -y
sudo apt-get clean -y

# keep sudo
sudo echo

#
# python/pip
#

# Install / update pip
curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
sudo -H python3 /tmp/get-pip.py
rm /tmp/get-pip.py

sudo pip3 install -U pip

sudo chown $USER:$USER -R /home/$USER/.cache/pip
sudo chmod o+wrx -R /home/$USER/.cache/pip

# pip base packages
pip3 install --user -U setuptools
pip3 install --user -U virtualenv
pip3 install --user -U black
pip3 install --user -U yapf
pip3 install --user -U isort

pip3 install --user -U mypy

pip3 install --user -U flake8
pip3 install --user -U cohesion
pip3 install --user -U dlint
pip3 install --user -U flake8-bandit
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
pip3 install --user -U flake8-django-migrations
pip3 install --user -U flake8-eradicate
pip3 install --user -U flake8-executable
pip3 install --user -U flake8-fixme
pip3 install --user -U flake8-isort
pip3 install --user -U flake8-mutable
pip3 install --user -U flake8-mypy
pip3 install --user -U flake8-pep3101
pip3 install --user -U flake8-pie
pip3 install --user -U flake8-print
pip3 install --user -U flake8-quotes
pip3 install --user -U flake8-pyi
pip3 install --user -U flake8-spellcheck
pip3 install --user -U flake8-class-attributes-order
pip3 install --user -U flake8-strict
pip3 install --user -U flake8-todo
pip3 install --user -U flake8-variables-names
pip3 install --user -U flake8-walrus
pip3 install --user -U flake8-cognitive-complexity
pip3 install --user -U flake8-functions
pip3 install --user -U flake8-expression-complexity
pip3 install --user -U flake8-bandit

pip3 install --user -U ipython

pip3 install --user -U pytype
pip3 install --user -U pytest

pip3 install --user -U boto3
pip3 install --user -U poetry
pip3 install --user -U numpy
pip3 install --user -U matplotlib
pip3 install --user -U scikit-learn
pip3 install --user -U pyside2
pip3 install --user -U tabulate
pip3 install --user -U prettyprinter
pip3 install --user -U afdko
pip3 install --user -U fontmake

#
# bashrc .local/bin/
#
grep -qxF '# pip' $HOME/.bashrc || echo '# pip' >> $HOME/.bashrc
grep -qxF 'export PATH="$PATH:$HOME/.local/bin/"' $HOME/.bashrc || echo 'export PATH="$PATH:$HOME/.local/bin/"' >> $HOME/.bashrc
export PATH="$PATH:$HOME/.local/bin/"

# pipx and tools
python3 -m pip install --user pipx
python3 -m pipx ensurepath

python3 -m pipx install youtube-dl
python3 -m pipx upgrade-all

# keep sudo
sudo echo

#
# rust
#
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env

# rust update and setup completions
rustup update
mkdir -p $HOME/.local/share/bash-completion/completions/
rustup completions bash > $HOME/.local/share/bash-completion/completions/rustup

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

# lsd and exa -> better ls
cargo install lsd
cargo install exa

# grex -> build regex from examples
cargo install grex

# a better shell prompt
cargo install starship

# ddh -> a fast duplicate file finder
cargo install --git https://github.com/darakian/ddh ddh

# kibi -> a lightweight text editor
cargo install kibi

# mdbook
cargo install mdbook

# tldr
cargo install tealdeer

cargo install-update --all --git

#
# bashrc .cargo/bin/
#
grep -qxF '# rust' $HOME/.bashrc || echo '# rust' >> $HOME/.bashrc
grep -qxF 'source $HOME/.cargo/env' $HOME/.bashrc || echo 'source $HOME/.cargo/env' >> $HOME/.bashrc

#
# bat
#
mkdir -p "$HOME/.config/bat/"; echo '--theme="GitHub"' > "$HOME/.config/bat/config"

#
# starship
#
grep -qxF '# starship' $HOME/.bashrc || echo '# starship' >> $HOME/.bashrc
grep -qxF 'eval "$(starship init bash)"' $HOME/.bashrc || echo 'eval "$(starship init bash)"' >> $HOME/.bashrc

# startship configuration
cat > $HOME/.config/starship.toml <<EOL
# Disable the newline at the start of the prompt
add_newline = false

# Replace the ">" symbol in the prompt with "➜"
[character]      # The name of the module we are configuring is "character"
symbol = ">"
success_symbol = "[>](bold green)"     # The "symbol" segment is being set to "➜"
error_symbol = "[>](bold red) "

[hostname]
ssh_only = false

[username]
show_always = true

[directory]
truncate_to_repo = false

[git_branch]
symbol = "#"
EOL


#
# sysctl
#
grep -qxF 'fs.inotify.max_user_watches=524288' /etc/sysctl.conf || echo 'fs.inotify.max_user_watches=524288' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

#
# grub psmouse - suspend and touchpad
# ref: https://adamprescott.net/2020/05/07/trackpad-disabled-after-sleep-suspend-following-upgrade-to-ubuntu-20-04/
#
grep -qF 'psmouse.synaptics_intertouch=0' /etc/default/grub || sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="\(.*\)"/GRUB_CMDLINE_LINUX_DEFAULT="\1 psmouse.synaptics_intertouch=0"/g' /etc/default/grub
sudo update-grub