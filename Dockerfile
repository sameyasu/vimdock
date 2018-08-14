FROM ubuntu:bionic

RUN apt-get update && \
    apt-get install -y \
        locales \
        wget \
        curl \
        git \
        software-properties-common \
        unzip \
        vim \
        ctags \
        zsh \
        python3-dev \
        python3-pip \
        python3-neovim \
        tmux

WORKDIR /root

RUN set -ex ;\
    chsh -s /usr/bin/zsh

RUN set -ex; \
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh; \
    sh ./installer.sh ./.cache/dein

RUN set -ex; \
    git clone --depth 1 https://github.com/junegunn/fzf.git ./.fzf; \
    ./.fzf/install

RUN set -ex; \
    pip3 install neovim --upgrade

COPY vimrc /root/.vimrc
COPY zshrc /root/.zshrc
COPY tmux.conf /root/.tmux.conf

RUN set -ex; \
    mkdir -p /root/.config/nvim/; \
    ln -sf /root/.vimrc /root/.config/nvim/init.vim

CMD ["/usr/bin/zsh","--login"]
