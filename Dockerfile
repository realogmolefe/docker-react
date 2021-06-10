FROM node:alpine as builder
EXPOSE 8081
WORKDIR /app

COPY package.json .

RUN  npm install

COPY . .

RUN npm run build


FROM nginx 

COPY --from=builder /app/build /usr/share/nginx/html
