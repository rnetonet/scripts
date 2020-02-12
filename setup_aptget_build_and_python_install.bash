# dump commands
set -x

sudo echo
sudo apt-get update -y; sudo apt-get full-upgrade -y; sudo apt-get autoremove -y;
sudo apt-get install -y autoconf bison build-essential curl freetds-dev gfortran ghostscript libatlas-base-dev libblas-dev libbz2-dev libcairo2 libcups2 libdbus-glib-1-2 libffi-dev libfreetype6-dev libgdbm-dev libgdk-pixbuf2.0-0 libglu1-mesa libhdf5-dev libjpeg-dev liblapack-dev libldap2-dev liblzma-dev libncurses5-dev libpango-1.0-0 libpangocairo-1.0-0 libpq-dev libreadline-dev libreadline6-dev libsasl2-dev libsm6 libsqlite3-dev libssl-dev libxinerama1 libxml2-dev libxmlsec1-dev libxslt1-dev libyaml-dev llvm make shared-mime-info tk-dev wget xz-utils zlib1g-dev libclang-dev

#
# pyenv
#
cat ~/.bashrc | fgrep pyenv
pyenvStatus=$?
if [ $pyenvStatus -ne 0 ]; then
    curl https://pyenv.run | bash
    echo "" >> ~/.bashrc
    echo "# pyenv " >> ~/.bashrc
    echo "export PATH=\"/home/\$USER/.pyenv/bin:\$PATH\"" >> ~/.bashrc
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

    export PATH="/home/$USER/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

pyenv update

# Latest Python using pyenv
PYTHON_VERSION="$(pyenv install -l | grep -e '3.8.[0-9]' | grep -v - | tail -1)"

pyenv install -s $PYTHON_VERSION
pyenv global $PYTHON_VERSION

# pip packages
pip install -U pip

pip install -U setuptools
pip install -U pipenv
pip install -U virtualenv
pip install -U virtualenvwrapper
pip install -U black
pip install -U pylint
pip install -U pylint-django
pip install -U pylint-celery
pip install -U mccabe
pip install -U bandit
pip install -U pydocstyle
pip install -U pycodestyle
pip install -U pep8-naming
pip install -U doc8
pip install -U flake8
pip install -U flake8-bugbear
pip install -U flake8-commas
pip install -U flake8-docstrings
pip install -U flake8-import-order
pip install -U flake8-2020
pip install -U flake8-alfred
pip install -U flake8-black
pip install -U flake8-broken-line
pip install -U flake8-builtins
pip install -U flake8-coding
pip install -U flake8-comprehensions
pip install -U flake8-debugger
pip install -U flake8-django
pip install -U flake8-eradicate
pip install -U flake8-executable
pip install -U flake8-fixme
pip install -U flake8-mutable
pip install -U flake8-mypy
pip install -U flake8-pep3101
pip install -U flake8-pie
pip install -U flake8-print
pip install -U flake8-quotes
pip install -U flake8-pyi
pip install -U flake8-spellcheck
pip install -U flake8-strict
pip install -U flake8-todo
pip install -U flake8-variables-names
pip install -U flake8-walrus
pip install -U flake8-cognitive-complexity
pip install -U flake8-functions
pip install -U flake8-expression-complexity
pip install -U flake8-bandit
pip install -U cohesion
pip install -U dodgy
pip install -U ipython
pip install -U mypy
pip install -U pytype
pip install -U pytest
pip install -U prettyprinter
pip install -U isort
pip install -U boto3
pip install -U youtube-dl
pip install -U poetry

pip install -U numpy
pip install -U matplotlib
pip install -U scikit-learn
pip install -U pyside2
pip install -U tabulate
pip install -U prettyprinter

pip install -U tldr

#
# rustup
#
cat ~/.bashrc | fgrep rustup
rustup_status=$?
if [ $rustup_status -ne 0 ]; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y

    echo "" >> ~/.bashrc
    echo "# rustup" >> ~/.bashrc
    echo "export PATH=\"\$HOME/.cargo/bin:\$PATH\"" >> ~/.bashrc

    export PATH="$HOME/.cargo/bin:$PATH"
    source $HOME/.cargo/env
fi

# Export variables
export PATH="$HOME/.cargo/bin:$PATH"
source $HOME/.cargo/env

# Update rustup and setup completions
rustup update
rustup completions bash > ~/.local/share/bash-completion/completions/rustup

# Rust packages
cargo install ripgrep
cargo install bat
cargo install fd-find
cargo install tin-summer
cargo install exa
cargo install tokei
cargo install cargo-update

cargo install-update cargo-update
cargo install-update ripgrep
cargo install-update bat
cargo install-update fd-find
cargo install-update tin-summer
cargo install-update exa
cargo install-update tokei

#
# Git repos
#

# Typeshed
git clone https://github.com/python/typeshed.git ~/.typeshed; (cd ~/.typeshed && git pull);

# update itself
git pull

# stop dumping commands
set +x

# open new bash
exec bash