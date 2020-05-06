# Build phase 
FROM node:alpine as builder
WORKDIR /app/
COPY package*.json ./
RUN npm install --no-optional
COPY ./ ./
RUN npm run build


# Run Phase
FROM nginx 
EXPOSE 3000
# Routing configuration
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

# Assets path
COPY --from=builder /app/build /usr/share/nginx/html
