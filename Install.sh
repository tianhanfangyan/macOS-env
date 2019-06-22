#!/usr/bin/env bash


function info() {
 echo -e "\033[1;34m$1 \033[0m"
}

function warn() {
 echo -e "\033[0;33m$1 \033[0m"
}

function error() {
 echo -e "\033[0;31m$1 \033[0m"
}

# brew
function InstallHomebrew(){
    if [ `command -v brew` ];then
        info "You already Install brew"
    else
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    tools=(git wget vim kubectl tmux jq tree maven)

    for value in in "${tools[@]}"
    do
        if [ `command -v $value` ];then
            info $value'已经安装'
        else
            warn $value'未安装,开始安装....'
            brew install $value
        fi
    done

    info "Install all brew tools completed"

}


# oh-my-zsh
function InstallOhMyZsh() {
    ohmyzshpath=$HOME"/.oh-my-zsh"
    if [ ! -d $ohmyzshpath ];
    then
        cd ~
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    else
        info "You already Install oh-my-zsh"
    fi

    info "Install oh-my-zsh completed"

}


# oh-my-tmux
function InstallOhMyTmux() {
    tmuxpath=$HOME"/.tmux"
    if [ ! -d $tmuxpath ];
    then
        cd ~
        git clone https://github.com/gpakosz/.tmux.git
        echo "ln -s -f .tmux/.tmux.conf"
        echo "cp .tmux/.tmux.conf.local ."
    else
        info "You already Install oh-my-tmux"
    fi

    info "Install oh-my-tmux completed"

}


# pyenv
function InstallPyenv() {
    pyenvpath=$HOME"/.pyenv"
    if [ ! -d $pyenvpath ];
    then
        cd ~
        curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
        echo "# pyenv" >> ~/.zshrc
        echo "export PATH=\"\$HOME/.pyenv/bin:\$PATH\"" >> ~/.zshrc
        echo "eval \"\$(pyenv init -)\"" >> ~/.zshrc
        echo "eval \"\$(pyenv virtualenv-init -)\"" >> ~/.zshrc
    else
        info "You already Install pyenv"
    fi

    info "Install pyenv completed"

}


# end
function end() {
    echo "source ~/.zshrc"

}


InstallHomebrew
InstallOhMyZsh
InstallOhMyTmux
InstallPyenv
end
