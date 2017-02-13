FROM ubuntu:16.04
MAINTAINER Yamada, Yasuhiro <greengregson@gmail.com>
RUN apt update && \
    apt install -y locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.utf8 && \
    apt install -y tmux vim curl make git zsh netcat build-essential libssl-dev libreadline-dev nkf python&& \
    # ------------------
    # Install Ruby
    # ------------------
    apt install -y build-essential libssl-dev && \
    git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv && \
    git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build && \
    $HOME/.rbenv/bin/rbenv install 2.3.0 && \
    $HOME/.rbenv/bin/rbenv global 2.3.0 && \
    # ------------------
    # Set dotfiles
    # ------------------
    mkdir -p $HOME/reps/greymd && \
    git clone https://github.com/greymd/dotfiles.git $HOME/reps/greymd/dotfiles && \
    cd $HOME/reps/greymd/dotfiles && \
    # Delete existing dotfiles
    ls -a | grep '^\.'  | grep -vFw '.' | grep -v '^\.git$' | sed 's|^|rm -f $HOME/|' | sh && \
    # Set links
    ls -a | grep '^\.' | grep -v '^\.git$' | grep -vwF '.' | sed 's/^.*/echo ln -s $(pwd)\/& $HOME\/&/e' | sh && \
    # ------------------
    # Install zplug
    # ------------------
    export ZPLUG_HOME=$HOME/.zplug && \
    git clone https://github.com/zplug/zplug $ZPLUG_HOME && \
    # ------------------
    # Install dein
    # ------------------
    mkdir -p $HOME/.cache/dein && \
    curl -L https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $HOME/installer.sh && \
    sh $HOME/installer.sh $HOME/.cache/dein && \
    # Return with exit status 0
    (vim -c ':call dein#install()' -e +%p +q!; exit 0)

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
