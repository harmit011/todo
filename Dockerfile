# Build stage 
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# Runtime image
FROM nginx:alpine
COPY --from=node /app/dist/todo-ang /usr/share/nginx/html