%dw 2.0
output application/json
---
do {
  var sfStatus = vars.salesforceHealthStatus default 'DOWN'
  var awsStatus = vars.awsHealthStatus default 'DOWN'
  var overallStatus = if (sfStatus == 'UP' and awsStatus == 'UP') 'UP' else 'DOWN'
  ---
  {
    status: overallStatus,
    timestamp: now() as String {format: "yyyy-MM-dd'T'HH:mm:ss'Z'"},
    checks: [
      { name: 'salesforce', status: sfStatus },
      { name: 'awsSecretsManager', status: awsStatus }
    ]
  }
}