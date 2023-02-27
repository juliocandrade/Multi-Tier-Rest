unit server.controller.dto.impl.pessoa;

interface

uses
  server.controller.dto.interfaces,
  server.model.dao.interfaces,
  server.model.entity.pessoa,
  System.JSON;
type
  TPessoaDTO = class(TInterfacedObject, iPessoa)
  private
    FEntity : TModelPessoa;
    FServices : iDAOPessoa;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iPessoa;
    function Services : iDAOPessoa;
    function JsonStringToObject(Value : String) : iPessoa;
  end;
implementation

uses
  server.model.dao.impl.factory,
  REST.Json;

{ TPessoaDTO }

constructor TPessoaDTO.Create;
begin
  FEntity := TModelPessoa.Create;
  FServices := TDAOFactory.New.Pessoa(FEntity);
end;

destructor TPessoaDTO.Destroy;
begin
  FEntity.Free;
  inherited;
end;

function TPessoaDTO.JsonStringToObject(Value : String): iPessoa;
var
  LJSONPessoa : TJSONObject;
begin
  Result := Self;
  LJSONPessoa := TJSONObject.ParseJSONValue(Value) as TJSONObject;
  try
    TJSON.JsonToObject(FEntity, LJSONPessoa);
  finally
    LJSONPessoa.Free;
  end;
end;

class function TPessoaDTO.New: iPessoa;
begin
  Result := Self.Create;
end;

function TPessoaDTO.Services: iDAOPessoa;
begin
  Result := FServices;
end;

end.
