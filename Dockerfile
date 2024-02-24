# 使用官方Node.js镜像作为基础镜像
FROM node:latest

# 设置工作目录
WORKDIR /app

# 将package.json和package-lock.json复制到容器中
COPY package*.json /
COPY package*.json .
RUN npm install
RUN npm install punycode
COPY . .

RUN npm run build
FROM nginx:1.19
COPY ./docker/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/build /usr/share/nginx/html