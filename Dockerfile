# Using an alpine Node.js runtime as the base image
FROM node:18-alpine

# Setting the working directory in the container
WORKDIR /app

# Copying package.json and package-lock.json to the container
COPY package*.json ./

# Installing application dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Expose the port your application will run on
EXPOSE 3000

# Setting Environment variables for MongoDB and Redis connection
ENV MONGODB_URI=mongodb://mongo:27017/mydb
ENV REDIS_HOST=redis
ENV REDIS_PORT=6379

# Starting the Node.js application
CMD ["npm", "start"]