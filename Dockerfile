FROM alpine:latest

RUN apk --no-cache add nodejs npm

WORKDIR /app

COPY . .

RUN npm install

CMD ["npm", "start"]
