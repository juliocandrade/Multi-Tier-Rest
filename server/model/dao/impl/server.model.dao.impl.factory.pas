unit server.model.dao.impl.factory;

interface

uses
  server.model.dao.interfaces,
  server.model.entity.pessoa,
  System.Generics.Collections,
  server.model.entity.endereco,
  server.model.entity.endereco.integracao;
type
  TDAOFactory = class (TInterfacedObject, iDAOFactory)
  private
  public
    class function New : iDAOFactory;
    function Pessoa(aPessoa : TModelPessoa) : iDAOPessoa;
    function PessoaLote(aList : TObjectList<TModelPessoa>) : iDAOPessoaLote;
    function Endereco(aEndereco : TModelEndereco) : iDAOEndereco;
    function EnderecoIntegracao(aEnderecoIntegracao : TModelEnderecoIntegracao) : iDAOEnderecoIntegracao;
  end;
implementation

uses
  server.model.dao.impl.endereco,
  server.model.dao.impl.endereco.integracao,
  server.model.dao.impl.pessoa,
  server.model.dao.impl.pessoa.lote;

{ TDAOFactory }

function TDAOFactory.Endereco(aEndereco : TModelEndereco) : iDAOEndereco;
begin
  Result := TDAOEndereco.New(aEndereco)
end;

function TDAOFactory.EnderecoIntegracao(aEnderecoIntegracao : TModelEnderecoIntegracao) : iDAOEnderecoIntegracao;
begin
  Result := TDAOEnderecoIntegracao.New(aEnderecoIntegracao);
end;

class function TDAOFactory.New: iDAOFactory;
begin
  Result := Self.Create;
end;

function TDAOFactory.Pessoa(aPessoa : TModelPessoa) : iDAOPessoa;
begin
  Result := TDAOPessoa.New(aPessoa);
end;

function TDAOFactory.PessoaLote(aList : TObjectList<TModelPessoa>) : iDAOPessoaLote;
begin
  Result := TDAOPessoaLote.New(aList);
end;

end.
