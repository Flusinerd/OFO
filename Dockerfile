FROM node:current-alpine
ENV NODE_ENV=production

RUN mkdir /opt/ofo
WORKDIR /opt/ofo/

COPY ./backend /opt/ofo/

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.7.3/wait /wait
RUN chmod +x /wait

EXPOSE 3000

CMD /wait && node /opt/ofo/dist/main.js && echo "App Started"




