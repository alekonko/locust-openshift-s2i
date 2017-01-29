FROM openshift/base-centos7

MAINTAINER Dennis Stritzke <dennis@stritzke.me>

# TODO: Rename the builder environment variable to inform users about application you provide them
# ENV BUILDER_VERSION 1.0

LABEL io.k8s.description="S2I for building Locust load testing server" \
      io.k8s.display-name="Locust" \
      io.openshift.expose-services="8090:http" \
      io.openshift.tags="builder,locust"

RUN yum install epel-release -y && \
    yum install python-pip python-devel -y && \
    yum clean all -y && \
    pip install locustio zmq

COPY ./.s2i/bin/ /usr/libexec/s2i

RUN chown -R 1001:1001 /opt/app-root

# This default user is created in the openshift/base-centos7 image
USER 1001

EXPOSE 8090

CMD ["usage"]
