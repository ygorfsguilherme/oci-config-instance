# Description: Script para configurar, desabilitar e remover swap
menu_ini_swap="$banner
1) Configurar Swap
2) Desabilitar Swap
3) Remover Swap

9) Menu Inicial
0) Sair
"

menu_swap() {

    while true; do
        clear
        echo "$menu_ini_swap"
        read -n 1 -p "Escolha uma opção: " option
        echo " "	
        echo $option

        case $option in
            0)
                echo "Saindo..."
                exit
                ;;
            1)
                configure_swap
                ;;
            2)
                disable_swap
                ;;
            3)
                remove_swap
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

remove_swap() {
    # Removendo Swap
    sudo swapoff /swapfile
    sudo rm /swapfile
    sudo sed -i '/\/swapfile/d' /etc/fstab
    echo "Swap removido com sucesso!"
    to_continue
}

disable_swap() {
    # Desabilitar swap
    sudo swapoff -a
    echo "Swap desabilitado com sucesso!"
    to_continue

}

configure_swap() {
    # Configurando Swap
    read -n 1 -p "Escolha as opções de swap: 1 - 2GB, 2 - 4GB, 3 - 8GB: " swap_option
    echo " "

    # Tamanho de swap em MB
    case $swap_option in
        1) swap_size=2048 ;;  # 2GB em MB
        2) swap_size=4096 ;;  # 4GB em MB
        3) swap_size=8192 ;;  # 8GB em MB
        *) 
            echo -e "\033[0;31mOpção inválida!\033[0m"
            to_continue
            return
            ;;
    esac

    echo "Criando arquivo de swap de $swap_size MB"
    sudo dd if=/dev/zero of=/swapfile bs=1M count=$swap_size status=progress

    # Definindo permissões e ativando o swap
    sudo chmod 600 /swapfile
    sudo mkswap /swapfile
    sudo swapon /swapfile

    # Adicionando o swap ao fstab para persistência
    if ! grep -q '/swapfile' /etc/fstab; then
        echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
    fi

    echo "Swap de $swap_size MB configurado com sucesso!"
    to_continue
}
