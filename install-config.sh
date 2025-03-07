#!/bin/bash
#
#
# Script de configuração de instância OCI
# Disponível para Ubuntu 22.04, preferencialmente a versão minimal
#######################################################################################

# Função para checar e instalar pacotes
check_and_install() {
    if ! dpkg -l | grep -q $1; then
        sudo apt install -y $1
    else
        echo "$1 já está instalado."
    fi
}

first_exec() {
    if [ ! -f exec ]; then
        sudo apt update -y
        check_and_install unzip
        check_and_install curl
        check_and_install git
        check_and_install wgets
        echo "Instalação de dependências concluída."

        echo "Download do script de configuração..."
        mkdir ocpi
        cd ocpi
        sudo chown $USER:$USER .
        wget -c https://github.com/ygorfsguilherme/oci-config-instance/archive/refs/heads/main.zip -O main.zip
        unzip -j main.zip
        
        touch exec
        sleep 5

        echo "Para da início o script de configuração, execute o comando:"
        echo "cd ocpi"
        echo "bash ./start_app.sh"
        read -n 1 -p "Pressione Enter para continuar..." enter
        
    else
        echo "O script já foi executado."
        read -n 1 -p "Pressione Enter para continuar..." enter
    fi
}

first_exec
