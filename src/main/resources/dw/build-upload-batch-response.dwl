%dw 2.0
output application/json
---
{
  numberOfFilesSent: vars.numberOfFilesSent default 0,
  numberOfFilesSuccessfullyUploaded: vars.numberOfFilesSuccessfullyUploaded default 0,
  numberOfFilesUpserted: vars.numberOfFilesUpserted default 0,
  numberOfFilesUploadedToKnowledge: vars.numberOfFilesUploadedToKnowledge default 0,
  filesUploadedAndUpserted: vars.filesUploadedAndUpserted default [],
  errors: vars.fileErrors default []
}