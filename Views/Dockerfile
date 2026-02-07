# Build stage
FROM node:18-alpine as build

WORKDIR /app
# Copy only package files first for better layer caching.
COPY Views/package*.json ./
RUN npm install

# Build-time env for Vite (used at build, not runtime).
ARG VITE_BASE_URL
ARG VITE_OPTIONAL_LOGIN
ENV VITE_BASE_URL=${VITE_BASE_URL}
ENV VITE_OPTIONAL_LOGIN=${VITE_OPTIONAL_LOGIN}

# Copy the rest of the frontend sources and build.
COPY Views/ .
RUN npm run build

# Production stage
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx/react.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]