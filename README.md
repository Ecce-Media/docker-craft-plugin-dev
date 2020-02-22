# Prebuilt CraftCMS With Local Repository

Scripts to build docker containers that contains a CraftCMS 3 instance with a local repository
set up at `/plugin`. This allow you to mount a volume to that directory and use composer to import
a CraftCMS plugin.

This container is usually used in conjunction with [craft-plugin-bootstrap](https://github.com/Ecce-Media/craft-plugin-bootstrap)
to quickly setup and run a craft environment using docker-compose linked up with a simple
craft plugin.

##Deploy latest version

build tag with `latest` and push to docker hub

    make build

##Deploy a specific version

build tag with version and push to docker hub

    make build VERSION=x.x.x
        