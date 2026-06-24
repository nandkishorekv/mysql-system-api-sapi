%dw 2.0
output application/json
---
{
  correlationId: vars.correlationId,
  batchId: vars.batchId,
  filesSent: vars.filesSent,
  filesUploaded: vars.filesUploaded,
  filesUpserted: vars.filesUpserted,
  filesUploadedToKnowledge: vars.filesUploadedToKnowledge,
  uploadedFiles: vars.uploadedFiles,
  upsertedFiles: vars.upsertedFiles,
  failedFiles: vars.failedFiles,
  processingTimestamp: now() as String,
  errors: vars.errors
}