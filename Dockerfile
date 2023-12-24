# Use an official Node.js runtime as the base image
FROM node:18

# Set the working directory in the container to /app
WORKDIR /app

# Copy package.json, pnpm-lock.yaml into the directory /app in the container
COPY package*.json pnpm-lock.yaml ./

# Install pnpm
RUN npm install -g pnpm

# Install any needed packages specified in package.json
RUN pnpm install

# Bundle the app source inside the Docker image
COPY . .

# Make port 3000 available to the outside world
EXPOSE 3000

# Run "pnpm start" when the container launches
CMD ["pnpm", "start"]