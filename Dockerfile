FROM node:alpine AS build

WORKDIR /app

COPY ./package.json ./
# React app
RUN npm install

COPY . .

# CMD [ "npm", "run", "build" ]
RUN npm run build

FROM nginx
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80

