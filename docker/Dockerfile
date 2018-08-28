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
        tmux \
        openssh-server

WORKDIR /root

# referenced
# https://docs.docker.com/engine/examples/running_ssh_service/
RUN set -ex ;\
    mkdir /var/run/sshd; \
    echo 'root:vimdock' | chpasswd; \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config; \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN set -ex ;\
    chsh -s /usr/bin/zsh

RUN set -ex; \
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh; \
    sh ./installer.sh ./.cache/dein; \
    rm -f ./installer.sh

RUN set -ex; \
    git clone --depth 1 https://github.com/junegunn/fzf.git ./.fzf; \
    ./.fzf/install

RUN set -ex; \
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.9.0/ripgrep_0.9.0_amd64.deb; \
    dpkg -i ripgrep_0.9.0_amd64.deb; \
    rm -f ripgrep_0.9.0_amd64.deb

RUN set -ex; \
    pip3 install neovim --upgrade

COPY vimrc /root/.vimrc
COPY zshrc /root/.zshrc
COPY tmux.conf /root/.tmux.conf

RUN set -ex; \
    mkdir -p /root/.config/nvim/; \
    ln -sf /root/.vimrc /root/.config/nvim/init.vim

# install nvim plugins
RUN nvim +UpdateRemotePlugins +qa

VOLUME /host

# default working directory
WORKDIR /work

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
