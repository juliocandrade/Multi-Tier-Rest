unit client.model.services.impl.factory;

interface

uses
  client.model.service.interfaces, client.model.service.rest.interfaces;
type
  TServiceFactory = class(TInterfacedObject, iServiceFactory)
  private
  public
    class function New : iServiceFactory;
    function Rest : iRest;
  end;
implementation

uses
  client.model.service.rest.impl.clientrest,
  client.model.principal;

{ TServiceFactory }

class function TServiceFactory.New: iServiceFactory;
begin
  Result := Self.Create;
end;

function TServiceFactory.Rest: iRest;
begin
  Result := TClientRest.New.Params.BaseURL(dmPrincipal.ServerURL).&End;
end;

end.
