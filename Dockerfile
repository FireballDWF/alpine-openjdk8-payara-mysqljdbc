FROM fireballdwf/alpine-openjdk8-payara

# Maintainer
# ----------
MAINTAINER David Filiatrault <david.filiatrault+github@gmail.com>

ENV APPDOMAIN payaradomain 
ENV ASCMD './asadmin --interactive=false --user admin --passwordfile pwdfile'

ENV MYSQL_JDBC_PACKAGE mysql-connector-java-5.1.38
RUN wget -O - http://dev.mysql.com/get/Downloads/Connector-J/$MYSQL_JDBC_PACKAGE.tar.gz  | \
    tar -C /tmp -xvzf - $MYSQL_JDBC_PACKAGE/$MYSQL_JDBC_PACKAGE-bin.jar && \
    mv /tmp/$MYSQL_JDBC_PACKAGE/$MYSQL_JDBC_PACKAGE-bin.jar $GLASSFISH_INSTALL_DIR/domains/$APPDOMAIN/lib
