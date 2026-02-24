# Base image
FROM node:18-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of your app
COPY . .

# Expose the port (use environment variable or default 3000)
ENV PORT=3000
EXPOSE $PORT

# Environment variables (passed via .env)
ENV DOMAIN=$DOMAIN
ENV STATIC_DIR=$STATIC_DIR
ENV PUBLISHABLE_KEY=$PUBLISHABLE_KEY
ENV SECRET_KEY=$SECRET_KEY

# Start the server
CMD ["node", "server.js"]
