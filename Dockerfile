FROM redis:6.0.8-buster
RUN apt update
RUN apt install glibc -y
WORKDIR /root/cloudreve
ADD cloudreve ./cloudreve
ADD conf.ini ./conf.ini
ADD cloudreve.db ./cloudreve.db
ADD run.sh ./run.sh
ADD key.bin ./key.bin

RUN chmod +x ./cloudreve
RUN chmod +x ./run.sh

CMD ./run.sh
