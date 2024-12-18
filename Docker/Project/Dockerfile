# Use an existing image as a base
FROM docker.io/node:18-alpine

# Create a Work Directory
WORKDIR /usr/app

# Copy our current directory into the container
COPY ./package.json ./

# Install Dependencies
RUN npm install

#Copy the rest of the files
COPY . .

# Startup Command
CMD ["npm", "run", "serve"]