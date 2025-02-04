#!/bin/bash

configure_nginx(){
    echo "Instalando Nginx..."
    sudo apt update -y
    sudo apt install -y nginx

    # #######################################################################################
# # Diretório onde o arquivo HTML será criado
# dir="/var/www/html"

# # Nome do arquivo HTML
# html_file="index.html"

# # Conteúdo do arquivo HTML
# html_content=$(cat <<EOL
# <!DOCTYPE html>
# <html lang="en">
# <head>
#     <meta charset="UTF-8">
#     <meta name="viewport" content="width=device-width, initial-scale=1.0">
#     <title>Hello, World!</title>
# </head>
# <body>
#     <h1>Hello, World!</h1>
# </body>
# </html>
# EOL
# )

# # Cria o arquivo HTML
# echo "$html_content" | tee "$dir/$html_file" > /dev/null

# echo "Arquivo HTML gerado em: $dir/$html_file"


# # Nome do arquivo de configuração
# config_file="/etc/nginx/sites-available/server.conf"

# # Conteúdo do arquivo de configuração
# config_content=$(cat <<EOL
# server {
#     listen 80;
#     server_name meusite.com www.meusite.com;

#     location / {
#         root /var/www/html;
#         index index.html index.htm;
#     }

#     # Adicione mais configurações conforme necessário
# }
# EOL
# )

# # Crie o arquivo de configuração
# echo "$config_content" | sudo tee "$config_file" > /dev/null

# # Crie um link simbólico para sites-enabled
# sudo ln -s "$config_file" "/etc/nginx/sites-enabled/"

# # Teste a configuração do Nginx
# sudo nginx -t

# # Recarregue o Nginx para aplicar as alterações
# sudo systemctl reload nginx

}