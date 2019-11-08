FROM node

RUN apt-get install openssh-client \
        libc6-compat \
        libstdc++

COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]