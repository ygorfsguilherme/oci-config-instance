#!/bin/bash

# Importa os scripts necessários
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$DIR/firewalld.sh"
source "$DIR/ssl.sh"
source "$DIR/show_menu.sh"
source "$DIR/nginx.sh"
source "$DIR/swap.sh"
source "$DIR/banner.sh"


to_continue() {
    read -n 1 -p "Pressione Enter para continuar..." enter
}

menu_main () {
    show_menu
    read -n 1 -p "Escolha uma opção: " option
    echo " "	
    echo $option

    case $option in
        0)
            echo "Saindo..."
            exit
            ;;
        1)
            menu_swap
            ;;
        2)
            menu_firewalld
            ;;
        3)
            menu_ssl
            ;;
        4)
            configure_nginx
            ;;
        *)
            echo -e "\e[31mOpção inválida!\e[0m"
            read -n 1 -p "Pressione Enter para continuar..." enter
            return
            ;;
    esac
}