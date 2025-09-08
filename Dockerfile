FROM node:20-alpine

# Tạo thư mục app
WORKDIR /app

# Copy package.json trước để install dep
COPY package*.json ./

# Cài production dependencies
RUN npm install --only=production

# Copy thư mục dist đã build sẵn
COPY dist ./dist

# Copy file config
COPY app.yml ./app.yml

# Copy languages folder
COPY languages ./languages

# Chạy bot
CMD ["node", "--no-deprecation", "./dist/index.js"]
