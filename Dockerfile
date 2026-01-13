# ---------------- UI BUILD ----------------
FROM node:18 AS ui-build
WORKDIR /usr/src/app

COPY client/ ./client/
RUN cd client && npm install && npm run build

# ---------------- API BUILD ----------------
FROM node:18 AS server-build
WORKDIR /usr/src/app

COPY nodeapi/ ./nodeapi/
RUN cd nodeapi && npm install

# ---------------- RUNTIME ----------------
FROM node:18
WORKDIR /usr/src/app

COPY --from=server-build /usr/src/app/nodeapi/ ./
COPY --from=ui-build /usr/src/app/client/dist ./client/dist

EXPOSE 4200
EXPOSE 5000

CMD ["npm", "start"]
