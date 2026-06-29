%dw 2.0
output application/json
---
{
  errorType: "VALIDATION:REJECTED",
  message: ((error.description default "Internal error") as String),
  detail: (error.detailedDescription default error.cause default "")
}