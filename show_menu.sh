# Importa os scripts necessários
source ./banner.sh

# Armazenando o menu em uma única variável
menu="$banner
1) Swap            2) Firewalld           3) SSL Certbot           4) Web Server  
0) Exit
"

# Função para exibir o menu
show_menu() {
    clear
    echo "$menu"
}