unit server.model.service.impl.factory;

interface

uses
  server.model.service.interfaces,
  server.model.service.rest.interfaces,
  server.model.service.cep.interfaces,
  server.model.service.endereco.interfaces;
type
  TServiceFactory = class(TInterfacedObject, iServiceFactory)
  private
  public
    class function New : iServiceFactory;
    function Rest : iRest;
    function CEP : iServiceCEP;
    function Endereco : iServiceEndereco;
  end;
implementation

uses
  server.model.service.rest.impl.clientrest,
  server.model.service.cep.impl.viacep,
  server.model.service.endereco;

{ TServiceFactory }

function TServiceFactory.CEP: iServiceCEP;
begin
  Result := TServiceCEPViaCEP.New;
end;

function TServiceFactory.Endereco: iServiceEndereco;
begin
  Result := TServiceEndereco.New;
end;

class function TServiceFactory.New: iServiceFactory;
begin
  Result := Self.Create;
end;

function TServiceFactory.Rest: iRest;
begin
  Result := TClientRest.New;
end;

end.

