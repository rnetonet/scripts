
# dump commands
set -x

# Update apt-get and install basic development packages
sudo echo
sudo apt-get update -y
sudo apt-get full-upgrade -y
sudo apt-get install -y autoconf bison build-essential curl freetds-dev gfortran ghostscript libatlas-base-dev libblas-dev libbz2-dev libcairo2 libcups2 libdbus-glib-1-2 libffi-dev libfreetype6-dev libgdbm-dev libgdk-pixbuf2.0-0 libglu1-mesa libhdf5-dev libjpeg-dev liblapack-dev libldap2-dev liblzma-dev libncurses5-dev libpango-1.0-0 libpangocairo-1.0-0 libpq-dev libreadline-dev libreadline6-dev libsasl2-dev libsm6 libsqlite3-dev libssl-dev libxinerama1 libxml2-dev libxmlsec1-dev libxslt1-dev libyaml-dev llvm make shared-mime-info tk-dev wget xz-utils zlib1g-dev libclang-dev python-dev python3-dev

# Clean apt-get
sudo apt-get autoremove -y
sudo apt-get autoclean -y
sudo apt-get clean -y

# Install / update pip
curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
sudo -H python3 /tmp/get-pip.py
rm /tmp/get-pip.py

sudo chown $USER:$USER -R /home/$USER/.cache/pip
sudo chmod o+wrx -R /home/$USER/.cache/pip

# pip base packages
pip install --user -U setuptools
pip install --user -U black
pip install --user -U pylint
pip install --user -U pylint-django
pip install --user -U pylint-celery
pip install --user -U mccabe
pip install --user -U bandit
pip install --user -U pydocstyle
pip install --user -U pycodestyle
pip install --user -U pep8-naming
pip install --user -U doc8
pip install --user -U flake8
pip install --user -U flake8-bugbear
pip install --user -U flake8-commas
pip install --user -U flake8-docstrings
pip install --user -U flake8-import-order
pip install --user -U flake8-2020
pip install --user -U flake8-alfred
pip install --user -U flake8-black
pip install --user -U flake8-broken-line
pip install --user -U flake8-builtins
pip install --user -U flake8-coding
pip install --user -U flake8-comprehensions
pip install --user -U flake8-debugger
pip install --user -U flake8-django
pip install --user -U flake8-eradicate
pip install --user -U flake8-executable
pip install --user -U flake8-fixme
pip install --user -U flake8-mutable
pip install --user -U flake8-mypy
pip install --user -U flake8-pep3101
pip install --user -U flake8-pie
pip install --user -U flake8-print
pip install --user -U flake8-quotes
pip install --user -U flake8-pyi
pip install --user -U flake8-spellcheck
pip install --user -U flake8-strict
pip install --user -U flake8-todo
pip install --user -U flake8-variables-names
pip install --user -U flake8-walrus
pip install --user -U flake8-cognitive-complexity
pip install --user -U flake8-functions
pip install --user -U flake8-expression-complexity
pip install --user -U flake8-bandit
pip install --user -U cohesion
pip install --user -U dodgy
pip install --user -U ipython
pip install --user -U mypy
pip install --user -U pytype
pip install --user -U pytest
pip install --user -U isort
pip install --user -U boto3
pip install --user -U poetry
pip install --user -U numpy
pip install --user -U matplotlib
pip install --user -U scikit-learn
pip install --user -U pyside2
pip install --user -U tabulate
pip install --user -U prettyprinter

# pip tools
pip install --user -U tldr
pip install --user -U youtube-dl