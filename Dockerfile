FROM node:20-alpine

RUN apk add --no-cache curl gnupg

RUN curl -o- -L https://yarnpkg.com/install.sh | sh

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "run" , "dev"]
