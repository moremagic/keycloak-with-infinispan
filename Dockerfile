FROM jboss/keycloak:16.1.1

ADD conf/standalone-ha.xml /opt/jboss/keycloak/standalone/configuration/standalone-ha.xml
ADD cli/setup.cli /opt/jboss/keycloak/cli/setup.cli
RUN cd /opt/jboss/keycloak && bin/jboss-cli.sh --file=cli/setup.cli
RUN rm -rf /opt/jboss/keycloak/standalone/configuration/standalone_xml_history

EXPOSE 8080 8443 9990 7600 57600 45700

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]
CMD ["-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
