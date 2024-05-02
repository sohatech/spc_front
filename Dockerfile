FROM node:20-alpine

RUN apk update && apk upgrade && \ 
    apk add --no-cache curl gnupg git

RUN curl -o- -L https://yarnpkg.com/install.sh | sh

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

EXPOSE 3000

CMD ["yarn", "run", "dev"]
