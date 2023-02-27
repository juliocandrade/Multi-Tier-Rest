unit server.model.service.provider.impl.action;

interface
uses
  server.model.service.provider.impl.response,
  server.model.service.provider.impl.request;
type
   TProviderActionRequestResponse = procedure(AReq: TProviderRequest; ARes: TProviderResponse);

implementation

end.
