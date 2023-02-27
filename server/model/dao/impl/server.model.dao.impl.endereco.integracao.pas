unit server.model.dao.impl.endereco.integracao;

interface
uses
  server.model.dao.interfaces,
  server.model.entity.endereco.Integracao;
type
  TDAOEnderecoIntegracao = class(TInterfacedObject, iDAOEnderecoIntegracao)
  private
    FParent : TModelEnderecoIntegracao;
  public
    constructor Create(aParent : TModelEnderecoIntegracao);
    class function New(aParent : TModelEnderecoIntegracao) : iDAOEnderecoIntegracao;
    function Inserir : iDAOEnderecoIntegracao;
  end;

implementation

uses
  server.model.resource.interfaces,
  server.model.resource.impl.factory;

{ TDAOEnderecoIntegracao }

constructor TDAOEnderecoIntegracao.Create(aParent: TModelEnderecoIntegracao);
begin
  FParent := aParent;
end;

function TDAOEnderecoIntegracao.Inserir: iDAOEnderecoIntegracao;
var
  LConexao : iConexao;
  LQueryEnderecoIntegracao : iQuery;
begin
  Result := Self;
  LConexao := TResourceFactory.Conexao;
  LQueryEnderecoIntegracao := TResourceFactory.Query(LConexao);
  LQueryEnderecoIntegracao.SQL.Add('INSERT INTO endereco_integracao (idendereco, dsuf, nmcidade, nmbairro, nllogradouro, dscomplemento) ');
  LQueryEnderecoIntegracao.SQL.Add('VALUES (:idendereco, :dsuf, :nmcidade, :nmbairro, :nllogradouro, :dscomplemento) ');

  LQueryEnderecoIntegracao.Params.ParamByName('idendereco').AsInteger := FParent.IDEndereco;
  LQueryEnderecoIntegracao.Params.ParamByName('dsuf').AsString := FParent.UF;
  LQueryEnderecoIntegracao.Params.ParamByName('nmcidade').AsString := FParent.Cidade;
  LQueryEnderecoIntegracao.Params.ParamByName('nmbairro').AsString := FParent.Bairro;
  LQueryEnderecoIntegracao.Params.ParamByName('nllogradouro').AsString := FParent.Logradouro;
  LQueryEnderecoIntegracao.Params.ParamByName('dscomplemento').AsString := FParent.Complemento;

  LQueryEnderecoIntegracao.ExecSQL;

end;

class function TDAOEnderecoIntegracao.New(
  aParent: TModelEnderecoIntegracao): iDAOEnderecoIntegracao;
begin
  Result := Self.Create(aParent);
end;

end.
