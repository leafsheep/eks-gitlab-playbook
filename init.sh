#!/bin/sh

function init_terraform()
{
cat > ~/.terraformrc << EOF
plugin_cache_dir   = "$HOME/.terraform.d/plugin-cache"
<< EOF
}

function init_tmux_conf()
{
cat > ~/.tmux.conf << EOF
set-option -g prefix C-x
unbind-key C-b
bind-key C-x send-prefix
EOF
}

function init_linux()
{
    sudo amazon-linux-extras enable ansible2
    sudo yum  install ansible python3-pip git tmux -y
    sudo pip3 install jinja2 hvac kubernetes
    sudo ansible-galaxy collection install kubernetes.core 
}

case `uname` in
    Linux  )  init_linux ;;
         * )  echo "Unkown OS" ;; 
esac

aws configure
