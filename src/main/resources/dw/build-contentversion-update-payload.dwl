%dw 2.0
output application/json
---
{
  VersionData: vars.currentFile.fileContent,
  PathOnClient: vars.currentFile.fileName,
  Title: (vars.currentFile.fileName splitBy '.')[0] default vars.currentFile.fileName,
  ContentDocumentId: vars.existingContentDocumentId
}