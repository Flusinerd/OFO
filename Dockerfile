FROM node

RUN mkdir /opt/ofo

RUN git clone https://github.com/Datenlotse/OFO.git /opt/ofo

RUN cd /opt/ofo && git submodule update --init --recursive

RUN cd /opt/ofo/frontend && npm i

RUN cd /opt/ofo/backend && npm i

RUN cd /opt/ofo/frontend && npm run build:prod

RUN cp /opt/ofo/frontend/dist/ofo-app/* /opt/ofo/backend/src/client/

RUN cd /opt/ofo/backend && npm run build

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.7.3/wait /wait
RUN chmod +x /wait

WORKDIR /opt/ofo/backend

EXPOSE 3000

CMD /wait && npm run start:prod && echo "App Started"




