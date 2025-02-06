# OCI - Configurador de Instalação POS

O Configurador de Servidor Web para OCI é uma ferramenta que simplifica a configuração de servidores web na Oracle Cloud Infrastructure (OCI). Com este configurador, você pode configurar e gerenciar servidores web rapidamente, otimizando o tempo e reduzindo a complexidade das tarefas administrativas.

## Principais Recursos:
- Configuração automática de servidores web
- Suporte para vários tipos de servidores (Apache e Nginx)
- Suporte a SSL
- Interface amigável, intuitiva e leve

## Dependências Necessárias:

```bash
sudo apt install curl
```

## Primeiros Passos

Para começar a usar o configurador, execute os seguintes comandos:

```bash
curl -sSL https://raw.githubusercontent.com/ygorfsguilherme/oci-config-instance/main/install-config.sh | bash
```

## Executando a Aplicação

Para executar o aplicativo, execute:

```bash
cd ocpi && bash ./start_app.sh
```