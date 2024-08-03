#!/bin/bash

# Exibir variáveis de ambiente e conteúdo do diretório para depuração
echo "Variáveis de ambiente:"
env

echo "Conteúdo do diretório /app:"
ls -la /app

echo "Instalando dependências..."
npm install

echo "Verificando o Cypress..."
npx cypress install
npx cypress verify

echo "Iniciando servidor Angular..."
npm run start > server.log 2>&1 &

# Espera para garantir que o servidor iniciou
echo "Aguardando o servidor Angular estar pronto..."
wait-on http://localhost:4200 --timeout 60000

# Verificar se a espera foi bem-sucedida antes de prosseguir
if [ $? -eq 0 ]; then
    echo "Executando testes Cypress..."
    npx cypress run
else
    echo "Erro: O servidor Angular não está acessível."
    exit 1
fi

echo "Logs do servidor Angular (final):"
cat server.log
