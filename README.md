# Broker

This is a simple message broker implementation in Ruby. It is a work in progress and is not yet fully functional.

It is based on the kafka message broker. The objective is to create a simple message broker that can be used to send messages between different services.

The broker is composed of the following components:

- A `Producer` that sends messages to the broker
- A `Consumer` that reads messages from the broker
- A `Broker` that stores messages in the file system
- A `Topic` that represents a topic
- A `Partition` that represents a partition
- A `Offset` that represents an offset

This project uses sinatra to create a simple rest api wich can be used to interact with the broker.

Also the project have a simple `cli` interface that can be used to interact with the broker.

# How to run the project

The project uses `docker` and `docker-compose` to run the broker and the rest api.

Build the image:
```bash
docker-compose build
```

Run the project:
```bash
docker-compose up
```

Run the tests:
```bash
docker-compose run --rm broker rspec
```
If you prefer you can run the commands from inside the container:
```bash
docker-compose run --rm broker bash
```
and then execute the commands.

