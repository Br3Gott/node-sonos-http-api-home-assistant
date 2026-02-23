FROM node:22-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install only production dependencies
RUN npm ci --omit=dev && npm cache clean --force

# Copy application files
COPY *.js ./
COPY lib ./lib
COPY presets ./presets
COPY static ./static

# Copy the startup script
COPY run.sh ./run.sh
RUN chmod +x ./run.sh

# Expose the application port
EXPOSE 5005

# Set environment variables
ENV NODE_ENV=production

# Define the command to run the application
CMD [ "./run.sh" ]
