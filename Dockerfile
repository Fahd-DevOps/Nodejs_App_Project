# Stage 1: Build stage
FROM node:12 AS build
COPY nodeapp /nodeapp
WORKDIR /nodeapp
RUN npm install

# Stage 2: Production stage
FROM node:12
COPY --from=build /nodeapp /nodeapp
WORKDIR /nodeapp
CMD ["node", "app.js"]