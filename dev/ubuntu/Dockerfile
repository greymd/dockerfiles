FROM ubuntu:16.04
MAINTAINER Yamada, Yasuhiro <greengregson@gmail.com>
ENV DEBFULLNAME="Yamada, Yasuhiro" DEBEMAIL=greengregson@gmail.com


# ------------------
# Install Basic softwares
# ------------------
RUN apt update && \
    apt install -y locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.utf8 && \
    apt install -y git tmux vim curl make netcat libreadline-dev nkf bc expect tree \
    # In order to develop debian package (Ref: http://www.rain.hyarc.nagoya-u.ac.jp/~satoki/main/Linux/configure/make_deb.html).
    dh-make fakeroot pbuilder \
    # For PPA
    software-properties-common

# ------------------
# Set dotfiles
# ------------------
RUN mkdir -p $HOME/reps/greymd && \
    git clone https://github.com/greymd/dotfiles.git $HOME/reps/greymd/dotfiles && \
    cd $HOME/reps/greymd/dotfiles && \
    # Delete existing dotfiles
    ls -a | grep '^\.'  | grep -vFw '.' | grep -v '^\.git$' | sed 's|^|rm -f $HOME/|' | sh && \
    # Set links
    ls -a | grep '^\.' | grep -v '^\.git$' | grep -vwF '.' | sed 's/^.*/echo ln -s $(pwd)\/& $HOME\/&/' | sh | sh

# ------------------
# Install Ruby
# ------------------
RUN apt install -y build-essential libssl-dev && \
    git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv && \
    git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build && \
    $HOME/.rbenv/bin/rbenv install 2.3.0 && \
    $HOME/.rbenv/bin/rbenv global 2.3.0

# ------------------
# Install zplug
# ------------------
RUN apt install -y zsh python && \
    export ZPLUG_HOME=$HOME/.zplug && \
    git clone https://github.com/zplug/zplug $ZPLUG_HOME

# ------------------
# Install antigen
# ------------------
RUN mkdir -p $HOME/reps/zsh-users/antigen && \
    git clone https://github.com/zsh-users/antigen.git $HOME/reps/zsh-users/antigen

# Install antigen plugins
RUN zsh --rcs $HOME/.zshrc -c 'antigen-update'

# ------------------
# Install universal-ctags
# ------------------
# Ref: https://github.com/universal-ctags/ctags/blob/master/docs/autotools.rst
RUN apt install -y dh-autoreconf pkg-config && \
    git clone https://github.com/universal-ctags/ctags.git $HOME/reps/universal-ctags/ctags && \
    cd $HOME/reps/universal-ctags/ctags && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install

# ------------------
# Install Go
# ------------------
RUN cd $HOME && \
    mkdir $HOME/.go && \
    curl -L https://storage.googleapis.com/golang/go1.7.5.linux-amd64.tar.gz | tar zxv && \
    mv go /usr/local && \
    ls /usr/local/go/bin/ | sed 's;.*;ln -s /usr/local/go/bin/& /usr/local/bin/&;' | sh

# ------------------
# Install pt (does not work...)
# ------------------
RUN cd $HOME && \
    curl -L https://github.com/monochromegane/the_platinum_searcher/releases/download/v2.1.5/pt_linux_amd64.tar.gz | tar zxv && \
    cp pt_linux_amd64/pt /usr/local/bin && \
    rm -rf pt_linux_amd64


# ------------------
# Install fzy
# ------------------
RUN cd $HOME && \
    apt install wget && \
    wget https://github.com/jhawthorn/fzy/releases/download/0.8/fzy_0.8-1_amd64.deb && \
    dpkg -i fzy_0.8-1_amd64.deb && \
    rm fzy_0.8-1_amd64.deb

# ------------------
# Vim settings
# ------------------
RUN apt install -y vim && \
    mkdir -p $HOME/.cache/dein && \
    curl -L https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $HOME/installer.sh && \
    sh $HOME/installer.sh $HOME/.cache/dein

# Install dein plugins
RUN yes | vim -c ":silent call dein#install() | :q"

# Create vimproc_linux64.so for vimproc
RUN cd $HOME/.cache/dein/repos/github.com/Shougo/vimproc.vim && \
    make

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8

# Cleaning
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
