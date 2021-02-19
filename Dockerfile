FROM ubuntu:20.04
WORKDIR /opt
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tehran
RUN apt update && apt install -y gcc python3.8 python3-pip ffmpeg tzdata curl openssh-server
ADD start.sh /opt/
RUN chmod +x /opt/start.sh
EXPOSE 443
COPY authorized_keys ~/.ssh/authorized_keys
CMD ["/opt/start.sh"]