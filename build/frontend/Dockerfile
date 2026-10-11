# Overlay of the benchmark's frontend/Dockerfile (the benchmark is vendored unchanged in app/).
# What differs from upstream:
# - the COPY sources point into app/frontend/ (this folder is the build context);
# - the FLAG build argument defaults to this lab's fixed flag, the value upstream's Makefile passes (FLAG{sha256 of the benchmark id}), since the spec passes no build arguments.
# Everything else is upstream's, line for line.

FROM node:20-alpine

RUN apk --no-cache add curl

WORKDIR /app
COPY app/frontend/ .
RUN npm install 
RUN npm run build
EXPOSE 3000
ARG FLAG=FLAG{6ffa1700f30305012bdcc93098c13d8ba018ef612be6ddef99d9ae8502806f6b}
RUN sed -i s/@FLAG@/$FLAG/g .env

CMD ["npm", "start"]

# CyberCTF per-player flag: the flag above is only the development fallback. ctf-entrypoint.sh
# puts the player's flag (CTF_FLAG_MAIN) in its place at every start, then runs the original
# entrypoint and command, repeated here unchanged.
COPY ctf-entrypoint.sh /usr/local/bin/ctf-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/ctf-entrypoint.sh", "docker-entrypoint.sh"]
CMD ["npm", "start"]
