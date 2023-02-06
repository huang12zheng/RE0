* install
  https://kubesphere.com.cn/en/docs/installing-on-linux/introduction/multioverview/#dependency-requirements
  
  yum install -y socat conntrack ebtables ipset
  export KKZONE=cn
  curl -sfL https://get-kk.kubesphere.io | VERSION=v2.0.0 sh -

  chmod +x kk

  ./kk create config

  ./kk create cluster -f config-sample.yaml

  现在，您将能够使用<NodeIP>:30880默认帐户和密码 ( admin/P@88w0rd) 访问 KubeSphere 的 Web 控制台。

* config
  hosts:
  - {name: master, address: , user: password port,  privateKeyPath}
  roleGroups:
    etdc:
      - master
    control-plane:
      - master
    worker:
    - node1
    - node2
  controlPlaneEndpoint:
    domain: 

* manifest

  arches:
  repositories:
    iso:
        localPath

* artifact

仅安装 Kubernetes
> Kubekey 将会帮您安装 Kubernetes

多节点集群

