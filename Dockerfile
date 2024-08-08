FROM python:3.10-slim

RUN apt update && apt install -y make patchelf build-essential

ADD example.mcap main.py Makefile requirements.txt /app/
WORKDIR /app

RUN make install
RUN make onefile

CMD ["dist/main.dist/main"]
