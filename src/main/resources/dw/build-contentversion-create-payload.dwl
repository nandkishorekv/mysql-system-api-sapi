%dw 2.0
output application/json
---
{
  Title: (vars.currentFile.fileName splitBy '.')[0] default vars.currentFile.fileName,
  PathOnClient: vars.currentFile.fileName,
  VersionData: vars.currentFile.fileContent
}