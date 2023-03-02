# ph-ee-engine

![Version: 1.4.2-SNAPSHOT](https://img.shields.io/badge/Version-1.4.2--SNAPSHOT-informational?style=flat-square) ![AppVersion: 1.4.2](https://img.shields.io/badge/AppVersion-1.4.2-informational?style=flat-square)

PaymentHub EE Engine

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| http://helm.elastic.co | elasticsearch | 7.16.3 |
| http://helm.elastic.co | kibana | 7.16.3 |
| https://charts.bitnami.com/bitnami | operationsmysql(mysql) | 9.4.5 |
| https://charts.konghq.com | kong | 2.13.1 |
| https://codecentric.github.io/helm-charts | keycloak | 18.1.1 |
| https://helm.camunda.io | zeebe-cluster-helm | 1.0.0 |
| https://helm.camunda.io | zeebe-operate-helm | 1.2.0 |

## Values

## Core 

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| channel.DFSPIDS | string | `""` | rhino, gorilla  |
| channel.SPRING_PROFILES_ACTIVE | string | `""` | application-bb.properties |
| channel.gsma_payee_tenant | string | `""` | gorilla |
| channel.hostname | string | `""` | DNS hostname |
| channel.image | string | `""` | Image to use for deploying pulled from AWSECR- 419830066942.dkr.ecr.ap-south-1.amazonaws.com |
| channel.imagePullPolicy | string | `"Always"` | Always enforce image force pull to avoid unexpected issues |
| channel.imageTag | string | `"v1.1.0"` | versioned latest image |
| channel.ingress.annotations | object | `{}` | nginx |
| connector_bulk.SPRING_PROFILES_ACTIVE | string | `"default"` | application-bb.properties |
| connector_bulk.aws.access_key | string | `"AKIAX32JM37TZOJ5AKFB"` | AWS Access key   |
| connector_bulk.aws.region | string | `"us-east-2"` | AWS available zone |
| connector_bulk.aws.secret_key | string | `"******************************"` | AWS Seceret key |
| connector_bulk.image | string | `""` | Image to use for deploying AWS ECR/phee-bulk-processor |
| connector_bulk.operations_app.contactpoint | string | `""` | DNS hostname |
| connector_bulk.operations_app.endpoints.batch_transaction | string | "/api/v1/batch/transactions" |  |
| connector_bulk.tenants | string | `"ibank-usa,ibank-india"` | Tenants Configuration |
| messagegateway.DATASOURCE_URL | string | `"jdbc:mysql:thin://operationsmysql:3306/messagegateway"` | database for the message gateway |
| messagegateway.MYSQL_PASSWORD | string | `"*****"` | Password |
| messagegateway.MYSQL_USERNAME | string | `"mifos"` | Username |
| messagegateway.image | string | `""` | Image to use for deploying AWS ECR/phee-message-gateway |
| messagegateway.imagePullPolicy | string | `"Always"` | Always enforce image force pull to avoid unexpected issues |
| messagegateway.imageTag | string | `"v1.0.0"` | version Tag image |
| notifications.MESSAGEGATEWAYCONFIG_HOST | string | `"message-gateway"` |  |
| notifications.NOTIFICATION_LOCAL_HOST | string | `"ph-ee-connector-notifications"` |  |
| notifications.hostname | string | `""` | DNS hostname |
| notifications.image | string | `""` | Image to use for deploying AWS ECR/ph-ee-notifications |
| notifications.imageTag | string | `"v1.0.1"` |  |
| notifications.zeebe_broker_contactpoint | string | `"zeebe-zeebe-gateway:26500"` |  |
| operations_app.datasource.host | string | `"operationsmysql"` | database for the Operations |
| operations_app.datasource.password | string | `"****"` | password |
| operations_app.datasource.schema | string | `"tenants"` | DB tenants |
| operations_app.datasource.username | string | `"mifos"` | Username |
| operations_app.imageTag | string | `"v1.1.0"` |  |
| operations_app.token_client_channel_secret | string | `""` |  |
| operations_web.ingress.annotations."konghq.com/plugins" | string | `"request-transformer,oidc"` | kong OIDC |
| operations_web.ingress.annotations."kubernetes.io/ingress.class" | string | `"kong"` | Kong ingress |
| ph_ee_connector_ams_mifos.SPRING_PROFILES_ACTIVE | string | `""` |  |
| ph_ee_connector_ams_mifos.ams_local_account_host | string | `""` | account are the ams apis like fineract, used in ams-mifos for account with ams |
| ph_ee_connector_ams_mifos.ams_local_auth_host | string | `""` | auth are the ams apis like fineract, used in ams-mifos for authentication with ams |
| ph_ee_connector_ams_mifos.ams_local_customer_host | string | `""` |  |
| ph_ee_connector_ams_mifos.ams_local_interop_host | string | `""` | Interop are the ams apis like fineract, used in ams-mifos for interacting with ams |
| ph_ee_connector_gsma.SPRING_PROFILES_ACTIVE | string | `""` | application-bb.properties |
| ph_ee_connector_gsma.deployment.annotations | object | `{}` |  |
| importer_es.elasticsearch_security_enabled | bool | `false` |  |
| importer_es.elasticsearch_sslverification | bool | `false` |  |
| importer_es.imagePullPolicy | string | `"Always"` |  |
| importer_es.imageTag | string | `"v1.2.1"` |  |
| importer_es.importer_elasticsearch_url | string | `"http://ph-ee-elasticsearch:9200/"` |  |
| importer_es.logging.pattern.console | string | `"%d{dd-MM-yyyy HH:mm:ss.SSS} %magenta([%thread]) %highlight(%-5level) %logger.%M - %msg%n"` |  |
| importer_rdbms.LOGGING_LEVEL_ROOT | string | `"INFO"` |  |
| importer_rdbms.LOGGING_PATTERN_CONSOLE | string | `"%d{dd-MM-yyyy HH:mm:ss.SSS} %magenta([%thread]) %highlight(%-5level) %logger.%M - %msg%n"` |  |
| importer_rdbms.datasource.host | string | `"operationsmysql"` |  |
| importer_rdbms.datasource.password | string | `"password"` |  |
| importer_rdbms.datasource.username | string | `"mifos"` |  |

## Solution

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| mpesa.accounts.default.api_host | string | `"https://sandbox.safaricom.co.ke"` |  |
| mpesa.accounts.default.auth_host | string | `"https://sandbox.safaricom.co.ke/oauth/v1/generate"` |  |
| mpesa.accounts.default.business_short_code | string | `"7385028"` |  |
| mpesa.accounts.default.client_key | string | `"0pLxbN83FrOl5Nd0Fh9Zi5BQlMxSL2n5"` |  |
| mpesa.accounts.default.client_secret | string | `"YzuGNoJxeub8ZC6d"` |  |
| mpesa.accounts.default.pass_key | string | `"bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919"` |  |
| mpesa.accounts.default.till | string | `"1234567"` |  |
| mpesa.accounts.paygops.business_short_code | string | `"174379"` |  |
| mpesa.accounts.paygops.pass_key | string | `"bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919"` |  |
| mpesa.accounts.paygops.till | string | `"9347335"` |  |
| paygops_connector.paygops.authheader | string | `""` |  |
| ph_ee_connector_slcb.auth_host | string | `"https://g2p-test.slcb.com:8443"` |  |
| ph_ee_connector_slcb.aws.access_key | string | `"access-key"` | acess-key |
| ph_ee_connector_slcb.aws.secret_key | string | `"secret-key"` | Secret-key |
| ph_ee_connector_slcb.config.date_format | string | `"yyyy-MM-dd'T'hh:mm:ssXXX"` | date format configuration |
| ph_ee_connector_slcb.endpoint.account_balance | string | `"/accountBalance"` |  |
| ph_ee_connector_slcb.endpoint.reconciliation | string | `"/reconciliation"` | reconciliation |
| ph_ee_connector_slcb.endpoint.transaction_request | string | `"/api/transactionRequest"` |  |


## Dependencies 

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| zeebe-cluster-helm.elasticsearch.fullnameOverride | string | `"zeebe-elasticsearch"` |  |
| zeebe-cluster-helm.env[0].name | string | `"ZEEBE_BROKER_EXECUTION_METRICS_EXPORTER_ENABLED"` |  |
| zeebe-cluster-helm.env[0].value | string | `"true"` |  |
| zeebe-cluster-helm.env[10].name | string | `"ZEEBE_BROKER_EXPORTERS_KAFKA_ARGS_INDEX_PROCESSINSTANCE"` |  |
| zeebe-cluster-helm.env[11].name | string | `"ZEEBE_BROKER_EXPORTERS_KAFKA_ARGS_INDEX_PROCESS"` |  |
| zeebe-cluster-helm.env[12].name | string | `"ZEEBE_BROKER_EXPORTERS_KAFKA_ARGS_INDEX_INCIDENT"` |  |
| zeebe-cluster-helm.env[13].name | string | `"ZEEBE_BROKER_EXPORTERS_KAFKA_ARGS_INDEX_DEPLOYMENT"` |  |
| zeebe-cluster-helm.env[14].name | string | `"ZEEBE_BROKER_EXPORTERS_KAFKA_ARGS_INDEX_ERROR"` |  |
| zeebe-cluster-helm.env[15].name | string | `"ZEEBE_BROKER_EXPORTERS_KAFKA_ARGS_INDEX_JOB"` |  |
| zeebe-cluster-helm.env[18].name | string | `"ZEEBE_BROKER_EXPORTERS_KAFKA_ARGS_INDEX_CREATETEMPLATE"` |  |
| zeebe-cluster-helm.env[1].name | string | `"ZEEBE_BROKER_EXPORTERS_ELASTICSEARCH_CLASSNAME"` |  |
| zeebe-cluster-helm.env[1].value | string | `"hu.dpc.rt.kafkastreamer.exporter.NoOpExporter"` |  |
| zeebe-cluster-helm.env[2].name | string | `"ZEEBE_BROKER_EXPORTERS_ELASTICSEARCH_JARPATH"` |  |
| zeebe-cluster-helm.env[2].value | string | `"/exporters/ph-ee-kafka-exporter.jar"` |  |
| zeebe-cluster-helm.env[3].name | string | `"ZEEBE_BROKER_EXPORTERS_KAFKA_JARPATH"` |  |
| zeebe-cluster-helm.env[3].value | string | `"/exporters/ph-ee-kafka-exporter.jar"` |  |
| zeebe-cluster-helm.env[4].name | string | `"ZEEBE_BROKER_EXPORTERS_KAFKA_CLASSNAME"` |  |
| zeebe-cluster-helm.env[4].value | string | `"hu.dpc.rt.kafkastreamer.exporter.KafkaExporter"` |  |
| zeebe-cluster-helm.env[5].name | string | `"ZEEBE_BROKER_BACKPRESSURE_VEGAS_INITIALLIMIT"` |  |
| zeebe-cluster-helm.env[6].name | string | `"ZEEBE_BROKER_BACKPRESSURE_VEGAS_ALPHA"` |  |
| zeebe-cluster-helm.env[7].name | string | `"ZEEBE_BROKER_BACKPRESSURE_VEGAS_BETA"` |  |
| zeebe-cluster-helm.env[8].name | string | `"ZEEBE_BROKER_EXPORTERS_KAFKA_ARGS_INDEX_EVENT"` |  |
| zeebe-cluster-helm.env[9].name | string | `"ZEEBE_BROKER_EXPORTERS_KAFKA_ARGS_INDEX_VARIABLE"` |  |
| zeebe-cluster-helm.env[9].value | string | `"true"` |  |
| zeebe-cluster-helm.extraInitContainers | string | `"- name: init-ph-ee-kafka-exporter\n  image: busybox:1.28\n  command: ['/bin/sh', '-c']\n  args: ['wget -O /exporters/ph-ee-kafka-exporter.jar \"https://fynarfin.io/images/exporter-1.1.0-SNAPSHOT.jar\"; ls -al /exporters/']\n  volumeMounts:\n  - name: exporters\n    mountPath: /exporters/\n"` |  |
| zeebe-cluster-helm.gateway.env[0].name | string | `"ZEEBE_GATEWAY_THREADS_MANAGEMENTTHREADS"` |  |
| zeebe-cluster-helm.gateway.env[1].name | string | `"ZEEBE_GATEWAY_MONITORING_ENABLED"` |  |
| zeebe-cluster-helm.image.repository | string | `"camunda/zeebe"` |  |
| zeebe-cluster-helm.kibana.elasticsearchHosts | string | `"http://zeebe-elasticsearch:9200/"` |  |
| kafka.advertised.host | string | `"kafka"` |  |
| kafka.advertised.port | string | `"9092"` |  |
| kafka.deployment.annotations.deployTime | string | `"{{ .Values.deployTime }}"` |  |
| elasticsearch.clusterName | string | `"ph-ee-elasticsearch"` |  |
| elasticsearch.esConfig."elasticsearch.yml" | string | `"xpack.security.enabled: false\nxpack.security.transport.ssl.enabled: false\nxpack.security.transport.ssl.verification_mode: certificate\nxpack.security.transport.ssl.keystore.path: /usr/share/elasticsearch/config/certs/elastic-certificates.p12\nxpack.security.transport.ssl.truststore.path: /usr/share/elasticsearch/config/certs/elastic-certificates.p12\nxpack.security.http.ssl.enabled: false\nxpack.security.http.ssl.truststore.path: /usr/share/elasticsearch/config/certs/elastic-certificates.p12\nxpack.security.http.ssl.keystore.path: /usr/share/elasticsearch/config/certs/elastic-certificates.p12\n"` |  |
| elasticsearch.extraEnvs[0].valueFrom.secretKeyRef.key | string | `"******"` | password |
| elasticsearch.extraEnvs[0].valueFrom.secretKeyRef.name | string | `"elastic-credentials"` | auth Credentials |
| elasticsearch.secretMounts[0].name | string | `"elastic-certificates"` | https://docs.google.com/document/d/1Pk4fHdAONAwZ9j65YuI8qA8MgDmv_oMnlvqNUQGsMTA/edit#  |
| kibana.extraEnvs[2].valueFrom.secretKeyRef.name | string | `"kibana"` | kibana secret |
| kibana.kibanaConfig."kibana.yml" | string | `"monitoring.enabled: false\nxpack.encryptedSavedObjects.encryptionKey: 5f4dcc3b5aa765d61d8327deb882cf99\nserver.ssl:\n  enabled: false\n  key: /usr/share/kibana/config/certs/elastic-certificate.pem\n  certificate: /usr/share/kibana/config/certs/elastic-certificate.pem\nxpack.security.encryptionKey: ${KIBANA_ENCRYPTION_KEY}\nelasticsearch.ssl:\n  certificateAuthorities: /usr/share/kibana/config/certs/elastic-certificate.pem\n  verificationMode: certificate\n"` | xpack security for Elasticsearch |
| kibana.secretMounts[0].name | string | `"elastic-certificate-pem"` | https://docs.google.com/document/d/1Pk4fHdAONAwZ9j65YuI8qA8MgDmv_oMnlvqNUQGsMTA/edit# |
| kibana.secretMounts[0].secretName | string | `"elastic-certificate-pem"` | https://docs.google.com/document/d/1Pk4fHdAONAwZ9j65YuI8qA8MgDmv_oMnlvqNUQGsMTA/edit# |
| keycloak.extraEnv | string | `"- name: KEYCLOAK_IMPORT\n  value: /realm/kong-keycloak-realm.json\n"` |  |
| keycloak.extraVolumeMounts | string | `"- name: realm-secret\n  mountPath: \"/realm/\"\n  readOnly: true\n"` |  |
| keycloak.extraVolumes | string | `"- name: realm-secret\n  secret:\n    secretName: realm-secret\n"` | https://docs.google.com/document/d/1SC5vM5YEYpCEqyrhxgsWfnzISuBuzi40fH00mggbCgY/edit#heading=h.4o1zohqpauvf |
| keycloak.ingress.ingressClassName | string | `"kong"` | Defined ingress Class name  |
| keycloak.ingress.rules[0].host | string | `"keycloak.mifos.io"` |  |
| keycloak.ingress.tls | list | `[]` |  |
| kong.admin.ingress.hostname | string | `"kong-admin.mifos.io"` |  |
| kong.extraObjects[0].metadata.name | string | `"request-transformer"` |  |
| kong.extraObjects[1].metadata.name | string | `"cors"` | Cross-Origin Resource Sharing |
| kong.extraObjects[2].config.client_id | string | `"kong-oidc"` | OpenID Connect- https://docs.google.com/document/d/1SC5vM5YEYpCEqyrhxgsWfnzISuBuzi40fH00mggbCgY/edit#heading=h.4o1zohqpauvf |
| kong.extraObjects[2].config.client_secret | string | `"xxxxxxxx"` | client secret- Secret generated from Kong-OIDC client |
| kong.extraObjects[2].config.discovery | string | `"https://keycloak.localhost/auth/realms/kong-oidc/.well-known/openid-configuration"` |  |
| operationsmysql.auth.database | string | `"tenants"` | databse name |
| operationsmysql.auth.password | string | `"*****"` | password |
| operationsmysql.auth.rootPassword | string | `"*******"` | Root Password |
| operationsmysql.auth.username | string | `"mifos"` | usename |
| operationsmysql.initdbScripts."setup.sql" | string | `"CREATE DATABASE IF NOT EXISTS phdefault;\nCREATE DATABASE IF NOT EXISTS messagegateway;\nGRANT ALL ON *.* TO 'root'@'%';\nGRANT ALL PRIVILEGES ON messagegateway.* TO 'mifos';\nGRANT ALL PRIVILEGES ON phdefault.* TO 'mifos';"` | Db Creation |

