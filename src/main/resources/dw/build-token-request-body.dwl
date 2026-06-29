%dw 2.0
output application/x-www-form-urlencoded
---
{
  grant_type: 'client_credentials',
  client_id: p('secure::salesforce.clientId'),
  client_secret: p('secure::salesforce.clientSecret')
}