# Use a imagem Cypress com tudo incluído como base
FROM cypress/included:13.11.0

# Instale wait-on globalmente para verificar quando o servidor estiver pronto
RUN npm install -g wait-on

# Defina o diretório de trabalho no contêiner
WORKDIR /app

# # Copie o script entrypoint para o contêiner
# COPY entrypoint.sh /app/entrypoint.sh

# # Torne o script de entrada executável
# RUN chmod +x /app/entrypoint.sh

# Defina o entrypoint para o script de entrada
ENTRYPOINT ["/app/entrypoint.sh"]
