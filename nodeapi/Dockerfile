# Build stage
FROM node:18 AS nodeapi-build
WORKDIR /usr/src/app

COPY ./ ./nodeapi/
RUN cd nodeapi && npm install

# Runtime stage
FROM node:18
WORKDIR /usr/src/app

COPY --from=nodeapi-build /usr/src/app/nodeapi/ ./

EXPOSE 5000
CMD ["npm", "start"]
