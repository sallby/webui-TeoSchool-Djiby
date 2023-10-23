FROM node:4-slim
RUN npm install express
RUN npm install redis@3
COPY files/ /files/
COPY webui.js /

RUN apt update -y && apt install -y dnsutils netcat 

CMD ["node", "webui.js"]
EXPOSE 80
