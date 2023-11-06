FROM node:14-alpine as builder
WORKDIR /app
COPY package*.json ./
COPY files/ /app/files/
RUN npm install
FROM node:14-alpine
WORKDIR /app
COPY --from=builder /app/node_modules /app/node_modules
COPY --from=builder /app/files /app/files
CMD ["node", "webui.js"]
EXPOSE 80