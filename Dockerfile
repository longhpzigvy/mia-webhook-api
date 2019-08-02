FROM node:10-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN apk add --no-cache --virtual build-dependencies \
        python \
        make \
        g++ \
        bash \
        autoconf \
        automake \
        libc6-compat \
        libjpeg-turbo-dev \
        libpng-dev \
    && yarn \
    && apk del build-dependencies
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 3001
CMD [ "yarn", "start" ]