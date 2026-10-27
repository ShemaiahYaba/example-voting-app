FROM node:18-slim@sha256:f9ab18e354e6855ae56ef2b290dd225c1e51a564f87584b9bd21dd651838830e

# add curl for healthcheck and libcap so the node user can bind port 80;
# upgrade pulls fixed debian packages (gnutls, perl) flagged by Trivy
RUN apt-get -o Acquire::Retries=5 update && \
    apt-get -o Acquire::Retries=5 upgrade -y --no-install-recommends && \
    apt-get -o Acquire::Retries=5 install -y --no-install-recommends curl tini libcap2-bin && \
    rm -rf /var/lib/apt/lists/* && \
    setcap 'cap_net_bind_service=+ep' "$(readlink -f "$(command -v node)")"

WORKDIR /usr/local/app

COPY package*.json ./

RUN npm ci && \
    npm cache clean --force && \
    mv /usr/local/app/node_modules /node_modules && \
    # drop bundled npm (ships vulnerable tar); runtime only needs node
    rm -rf /usr/local/lib/node_modules/npm /usr/local/bin/npm /usr/local/bin/npx && \
    chown -R node:node /usr/local/app /node_modules

COPY --chown=node:node . .

ENV PORT=80
EXPOSE 80

USER node

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["node", "server.js"]
