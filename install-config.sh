#!/bin/bash
#
#
#
#######################################################################################
sudo apt update
sudo apt install -y nginx certbot python3-certbot-nginx firewalld unzip

sudo ufw disable
sudo apt remove --purge -y ufw

sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --add-service=ssh --permanent
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --add-service=https --permanent
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload

#######################################################################################
# Configurando Swap
sudo dd if=/dev/zero of=/swapfile bs=1M count=4096
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

#######################################################################################
# Diretório onde o arquivo HTML será criado
dir="/var/www/html"

# Nome do arquivo HTML
html_file="index.html"

# Conteúdo do arquivo HTML
html_content=$(cat <<EOL
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hello, World!</title>
</head>
<body>
    <h1>Hello, World!</h1>
</body>
</html>
EOL
)

# Cria o arquivo HTML
echo "$html_content" | tee "$dir/$html_file" > /dev/null

echo "Arquivo HTML gerado em: $dir/$html_file"


# Nome do arquivo de configuração
config_file="/etc/nginx/sites-available/server.conf"

# Conteúdo do arquivo de configuração
config_content=$(cat <<EOL
server {
    listen 80;
    server_name meusite.com www.meusite.com;

    location / {
        root /var/www/html;
        index index.html index.htm;
    }

    # Adicione mais configurações conforme necessário
}
EOL
)

# Crie o arquivo de configuração
echo "$config_content" | sudo tee "$config_file" > /dev/null

# Crie um link simbólico para sites-enabled
sudo ln -s "$config_file" "/etc/nginx/sites-enabled/"

# Teste a configuração do Nginx
sudo nginx -t

# Recarregue o Nginx para aplicar as alterações
sudo systemctl reload nginx


