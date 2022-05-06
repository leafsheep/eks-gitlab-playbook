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
    apt-get install software-properties-common -y
    apt-add-repository ppa:ansible/ansible -y
    apt-get update 
    apt-get install ansible python3-pip -y
    pip3 install jinja2 json kubernetes
    ansible-galaxy collection install kubernetes.core 
    init_tmux_conf
    init_terraform
}

case `uname` in
    Linux  )  init_linux ;;
         * )  echo "Unkown OS" ;; 
esac

#wget https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_darwin_arm64.zip
#unzip terraform_1.1.7_darwin_arm64.zip
#aws configure
