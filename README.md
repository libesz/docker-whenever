# docker-whenever
File change triggered command execution, in a container.
Changes are detected using inotify with write+close trigger.
Docker package is installed to cover common container management use-cases.

## Usage
First parameter sets the directory (in the container) to watch for changes. Second parameter is the command to be executed on any file write trigger.

Example:
```
docker run -v ~/certs:/ssl -v /var/run/docker.sock:/var/run/docker.sock  huszty/whenever /ssl 'docker exec reverse-http-proxy-nginx-1 nginx -s reload'
```

This example assumes there is an external automation to renew TLS certificates, which is mounted into an HTTP server container. When the certs are updated, the container which uses them is asked to gracefully reload the configuration.

