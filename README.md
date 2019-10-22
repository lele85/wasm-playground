# WASM Playground

## Setup

Spin up the container and keep it running:

    docker-compose up

Enter the container:

    docker-compose exec dev sh

Build the native module:

    ./build.sh

Run the dev server:

    caddy

Try the app:

    http://localhost:10001