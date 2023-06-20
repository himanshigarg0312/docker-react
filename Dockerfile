# Use an existing docker image as a base
FROM node:16-alpine as builder

WORKDIR '/app'

#COPY the package.json file
COPY ./package.json ./

# Install dependencies
RUN npm install

# Copy the rest of the files
COPY ./ ./

#RUN 'npm run build'
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

