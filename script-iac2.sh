#!/bin/bash

set -e  # Para o script caso ocorra algum erro

echo "Atualizando o servidor..."
apt-get update -y
apt-get upgrade -y

echo "Instalando Apache e Unzip..."
apt-get install -y apache2 unzip

echo "Baixando e copiando os arquivos da aplicação..."
TEMP_DIR=$(mktemp -d)
cd $TEMP_DIR

wget -q https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip -O main.zip
unzip -q main.zip
cd linux-site-dio-main

cp -R * /var/www/html/

echo "Limpeza dos arquivos temporários..."
rm -rf $TEMP_DIR

echo "Processo concluído com sucesso!"
