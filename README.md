# Locust.io OpenShift S2I
[Locust](https://github.com/locustio/locust) is an easy-to-use, distributed, user load testing tool. It is intended for load-testing web sites (or other systems) and figuring out how many concurrent users a system can handle.

This repository contains an OpenShift S2I to be used in development of load tests.

## Deployment
A Docker Image built from this repository is available from Docker Hub as an automated build. The Docker Image tag refers to the contained Locust version.

### Standalone Deployment
The standalone deployment is useful in the development of the Locust load test, where you do not require the distribution capabilities of Locust to generate high load scenarios.

```
oc new-app \
    dstritzke/locust-openshift-s2i~git@github.com:you/your_locust_repo.git \
    -e LOCUST_TARGET=https://myapplication.example.com
```

Create an OpenShift Route, which points to port `8089` of the created service to access the Locust UI.  

### Distributed Deployment
Yet to come...

## License
Open source licensed under the MIT license (see [LICENSE](LICENSE) file for details).