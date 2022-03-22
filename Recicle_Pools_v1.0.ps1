
#################################### 
# Recicle_Pools_v1.0.ps1           #
# Version 1.0                      #
# Luiz Eduardo - 02/09/2021        #
#################################### 

################################
#-----Variáveis e Recursos-----#
################################
Import-Module webadministration
Set-Location IIS:\
$aplicacao = ""
$aplicacoes = ""
$nomeaplicacao = ""
$Statusaplicacao = ""

#####################
#-----Principal-----#
#####################

set-Location IIS:\AppPools
$aplicacoes = dir
foreach ($aplicacao in $aplicacoes){  # este FOR pega todas as aplicações do diretorio appPools
    $nomeaplicacao = $aplicacao.Name
    $Statusaplicacao = $aplicacao.state
    Write-Host "A aplicação $nomeaplicacao está com status $Statusaplicacao"

    if($Statusaplicacao -eq "Started"){ # verifica se a aplicação está iniciada
        #Restart-WebAppPool $nomeaplicacao.applicationPool
        Write-Host -ForegroundColor Green "Feito o RECICLE do pool $nomeaplicacao"
        Write-Host ""
    }Else{
        Write-Host -ForegroundColor Cyan "Não foi executada alteração no pool $nomeaplicacao"
        Write-Host ""
    }
}
Write-Host "==========================================================="
Write-Host "|                                                         |" 
Write-Host "|          ----> Pressione ENTER para sair <----          |"
Write-Host "|                                                         |"
Write-Host "==========================================================="
Read-Host " "