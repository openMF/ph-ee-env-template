# ph-ee-engine

Helm umbrella chart for Payment Hub EE (PHEE) v1.13.0 microservices and infrastructure. Used as a dependency of the [`gazelle`](../gazelle/) chart; not intended for standalone deployment in mifos-gazelle.

## Subcharts

All subcharts are condition-gated via `<name>.enabled` in values.

### PHEE microservices

| Chart key | Service | Purpose |
|-----------|---------|---------|
| `channel` | connector-channel | Payment initiation API gateway |
| `bulk_processor` | ph-ee-bulk-processor | Batch de-bulking and orchestration |
| `connector_bulk` | connector-bulk | Bulk transfer worker |
| `ph_ee_connector_mojaloop` | connector-mojaloop | Mojaloop switch integration |
| `connector_ams_mifos` | connector-ams-mifos | Apache Fineract (MifosX) AMS adapter |
| `ph_ee_connector_gsma` | connector-gsma | GSMA mobile money connector |
| `mockpayment` | connector-mock-payment-schema | Mock payment connector (dev/test) |
| `operations_app` | operations-app | Batch/transfer status API |
| `operations_web` | operations-web | Operations dashboard UI |
| `importer_rdbms` | operations-importer-rdbms | Zeebe → MySQL event importer |
| `importer_es` | operations-importer-es | Zeebe → Elasticsearch event importer |
| `zeebe_ops` | zeebe-ops | Zeebe management utilities |
| `notifications` | connector-notifications | SMS/notification gateway |
| `messagegateway` | message-gateway | Message routing |
| `vouchers` | vouchers | Voucher management |
| `billPay` | connector-bill-pay | Bill payment connector |

### Infrastructure

| Chart key | Chart | Version | Purpose |
|-----------|-------|---------|---------|
| `camunda-platform` | camunda-platform | 8.2.12 | Zeebe workflow engine + Operate UI |
| `operationsmysql` | mysql (bitnami) | 9.4.5 | Operations DB |
| `redis` | redis (bitnami) | 17.9.3 | Caching / distributed lock |
| `kafka` | kafka (bitnami) | 25.0.0 | Event streaming |
| `elasticsearch` | elasticsearch (elastic) | 7.17.3 | Event index |
| `kibana` | kibana (elastic) | 7.16.3 | Log/event UI |
| `minio` | minio | 5.0.14 | Object storage (bulk CSV files) |

## Key configuration points

### Enabling/disabling components

```yaml
# values.yaml excerpt
bulk_processor:
  enabled: true
ph_ee_connector_mojaloop:
  enabled: true
camunda-platform:
  enabled: true
```

### Tenant workflow mapping

Tenant-to-BPMN workflow mapping is set in two places (both must match):

- Bulk processor: `ph-ee-bulk-processor/src/main/resources/application.yaml` → `bpmns.tenants[]`
- Channel connector: `ph-ee-connector-channel/src/main/resources/application.yml` → `bpmns.tenants[]`

Standard workflow IDs:

| Tenant | Bulk workflow | Transfer workflow |
|--------|--------------|------------------|
| `greenbank` | `bulk_processor-greenbank` or `bulk_processor_account_lookup-greenbank` | `PayerFundTransfer-greenbank` |
| `redbank` | `bulk_processor-redbank` | `minimal_mock_fund_transfer-redbank` |
| `bluebank` | `bulk_processor-bluebank` | `minimal_mock_fund_transfer-bluebank` |

### Resource tuning

Default resource limits are sized for single-node dev (24 GB RAM). For production, override per-subchart:

```yaml
channel:
  deployment:
    resources:
      limits:
        memory: "1Gi"
        cpu: "1000m"
```

## Useful URLs (mifos-gazelle defaults)

| Service | URL |
|---------|-----|
| Operations Web | http://ops.mifos.gazelle.test |
| Zeebe Operate | http://zeebe-operate.mifos.gazelle.test (demo/demo) |

## References

- [mifos-gazelle deployment guide](../../docs/MIFOS-GAZELLE-README.md)
- [GovStack G2P architecture](../../docs/GOVSTACK.md)
- [Local dev with hostPath mounts](../../docs/DEV-TEST-TIPS.md)
