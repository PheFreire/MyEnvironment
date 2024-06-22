FROM ubuntu:latest

USER root
WORKDIR /dev

# Update package lists
RUN apt-get update

# Install ZSH
RUN apt install --assume-yes --fix-broken zsh

# Installing ohmizsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Update and install necessary packages
RUN apt-get install -y build-essential
RUN apt-get install -y libssl-dev
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y libbz2-dev
RUN apt-get install -y libreadline-dev
RUN apt-get install -y libsqlite3-dev
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN apt-get install -y llvm
RUN apt-get install -y gettext
RUN apt-get install -y libncurses5-dev
RUN apt-get install -y tk-dev
RUN apt-get install -y tcl-dev
RUN apt-get install -y blt-dev
RUN apt-get install -y libgdbm-dev
RUN apt-get install -y git
RUN apt-get install -y python3-dev
RUN apt-get install -y aria2
RUN apt-get install -y lzma
RUN apt-get install -y liblzma-dev

# Install Pyenv
RUN curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

RUN echo 'export PYTHON_BUILD_ARIA2_OPTS="-x 10 -k 1M"' >> ~/.zshrc && \
    echo 'export PATH="${HOME}/.pyenv/bin:$PATH"' >> ~/.zshrc && \
    echo 'eval "$(pyenv init --path)"' >> ~/.zshrc && \
    echo 'eval "$(pyenv init -)"' >> ~/.zshrc && \
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc \
    zsh -c "source ~/.zshrc && pyenv install 3.11 && pyenv global 3.11 && pip install --upgrade pip && pip install poetry"


CMD ["/bin/zsh", "cd"]
