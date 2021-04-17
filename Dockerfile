FROM node:lts-alpine
WORKDIR /build
RUN npm set registry https://registry.npm.taobao.org
COPY package.json /build/package.json
RUN npm install
COPY ./ /build
RUN npm run build

FROM nginx
RUN mkdir /app
COPY --from=0 /build/dist /usr/share/nginx/html
EXPOSE 80