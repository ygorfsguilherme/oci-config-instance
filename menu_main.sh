#!/bin/bash

# Importa os scripts necessários
source ./firewalld.sh
source ./ssl.sh
source ./show_menu.sh
source ./nginx.sh
source ./swap.sh
source ./banner.sh

to_continue() {
    read -n 1 -p "Pressione Enter para continuar..." enter
}

menu_main () {
    show_menu
    read -p "Escolha uma opção: " option
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
            # to_continue
            # return
            ;;
    esac
}