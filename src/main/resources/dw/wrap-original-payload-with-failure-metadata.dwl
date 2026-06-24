%dw 2.0
output application/json
---
{
  originalPayload: payload,
  failureType: (error.errorType.identifier default 'UNKNOWN'),
  failureDescription: (error.description default ''),
  correlationId: (vars.correlationId default ''),
  failedAt: now()
}