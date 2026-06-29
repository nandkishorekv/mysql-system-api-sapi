%dw 2.0
output application/json
---
{
  batchId: vars.correlationId default '',
  files: (vars.originalFiles default []) map (f) -> {
    fileName: f.fileName,
    fileSize: f.fileSize,
    lastModifiedDateTime: f.lastModifiedDateTime,
    mimeType: f.mimeType,
    fileExtension: f.fileExtension
  },
  errorType: 'SALESFORCE_UPLOAD_FAILURE',
  errorMessage: 'All files in batch failed after retries',
  errorCode: '500',
  errors: vars.fileErrors default [],
  timestamp: now() as String {format: "yyyy-MM-dd'T'HH:mm:ss'Z'"},
  flowName: 'post-files-upload-batch-flow',
  correlationId: vars.correlationId default '',
  apiName: 'salesforce-system-api'
}