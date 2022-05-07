```
export region=<aws-region-name>
export ak=<aws-access-key>
export sk=<aws-secret-key>
export eks_name=<eks-name>
export s3_name=<s3-bucket-name>
export gitlab_pw=<your-gitlab-name>
export gitlab_domain=<your-domain>
export gitlab_token=`head -c 512 /dev/urandom | LC_CTYPE=C tr -cd 'a-zA-Z0-9' | head -c 64`

sh init.sh
python3 env-to-config.py
~/.local/bin/ansible-playbook deploy-eks-addon -D
~/.local/bin/ansible-playbook deploy-gitlab -D
```
