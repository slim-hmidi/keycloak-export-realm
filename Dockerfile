FROM jboss/keycloak:3.4.3.Final

ARG KEYCLOAK_ADMIN_USER=admin
ARG KEYCLOAK_ADMIN_PASWORD=password

RUN /opt/jboss/keycloak/bin/add-user.sh -u ${KEYCLOAK_ADMIN_USER} -p ${KEYCLOAK_ADMIN_PASWORD}
COPY export_configurations.txt /opt/jboss/export_configurations.txt
RUN /opt/jboss/keycloak/bin/jboss-cli.sh --file=export_configurations.txt \
    && rm -rf /opt/jboss/keycloak/standalone/configuration/standalone_xml_history
ENTRYPOINT [ "/opt/jboss/docker-entrypoint.sh" ]
