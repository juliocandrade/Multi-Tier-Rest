unit client.model.dao.pessoa.lote;

interface

uses
  client.model.dao.Interfaces,
  System.Generics.Collections,
  client.model.entity.pessoa;
type
  TDAOPessoaLote = class(TInterfacedObject, iDAOPessoaLote)
  private
    FList : TObjectDictionary<integer, TModelPessoa>;
    function ListAsJSONArray : String;
  public
    constructor Create(aList : TObjectDictionary<integer, TModelPessoa>);
    class function New(aList : TObjectDictionary<Integer, TModelPessoa>) : iDAOPessoaLote;
    function Inserir : iDAOPessoaLote;
  end;
implementation

uses
  System.JSON,
  REST.Json, client.model.resource.interfaces,
  client.model.resource.factory;

{ TDAOPessoaLote }

constructor TDAOPessoaLote.Create(aList: TObjectDictionary<Integer,TModelPessoa>);
begin
  FList := aList;
end;

function TDAOPessoaLote.Inserir: iDAOPessoaLote;
var
  LRestClient : iRest;
begin
  LRestClient := TResourceFactory.New.Rest;
  LRestClient
    .Params
      .EndPoint('pessoas/lote')
      .Body(ListAsJSONArray)
    .&End
  .Post;
end;

function TDAOPessoaLote.ListAsJSONArray: String;
var
  LJSONArray : TJSONArray;
  LJSONObject : TJSONObject;
  LObjectList : TObjectList<TModelPessoa>;
begin
  Result := '[]';
  LObjectList := TObjectList<TModelPessoa>.Create(FList.Values);
    try
    LObjectList.OwnsObjects := false;
    LObjectList.Sort;
    LJSONObject := TJson.ObjectToJsonObject(LObjectList, [joIndentCaseLower]);
    try
      LJSONArray := LJSONObject.GetValue<TJSONArray>('listhelper');
      Result := TJSON.JsonEncode(LJSONArray);
    finally
      LJSONObject.Free;
    end;
  finally
    LObjectList.Free;
  end;
end;

class function TDAOPessoaLote.New(
  aList: TObjectDictionary<Integer,TModelPessoa>): iDAOPessoaLote;
begin
  Result := Self.Create(aList);
end;

end.
