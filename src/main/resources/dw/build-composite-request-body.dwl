%dw 2.0
output application/json
---
{
  allOrNone: false,
  compositeRequest: [
    {
      method: 'POST',
      url: '/services/data/' ++ p('salesforce.apiVersion') ++ '/sobjects/ContentDocumentLink',
      referenceId: 'refContentDocumentLink',
      body: {
        ContentDocumentId: vars.newContentDocumentId,
        LinkedEntityId: p('salesforce.knowledgeArticleId'),
        ShareType: 'V',
        Visibility: 'AllUsers'
      }
    },
    {
      method: 'POST',
      url: '/services/data/' ++ p('salesforce.apiVersion') ++ '/sobjects/ContentWorkspaceDoc',
      referenceId: 'refContentWorkspaceDoc',
      body: {
        ContentDocumentId: vars.newContentDocumentId,
        ContentWorkspaceId: p('salesforce.contentWorkspaceId')
      }
    }
  ]
}