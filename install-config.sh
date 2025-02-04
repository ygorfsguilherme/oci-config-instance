#!/bin/bash
#
#
# Script de configuração de instância OCI
# Disponível para Ubuntu 22.04, preferencialmente a versão minimal
#######################################################################################
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$DIR/firewalld.sh"
source "$DIR/ssl.sh"
source "$DIR/show_menu.sh"
source "$DIR/nginx.sh"
source "$DIR/swap.sh"
source "$DIR/banner.sh"


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

        echo "Instalação de dependências concluída."

        echo "Download do script de configuração..."
        mkdir ocpi
        cd ocpi
        sudo chown $USER:$USER .
        wget -c https://github.com/ygorfsguilherme/oci-config-instance/archive/refs/heads/main.zip -O main.zip
        unzip -j main.zip
        
        touch exec
        to_continue
        
    else
        echo "Execução já realizada."
    fi
}

first_exec


# if [[ "$PWD" == */ocpi ]]; then
#     source ./ocpi/menu_main.sh
#     echo "Está no diretório ocpi."
# else
    
#     echo "Não está no diretório ocpi."
# fi

# Início do loop
while true; do
    menu_main
done
