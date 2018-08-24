FROM node:8

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

#install taobao image for npm
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org

# If you are building your code for production
# RUN npm install --only=production
RUN cnpm install

# Bundle app source
COPY . .

EXPOSE 3000

CMD [ "npm", "start", "node" ]
