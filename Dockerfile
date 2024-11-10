# Etapa 1: Imagem base com Node.js
FROM node:16 AS build

# Diretório de trabalho
WORKDIR /app

# Copia o package.json e package-lock.json para instalar as dependências
COPY package*.json ./

# Instala as dependências
RUN npm install

# Copia todo o código do projeto para dentro da imagem
COPY . ./app

# Build do projeto React
RUN npm run build

# Etapa 2: Servir o app com um servidor estático
FROM nginx:alpine

# Copia os arquivos de build para o diretório de servidor do Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Expor a porta 80
EXPOSE 3030

# Inicia o Nginx no modo foreground
CMD ["nginx", "-g", "daemon off;"]
