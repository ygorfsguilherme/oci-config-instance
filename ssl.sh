install_ssl(){
    sudo apt update -y
    sudo apt install -y certbot python3-certbot-nginx
    echo "SSL Instalado com sucesso!"
    to_continue
}

active_ssl(){
    echo "Formatado de entrada: example.com"
    read -p "Enter your domain: " DOMAIN
    sudo certbot --nginx -d $DOMAIN -d www.$DOMAIN
    echo "SSL Ativado com sucesso!"
    to_continue
}

disable_ssl(){
    sudo certbot delete
    echo "SSL Desativado com sucesso!"
    to_continue
}

menu_ssl(){
    while true; do
        clear
        echo "$banner"
        echo "1) Instalar SSL"
        echo "2) Ativa SSL"
        echo "3) Desativa SSL"
        echo " "
        echo "9) Menu Inicial"
        echo "0) Sair"
        echo " "
        read -n 1 -p "Escolha uma opção: " option
        echo " "	
        echo $option

        case $option in
            0)
                echo "Exiting..."
                exit
                ;;
            1)
                install_ssl
                ;;
            2)
                active_ssl
                ;;
            3)
                disable_ssl
                ;;
            9)
                return
                ;;
            *)
                echo -e "\e[31mInvalid option!\e[0m"
                to_continue
                return
                ;;
        esac
    done
}