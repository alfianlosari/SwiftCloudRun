FROM ibmcom/swift-ubuntu:latest

WORKDIR /usr/src/app

COPY . .

RUN swift build --configuration release

CMD [ "swift", "run", "--configuration", "release"  ]