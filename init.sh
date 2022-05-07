#!/bin/sh

function init_terraform()
{
cat > ~/.terraformrc << EOF
plugin_cache_dir   = "$HOME/.terraform.d/plugin-cache"
EOF
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
    #sudo amazon-linux-extras enable ansible2
    sudo yum makecache
    sudo yum install python3-pip git tmux -y
    sudo pip3 install ansible jinja2 hvac kubernetes -i https://pypi.mirrors.ustc.edu.cn/simple
    sudo /usr/local/bin/ansible-galaxy collection install kubernetes.core 
    sudo curl -o /usr/bin/kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.22.6/2022-03-09/bin/linux/amd64/kubectl 
    sudo curl -o /tmp/helm.tar.gz https://mirrors.huaweicloud.com/helm/v3.5.2/helm-v3.5.2-linux-amd64.tar.gz
    sudo tar -xpvf /tmp/helm.tar.gz -C /tmp/ && sudo cp /tmp/linux-amd64/helm /usr/bin/ -f
    sudo chmod 755 /usr/bin/kubectl /usr/bin/helm
    init_tmux_conf
}

case `uname` in
    Linux  )  init_linux ;;
         * )  echo "Unkown OS" ;; 
esac

aws configure set aws_access_key_id $ak
aws configure set aws_secret_access_key $sk
aws eks --region $region update-kubeconfig --name $eks_name --alias $eks_name
