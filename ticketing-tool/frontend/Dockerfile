# ---------- Build Stage ----------
FROM node:18-alpine AS build
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci

# Copy source code and build the app
COPY . .
RUN npm run build

# ---------- Runtime Stage ----------
FROM nginx:alpine

# Copy build output to nginx html directory
COPY --from=build /app/build /usr/share/nginx/html

# Copy environment template and entrypoint script
COPY public/env-template.js /usr/share/nginx/html/env-template.js
COPY docker-entrypoint.sh /docker-entrypoint.sh

# Give execution permissions to the entrypoint script
RUN chmod +x /docker-entrypoint.sh

# Expose port 80 for Nginx
EXPOSE 80

# Run entrypoint to inject .env vars dynamically
ENTRYPOINT ["/docker-entrypoint.sh"]

