# ph-ee-gazelle

Umbrella Helm chart for [mifos-gazelle](https://github.com/openMF/mifos-gazelle) deployments of Payment Hub EE (PHEE) v1.13.0.

**Do not deploy this chart directly** — it is installed and configured by `mifos-gazelle`'s `run.sh` tooling.

## What this chart deploys

| Component | Source |
|-----------|--------|
| Payment Hub EE engine (all microservices) | `ph-ee-engine` subchart |
| Identity Account Mapper | `account_mapper` subchart |
| Tenant ConfigMap (`ph-ee-config`) | `config/` property files |

## Dependencies

| Name | Version | Purpose |
|------|---------|---------|
| `ph-ee-engine` | 1.13.0-gazelle | All PHEE microservices + infrastructure |
| `account_mapper` | 1.0.0 | GovStack identity/account lookup |
| `common` | 1.13.0-gazelle | Shared Helm helpers |

## Tenant configuration

Default tenants configured in `values.yaml`:

| Tenant | Role |
|--------|------|
| `greenbank` | Primary payer (Mojaloop routing) |
| `bluebank` | Secondary / payee FSP |
| `redbank` | Closedloop payer (set in ph-ee-engine values) |

The `config/` directory holds Spring Boot `.properties` files that are bundled into the `ph-ee-config` ConfigMap at deploy time:

```
config/
  application-tenants.properties          # tenant workflow mappings
  application-tenantsConnection.properties # Fineract DB connections per tenant
  application-bb.properties               # payment mode / connector config
  application-fin12.properties            # AMS Mifos connector settings
```

## Deploying via mifos-gazelle

```bash
# Full deployment (recommended)
sudo ./run.sh

# Deploy PHEE only
sudo ./run.sh --phee
```

See the [mifos-gazelle docs](../../docs/MIFOS-GAZELLE-README.md) for prerequisites and full deployment guide.

## Local development (hostPath mounts)

When running with hostPath mounts, changes to Spring Boot application YAML files require a JAR rebuild and pod restart — ConfigMap changes alone have no effect. See [DEV-TEST-TIPS.md](../../docs/DEV-TEST-TIPS.md).
