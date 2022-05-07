## Prep

1. 准备一个AWS WorkSpaces，系统类型选择 Amazon Linux ，需要能访问公网
2. 创建一个route53 私有托管区，域名可以自定义，例如: sgc-dev.com
3. 创建一个EKS集群，需要启用aws-ebs-csi-driver插件，添加类型为t3.xlarge的计算节点组，节点数量3


## deploy

login AWS WorkSpaces

```
git clone https://github.com/panhaitao/eks-gitlab-playbook.git
export region=<aws-region-name>
export ak=<aws-access-key>
export sk=<aws-secret-key>
export eks_name=<eks-name>
export s3_name=<s3-bucket-name>
export gitlab_pw=<your-gitlab-name>
export gitlab_domain=<your-domain>
export gitlab_token=`head -c 512 /dev/urandom | LC_CTYPE=C tr -cd 'a-zA-Z0-9' | head -c 64`

cd eks-gitlab-playbook
sh init.sh
python3 env-to-config.py
~/.local/bin/ansible-playbook deploy-eks-addon -D
~/.local/bin/ansible-playbook deploy-gitlab -D
```
