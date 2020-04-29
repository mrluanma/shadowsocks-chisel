FROM heroku/heroku:20
RUN curl -sSL https://github.com/jpillora/chisel/releases/download/v1.4.0/chisel_1.4.0_linux_amd64.gz | zcat > /bin/chisel
RUN curl -sSL https://github.com/shadowsocks/shadowsocks-go/releases/download/1.1.5/shadowsocks-server-linux64-1.1.5.gz | gzip -d - > /bin/shadowsocks-server
RUN curl -sSL https://github.com/mattn/goreman/releases/download/v0.0.10/goreman_linux_amd64.zip | gzip -d - > /bin/goreman
RUN chmod +x /bin/chisel /bin/shadowsocks-server /bin/goreman
RUN useradd -m heroku
USER heroku
EXPOSE 5000
COPY Procfile Procfile
CMD goreman -b=$PORT start
