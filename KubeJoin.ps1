#based on https://kubernetes.io/docs/setup/production-environment/windows/user-guide-windows-nodes/
#execute this from the .\sig-windows-tools-master\kubeadm dir 

$pubKey=$(cat $env:userprofile/.ssh/id_rsa.pub)
        Write-Host "Execute the below commands on the Linux control-plane node to add this Windows node's public key to its authorized keys"
        Write-Host "touch ~/.ssh/authorized_keys"
        Write-Host "echo $pubKey >> ~/.ssh/authorized_keys"

Read-Host "Press any key to continue on the windows node - when the above commnds have been executed on master node.."
Write-Host "To verify ssh connectivity from the Windows node now do:" 
Write-Host "ssh <master-node-user>@<master-node-ip>"
Write-Host "If connection succeeds - we should be good to go"

$answer=Read-Host "Confirm you want to proceed and join this node to the cluster. Type 'c' to confirm"
if($answer -eq "c"){
    Write-Host "Starting .\KubeCluster.ps1 -ConfigFile .\KubeClustervxlan.hvl71.json -join"
    #must be executed using Powershell 5.1 - not Powershell core as it will break in get-windowsfeature somewhere..
    .\KubeCluster.ps1 -ConfigFile .\KubeClustervxlan.hvl71.json -join
} else {
    Write-Host "OK - aborting.."
}
