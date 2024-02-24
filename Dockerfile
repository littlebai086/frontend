# 使用官方Node.js镜像作为基础镜像
FROM node:latest

WORKDIR /lit-clothing

COPY package*.json .
RUN npm install
COPY . .

RUN npm run build
FROM nginx:1.19
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /lit-clothing/build /usr/share/nginx/html