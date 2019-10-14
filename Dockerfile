FROM rawmind/alpine-jdk8:1.8.181-0
MAINTAINER gaolianbo@qq.com

RUN mkdir -p /app && \
    chown -R root /app

# 时区设置成当前时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone

COPY  entrypoint.sh /usr/local/bin/

USER root

WORKDIR /app

VOLUME /app
VOLUME /app/logs

EXPOSE 8080

ENTRYPOINT ["/bin/bash","/usr/local/bin/entrypoint.sh"]
