# Overlay of the benchmark's s3/Dockerfile (that folder is vendored unchanged in app/, moved here from build/frontend/app/s3/).
# What differs from upstream:
# - the COPY sources point into app/ (this folder is the build context);
# - npm resolves dependencies as of 2024-06-01 (npm_config_before): the folder's package-lock.json is
#   lockfileVersion 3, which node:14's npm 6 ignores, so today's releases (e.g. @dabh/diagnostics)
#   install and crash on Node 14.
# Everything else is upstream's, line for line.

FROM node:14-alpine
ENV npm_config_before=2024-06-01

RUN apk --no-cache add curl
WORKDIR /app
COPY app/ .
RUN npm install 
EXPOSE 8333
CMD [ "npm", "start" ]
