#based on https://kubernetes.io/docs/setup/production-environment/windows/user-guide-windows-nodes/
#execute this from the .\sig-windows-tools-master\kubeadm dir 

#must be executed using Powershell 5.1 - not Powershell core as it will break in get-windowsfeature somewhere..
.\KubeCluster.ps1 -ConfigFile .\KubeClustervxlan.hvl71.json -join
