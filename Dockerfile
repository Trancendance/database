FROM transcendence-base
WORKDIR /usr/src/app
COPY backend/. .
RUN npm install
RUN npm run build
EXPOSE 3000
ENV NODE_ENV=development
CMD ["node", "dist/microservices/api/server.js"]
