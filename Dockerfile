# Use Node.js for static file serving
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all website files
COPY . .

# Install a simple static server if not using live-server in production
RUN npm install -g serve

# Expose port (Render uses $PORT environment variable)
EXPOSE 10000

# Use serve for production static file serving
CMD ["npx", "serve", "-s", ".", "-l", "10000"]
