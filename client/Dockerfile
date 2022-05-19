FROM node:14-slim as build

ARG GIT_COMMIT

WORKDIR /usr/src

# Install dependencies
RUN apt-get update \
      && apt-get install -y git python build-essential

# Install and build culturestake app
RUN git clone https://github.com/BiocenosisLabs/AcousticGarden.git app \
      && cd app \
      && git checkout --quiet ${GIT_COMMIT}

WORKDIR /usr/src/app/src/client-app

RUN npm ci \
      && npm run build

# Remove unneeded dependencies
RUN apt-get purge -y --auto-remove build-essential

FROM nginx:1.17.8-alpine

COPY --from=build /usr/src/app/src/client-app/build /usr/share/nginx/html

RUN rm /etc/nginx/conf.d/default.conf

COPY /client/nginx.conf /etc/nginx/conf.d

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]