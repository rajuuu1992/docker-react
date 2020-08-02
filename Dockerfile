FROM node:alpine AS mybuilder

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx 
COPY --from=mybuilder /app/build /usr/share/nginx/html