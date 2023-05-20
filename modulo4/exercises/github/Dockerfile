FROM node:14
WORKDIR /app

# Add the application files
COPY hangman-front/ ./hangman-front/

# Install dependencies
RUN cd hangman-front && npm install

# Build the application
RUN cd hangman-front && npm run build

# Expose port
EXPOSE 3000

# Set the command
CMD cd hangman-front && npm test
