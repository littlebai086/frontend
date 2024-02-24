# 使用官方Node.js镜像作为基础镜像
FROM node:latest

# 设置工作目录
WORKDIR / app

# 将package.json和package-lock.json复制到容器中
COPY package*.json /

# 安装项目依赖
RUN npm install

RUN npm install punycode
# 将当前目录内容复制到容器中的/app
COPY . .

# 构建应用
RUN npm run build

# 使用serve来服务你的静态站点
RUN npm install -g serve

# 暴露端口5000供外部访问
EXPOSE 3000

# 启动React应用
CMD ["serve", "-s", "build", "-l", "3000"]
# CMD ["npm", "start"]
