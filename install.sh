export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
ansible-galaxy install gantsign.git_user
ansible-galaxy install gantsign.visual-studio-code
ansible-galaxy install gantsign.oh-my-zsh
# ansible-galaxy install ansible-netplan,v0.2.0
ansible-galaxy install mrlesmithjr.netplan
# ansible-galaxy install trallnag.kubectx

# ansible-playbook -i hosts clash_install.yaml &
# ansible-playbook -i hosts docker_install.yaml &
# ansible-playbook -i hosts k8s_install.yaml &
# ansible-playbook -i hosts-test gantsign-desktop.yaml -vvv
# ansible-playbook -i hosts gantsign-desktop.yaml -v
