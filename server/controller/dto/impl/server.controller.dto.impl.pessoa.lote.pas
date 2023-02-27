unit server.controller.dto.impl.pessoa.lote;

interface

uses
  server.model.dao.interfaces,
  server.controller.dto.interfaces,
  server.model.entity.pessoa,
  System.Generics.Collections;
type
  TPessoaLoteDTO = class(TInterfacedObject, iPessoaLote)
  private
    FList : TObjectList<TModelPessoa>;
    FServices : iDAOPessoaLote;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iPessoaLote;
    function Services : iDAOPessoaLote;
    function JsonArrayStringToList(Value : String) : iPessoaLote;
  end;

implementation

uses
  server.model.dao.impl.factory,
  REST.JSON, system.SysUtils, System.JSON;

{ TPessoaLoteDTO }

constructor TPessoaLoteDTO.Create;
begin
  FList :=TObjectList<TModelPessoa>.Create;
  FServices := TDAOFactory.New.PessoaLote(FList);
end;

destructor TPessoaLoteDTO.Destroy;
begin
  FList.Free;
  inherited;
end;

function TPessoaLoteDTO.JsonArrayStringToList(Value: String): iPessoaLote;
var
  LJSONArray : TJSONArray;
  I: Integer;
  LPessoa : TModelPessoa;
begin
  Result := Self;
  FList.Clear;
  LJSONArray := TJSONOBject.ParseJSONValue(Value) as TJSONArray;
  try
    for I := 0 to Pred(LJSONArray.Count) do
    begin
      LPessoa := TModelPessoa.Create;
      TJSON.JsonToObject(LPessoa, TJSONObject(LJSONArray.Items[I]));
      FList.add(LPessoa);
    end;
  finally
    LJSONArray.Free;
  end;
end;

class function TPessoaLoteDTO.New: iPessoaLote;
begin
  Result := Self.Create;
end;

function TPessoaLoteDTO.Services: iDAOPessoaLote;
begin
  Result := FServices;
end;

end.
