unit client.model.dao.impl.pessoa;

interface

uses
  client.model.dao.Interfaces,
  client.model.entity.pessoa;
type
  TDAOPessoa = class(TInterfacedObject, iDAOPessoa)
  private
    FParent : TModelPessoa;
    function ObjectToJSONString : string;
  public
    constructor Create(aParent : TModelPessoa);
    class function New(aParent : TModelPessoa) : iDAOPessoa;
    function Inserir : iDAOPessoa;
    function Excluir : iDaoPessoa;
    function Alterar : iDaoPessoa;
    function This : TModelPessoa;
  end;
implementation

uses
  client.model.service.rest.interfaces,
  client.model.services.impl.factory,
  System.SysUtils,
  REST.JSON;

{ TDAOPessoa }

function TDAOPessoa.Alterar: iDaoPessoa;
var
  LRestClient : iRest;
begin
  LRestClient := TServiceFactory.New.Rest;
  LRestClient
    .Params
      .EndPoint(Format('pessoas/%d', [FParent.ID]))
      .Body(ObjectToJSONString)
    .&End
  .Put;
end;

constructor TDAOPessoa.Create(aParent: TModelPessoa);
begin
  FParent := aParent;
end;

function TDAOPessoa.Excluir: iDaoPessoa;
var
  LRestClient : iRest;
begin
  LRestClient := TServiceFactory.New.Rest;
  LRestClient
    .Params
      .EndPoint(Format('pessoas/%d', [FParent.ID]))
    .&End
  .Delete;
end;

function TDAOPessoa.Inserir: iDAOPessoa;
var
  LRestClient : iRest;
begin
  LRestClient := TServiceFactory.New.Rest;
  LRestClient
    .Params
      .EndPoint('pessoas')
      .Body(ObjectToJSONString)
    .&End
  .Post;
end;

class function TDAOPessoa.New(aParent: TModelPessoa): iDAOPessoa;
begin
  Result := Self.Create(aParent);
end;

function TDAOPessoa.ObjectToJSONString: string;
begin
  Result := TJSON.ObjectToJsonString(FParent, [joIndentCaseLower]);
end;

function TDAOPessoa.This: TModelPessoa;
begin
  Result := FParent;
end;

end.
