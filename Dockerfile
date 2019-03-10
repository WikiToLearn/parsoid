FROM node:6
ADD ./docker-npm-install.sh /docker-npm-install.sh

RUN git clone https://github.com/wikimedia/parsoid && cd parsoid && git checkout v0.7.1 && rm -Rf .git/

WORKDIR parsoid

RUN /docker-npm-install.sh

EXPOSE 8000

ADD ./kickstart.sh /
RUN chmod +x /kickstart.sh
CMD /kickstart.sh
