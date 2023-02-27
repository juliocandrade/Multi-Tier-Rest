unit server.model.service.cep.impl.viacep;

interface
uses
  System.SysUtils,
  server.model.service.cep.interfaces,
  server.model.entity.consultacep;

type
  TServiceCEPViaCEP = class(TInterfacedObject, iServiceCEP)
    private
      FCode : String;
      FResult : String;
      procedure ConverterRetorno(var aValue : TModelConsultaCEP);
    public
      class function New : iServiceCEP;
      function Code(aValue : String) : iServiceCEP;
      function Execute : iServiceCEP; overload;
      function Execute(var aValue : TModelConsultaCEP) : iServiceCEP; overload;
      function Return : String;
  end;
implementation

uses
  server.model.service.rest.interfaces,
  server.model.service.impl.factory,
  System.JSON,
  REST.Json;

{ TServiceCEPViaCEP }

function TServiceCEPViaCEP.Code(aValue: String): iServiceCEP;
begin
  Result := Self;
  FCode := aValue;
end;

procedure TServiceCEPViaCEP.ConverterRetorno(var aValue: TModelConsultaCEP);
begin
    aValue := TJSON.JsonToObject<TModelConsultaCEP>(FResult);
end;

function TServiceCEPViaCEP.Execute(var aValue: TModelConsultaCEP): iServiceCEP;
begin
  Result := Self;
  Execute;
  ConverterRetorno(aValue);
end;

function TServiceCEPViaCEP.Execute: iServiceCEP;
var
  LRestClient : iRest;
begin
  Result := Self;
  if FCode.IsEmpty then
    exit;
  LRestClient := TServiceFactory.New.Rest;
  LRestClient
    .Params
      .BaseURL('https://viacep.com.br')
      .EndPoint(Format('ws/%s/json', [FCode]))
    .&End
    .Get;
    FResult := LRestClient.Content;
end;

class function TServiceCEPViaCEP.New: iServiceCEP;
begin
  Result := Self.Create;
end;

function TServiceCEPViaCEP.Return: String;
begin
  Result := FCode;
end;

end.
