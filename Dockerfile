FROM node:23.9.0-alpine AS build
WORKDIR /usr/local/app
COPY ./ /usr/local/app/
RUN npm install
RUN npm run build --prod
FROM nginx:latest
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /usr/local/app/dist/fdp-dashboard/browser /usr/share/nginx/html
EXPOSE 80