FROM node:24-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install
COPY . .    

FROM node:24-alpine AS runner

WORKDIR /app
COPY --from=build /app .

EXPOSE 3000

CMD [ "node", "app.js" ]
