%dw 2.0
output application/json
---
{
  correlationId: payload.correlationId,
  batchId: payload.batchId,
  files: payload.files
}