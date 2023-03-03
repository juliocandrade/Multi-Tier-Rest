unit client.model.dao.factory;

interface

uses
  client.model.dao.Interfaces,
  client.model.entity.pessoa,
  System.Generics.Collections;
type
  TDAOFactory = class(TInterfacedObject, iDAOFactory)
  private
  public
    class function New : iDAOFactory;
    function Pessoa : IDAOPessoa;
    function PessoaLote(aList : TObjectDictionary<integer, TModelPessoa>) :IDAOPessoaLote;
  end;
implementation

uses
  client.model.dao.pessoa,
  client.model.dao.pessoa.lote;

{ TDAOFactory }

class function TDAOFactory.New : iDAOFactory;
begin
  Result := Self.Create;
end;

function TDAOFactory.Pessoa : IDAOPessoa;
begin
  Result := TDAOPessoa.New;
end;

function TDAOFactory.PessoaLote(
  aList: TObjectDictionary<integer, TModelPessoa>): IDAOPessoaLote;
begin
  Result := TDAOPessoaLote.New(aList);
end;

end.
