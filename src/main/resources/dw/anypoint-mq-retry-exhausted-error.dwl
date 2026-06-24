%dw 2.0
output application/json
---
{
  errorType: "ANYPOINT-MQ:RETRY_EXHAUSTED",
  message: ((error.description default "Internal error") as String),
  detail: (error.detailedDescription default error.cause default "")
}