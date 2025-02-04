#!/bin/bash
#
# Configuração do Firewalld

# Function to install firewalld
install_firewalld() {
    echo "Instalando Firewalld..."
    sudo apt update -y
    sudo apt install -y firewalld

    echo "Firewalld instalado com sucesso!"
    to_continue
}

# Function to remove firewalld
remove_firewalld() {
    echo "Removendo Firewalld..."
    sudo apt remove -y firewalld
    sudo apt autoremove -y
    echo "Firewalld removido com sucesso!"
    to_continue
}

# Function to disable firewalld
disable_firewalld() {
    echo "Desabilitando Firewalld..."
    sudo systemctl stop firewalld
    sudo systemctl disable firewalld
    echo "Firewalld desabilitado com sucesso!"
    to_continue
}

# Function to liberate a port in firewalld
liberate_port_firewalld() {
    read -p "Informe a porta que deseja liberar: " port
    sudo firewall-cmd --add-port=$port/tcp --permanent
    sudo firewall-cmd --reload
    echo "Porta $port liberada com sucesso!"
    to_continue
}

# Function to liberate a service in firewalld default
liberate_service_firewalld() {
    services=("ssh" "http" "https")
    ports=("80/tcp" "8080/tcp")

    echo "Liberando serviços padrão no Firewalld..."
    for service in "${services[@]}"; do
        sudo firewall-cmd --add-service=$service --permanent
    done

    echo "Liberando portas padrão no Firewalld..."
    for port in "${ports[@]}"; do
        sudo firewall-cmd --permanent --add-port=$port
    done

    sudo firewall-cmd --reload
    echo "Serviços e portas liberados com sucesso!"
    to_continue
}

# Function to configure firewalld automatically
configure_firewalld_auto () {
    echo "Atualizando a base..."
    sudo apt update -y

    echo "Instalando Firewalld..."
    sudo apt install -y firewalld

    echo "Configurando Firewalld..."
    sudo systemctl start firewalld
    sudo systemctl enable firewalld

    services=("ssh" "http" "https")
    ports=("80/tcp" "8080/tcp")

    for service in "${services[@]}"; do
        sudo firewall-cmd --add-service=$service --permanent
    done

    for port in "${ports[@]}"; do
        sudo firewall-cmd --permanent --add-port=$port
    done

    sudo firewall-cmd --reload
    echo "Firewalld configurado com sucesso!"
    to_continue
}


# Function to show the firewalld menu
menu_firewalld() {
    while true; do
        clear
        echo "$banner"
        echo "1) Instalar Firewalld"
        echo "2) Remover Firewalld"
        echo "3) Desabilitar Firewalld"
        echo "4) Liberar porta"
        echo "5) Liberar serviços padrão"
        echo "6) Auto (Instalar, configurar e liberar serviços)"
        echo ""
        echo "9) Menu Inicial"
        echo "0) Sair"
        echo ""
        read -n 1 -p "Escolha uma opção: " option
        echo " "	
        echo $option

        case $option in
            0)
                echo "Saindo..."
                exit
                ;;
            1)
                install_firewalld
                ;;
            2)
                remove_firewalld
                ;;
            3)
                disable_firewalld
                ;;
            4)
                liberate_port_firewalld
                ;;
            5)
                liberate_service_firewalld
                ;;
            6)
                configure_firewalld_auto
                ;;
            9)
                return
                ;;
            *)
                echo -e "\e[31mOpção inválida!\e[0m"
                to_continue
                return
                ;;
        esac
    done
}
