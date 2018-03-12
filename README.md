# keycloak-export-realm
Export the realm and users files contained in keycloak's database at the server's startup.

To export the files, use `jboss-cli` to add system-properties to the `standalone.xml` without launching the server using `embed-server`:
```
./jboss-cli
# Specify the name of the configuration file using the  'server-config' parameter.
[disconnected /] embed-server --server-config=standalone.xml 
# Add export as a value for the action
[standalone@embedded /] /system-property=keycloak.migration.action/:add(value=export) 
# We choose the export to a directory in this case
[standalone@embedded /]/system-property=keycloak.migration.provider/:add(value=dir)
# Name the directory in which the files will be exported (we choose 'keycloak_export_dir' as a directory's name.
[standalone@embedded /]/system-property=keycloak.migration.dir/:add(value=keycloak_export_dir)

```
After building the image using the `Dockerfile` and runing the container, you will found a directory called `keycloak_export_dir` under `/opt/jboss/keycloak` and contains the realm files.
