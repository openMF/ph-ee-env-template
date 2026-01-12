# Kibana Visualizations for Payment Hub EE

This directory contains pre-built Kibana dashboards, visualizations, and saved searches for monitoring and debugging Payment Hub EE (ph-ee) transactions.

## 📊 What's Included

### Dashboards
- **Reporting Dashboard**: High-level transaction reporting and metrics
- **Debugging Dashboard**: Detailed transaction debugging and error analysis
- **Aggregations Dashboard**: Transaction aggregation views
- **Granular Dashboard**: Detailed transaction flow analysis
- **[DevOps Only] Aggregation Long Term**: Long-term aggregation metrics

### Visualizations
- Transaction success/failure rates
- Error code analysis
- Transaction timing and performance metrics
- Payment flow visualizations

### Saved Searches
- **Transaction Errors**: Quick view of failed transactions
- **Incidents [All]**: All Zeebe incidents
- **Completed Txns**: Successfully completed transactions
- **Timed Out Txns**: Transactions that exhausted retries
- **Error Code exhaustive list**: Comprehensive error catalog

## 🚀 Quick Start: Import Visualizations

### Option 1: Bash Script (Recommended)

The simplest way to import all visualizations:

```bash
cd "/home/tdaly/mifos-gazelle/repos/ph_template/Kibana Visualisations"
./import-all.sh
```

### Option 2: Python Script

For more detailed logging and control:

```bash
cd "/home/tdaly/mifos-gazelle/repos/ph_template/Kibana Visualisations"

# Install dependencies (one-time)
pip3 install requests

# Run import
python3 import-saved-objects.py
```

### Option 3: Manual Import via Kibana UI

1. Open Kibana: https://kibana.mifos.gazelle.localhost
2. Go to **Stack Management** → **Saved Objects**
3. Click **Import**
4. Import files in this order:
   - `index-pattern/*.ndjson` (index patterns first!)
   - `search/*.ndjson`
   - `visualization/*.ndjson`
   - `lens/*.ndjson`
   - `dashboard/*.ndjson`
   - Root-level `*.ndjson` files

## 🔍 Accessing Kibana

### Web Interface

**URL**: https://kibana.mifos.gazelle.localhost

Open in your browser to access the Kibana web UI.

### Key Sections

1. **Discover**: Search and explore raw Zeebe data
   - Index pattern: `zeebe-*`
   - View individual transaction records

2. **Dashboards**: Pre-built visualization dashboards
   - Start with the "Reporting" dashboard for an overview

3. **Visualize**: Create and edit visualizations

4. **Stack Management**: Manage index patterns, saved objects, etc.

## 📖 How to Use the Dashboards

### Reporting Dashboard

**Purpose**: High-level transaction monitoring

**Key Metrics**:
- Total transactions processed
- Success vs. failure rates
- Transaction volumes over time
- Top error codes

**Use Cases**:
- Daily transaction monitoring
- SLA tracking
- Capacity planning

### Debugging Dashboard

**Purpose**: Troubleshooting failed transactions

**Key Features**:
- Transaction error details
- Failed transaction timeline
- Error code breakdown
- Incident analysis

**Use Cases**:
- Investigating specific transaction failures
- Root cause analysis
- Support ticket resolution

### Granular Dashboard

**Purpose**: Deep-dive transaction analysis

**Key Features**:
- Individual transaction flow
- BPMN workflow progress
- Zeebe variable inspection
- Timing analysis

**Use Cases**:
- Understanding transaction lifecycle
- Performance optimization
- Workflow debugging

## 🔎 Common Search Queries

### Find a Transaction by ID

In **Discover**, use:
```
clientCorrelationId: "your-transaction-id"
```
or
```
transactionId: "your-transaction-id"
```

### Find All Failed Transactions (Last 24h)

```
value.state: "FAILED" AND @timestamp >= now-24h
```

### Find Transactions with Specific Error Code

```
errorCode: "9000"
```

### Find Bulk Transaction Batches

```
batchId: "your-batch-id"
```

## 📊 Understanding Zeebe Data

### Key Fields

| Field | Description |
|-------|-------------|
| `value.bpmnProcessId` | Workflow name (e.g., `bulk_processor-greenbank`) |
| `value.state` | Transaction state (ACTIVE, COMPLETED, FAILED) |
| `transactionId` | Unique transaction identifier |
| `clientCorrelationId` | Client-provided correlation ID |
| `batchId` | Batch identifier (for bulk transactions) |
| `errorCode` | Error code if transaction failed |
| `errorDescription` | Human-readable error message |

### Transaction States

- **ACTIVE**: Transaction in progress
- **COMPLETED**: Transaction succeeded
- **FAILED**: Transaction failed (check `errorCode`)
- **INCIDENT_CREATED**: Zeebe incident occurred

## 🛠️ Troubleshooting

### Visualizations Not Loading

**Issue**: Dashboards show "No data"

**Solutions**:
1. Check Elasticsearch has data:
   ```bash
   curl -k https://kibana.mifos.gazelle.localhost/api/console/proxy?path=/_cat/indices/zeebe-*&method=GET
   ```

2. Refresh index patterns:
   - Go to **Stack Management** → **Index Patterns**
   - Select `zeebe-*`
   - Click the refresh icon

3. Check time range:
   - Dashboards filter by time
   - Use time picker (top-right) to select appropriate range

### Import Errors

**Issue**: Import script fails

**Solutions**:
1. Check Kibana is accessible:
   ```bash
   curl -k https://kibana.mifos.gazelle.localhost/api/status
   ```

2. Import index patterns first:
   ```bash
   cd "index-pattern"
   for f in *.ndjson; do
     curl -k -X POST "https://kibana.mifos.gazelle.localhost/api/saved_objects/_import?overwrite=true" \
       -H "kbn-xsrf: true" \
       -F "file=@$f"
   done
   ```

### No Transaction Data

**Issue**: Elasticsearch index is empty

**Check**:
1. Zeebe is exporting to Elasticsearch:
   ```bash
   kubectl logs -n paymenthub deployment/phee-zeebe-0 | grep -i elastic
   ```

2. Transactions are being processed:
   ```bash
   kubectl logs -n paymenthub deployment/ph-ee-bulk-processor | tail -50
   ```

## 🔧 Advanced: Custom Visualizations

### Creating Custom Searches

1. Go to **Discover**
2. Select index pattern: `zeebe-*`
3. Build your query using KQL (Kibana Query Language)
4. Click **Save** to save the search

### Creating Custom Visualizations

1. Go to **Visualize Library**
2. Click **Create visualization**
3. Choose visualization type (Bar, Line, Pie, etc.)
4. Select data source: `zeebe-*`
5. Configure metrics and aggregations
6. Save visualization

### Adding to Dashboards

1. Open or create a dashboard
2. Click **Edit**
3. Click **Add**
4. Select your saved visualization
5. Arrange and resize as needed
6. Click **Save**

## 📚 Additional Resources

### Kibana Documentation
- [Kibana Guide](https://www.elastic.co/guide/en/kibana/current/index.html)
- [KQL Query Language](https://www.elastic.co/guide/en/kibana/current/kuery-query.html)

### Payment Hub EE
- [ph-ee Documentation](https://mifos.gitbook.io/docs/)
- [Zeebe Workflow Engine](https://docs.camunda.io/docs/components/zeebe/zeebe-overview/)

## 🐛 Report Issues

If you encounter problems with these visualizations:
1. Check the logs in the import script output
2. Verify Kibana version compatibility (tested with 7.16.x)
3. Report issues with specific error messages

---

**Last Updated**: December 2025
**Kibana Version**: 7.16.x
**Compatible with**: Payment Hub EE v1.x+
