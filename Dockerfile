# Use a different registry's Node image
FROM alpine/node:18-alpine

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm install -g serve
EXPOSE 10000
CMD ["serve", "-s", ".", "-l", "10000"]
