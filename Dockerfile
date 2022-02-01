FROM ubuntu:20.04

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install git -y
RUN apt-get install -y cargo
RUN apt-get install -y curl
# RUN apt-get install -y pkg-config   # Install this manually into the container, as it prompts for region by number.

CMD ["./main.sh"]