# Build stage
FROM node:18-alpine as build

WORKDIR /app
COPY Views/package*.json ./
RUN npm install
COPY Views/ .
RUN npm run build

# Production stage
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx/react.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"] 