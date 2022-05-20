FROM cypress/browsers:chrome69

# avoid too many progress messages
# https://github.com/cypress-io/cypress/issues/1243
ENV CI=1

RUN echo "whoami: $(whoami)"
RUN npm config -g set user $(whoami)

WORKDIR /e2e

COPY package.json .
COPY yarn.lock .
RUN yarn install --frozen-lockfile

COPY ./ .

CMD ["yarn","run","test"]
