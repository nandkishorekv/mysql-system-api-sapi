%dw 2.0
output application/json
---
{
  status: 'UP',
  apiName: 'salesforce-system-api',
  version: 'v1',
  timestamp: now() as String,
  uptime: 0,
  salesforceConnectivityStatus: 'UP'
}