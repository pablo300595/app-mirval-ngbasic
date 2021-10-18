FROM node:alpine as builder_phase
WORKDIR '/usr/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx as run_phase
EXPOSE 80
COPY --from=builder_phase /usr/app/dist /usr/share/nginx/html