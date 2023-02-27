unit server.model.service.rest.impl.factory;

interface

uses
  server.model.service.rest.interfaces;
type
  TRestFactory = class(TInterfacedObject, iRestFactory)
  private
  public
    class function New : iRestFactory;
    function Rest : iRest;
  end;
implementation

uses
  server.model.service.rest.impl.clientrest;

{ TRestFactory }

class function TRestFactory.New: iRestFactory;
begin
  Result := Self.Create;
end;

function TRestFactory.Rest: iRest;
begin
  Result := TClientRest.New;
end;

end.
