FROM ubuntu:14.04
RUN apt-get -y update 
RUN apt-get -y install socat 

RUN touch file1.txt
RUN echo 'Hello World' > file1.txt

CMD socat TCP4-LISTEN:9001 SYSTEM:'cat file1.txt'
