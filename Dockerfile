FROM node

MAINTAINER [Alejandro Baez](https://twitter.com/a_baez)

ENV COPAY_VERSION 1.1.2

RUN curl -L https://github.com/bitpay/copay/archive/v$COPAY_VERSION.tar.gz | tar -zxvf -
WORKDIR /copay-$COPAY_VERSION

# dependencies
RUN npm install -g grunt-cli bower

# install grunt
RUN echo 'y' | bower install --allow-root

RUN npm install
RUN grunt


EXPOSE 3000

CMD ["npm", "start"]
