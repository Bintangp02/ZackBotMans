FROM node:16.13.0

RUN apt-get update && \
  apt-get install -y \
  neofetch \
  chromium \
  ffmpeg \
  webp \
  wget \
  imagemagick && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .
RUN npm install -g npm@latest
RUN npm install
RUN npm install pm2 -g
ENV PM2_PUBLIC_KEY x0ekghkc9c17076
ENV PM2_SECRET_KEY 9qlago78r4l8ths

COPY . .
EXPOSE 5000

CMD ["pm2-runtime", "index.js"]`