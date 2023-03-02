unit server.model.dao.impl.pessoa.lote;

interface

uses
  System.Generics.Collections,
  server.model.dao.interfaces,
  server.model.entity.pessoa;
type
  TDAOPessoaLote = class(TInterfacedObject, iDAOPessoaLote)
  private
    FList : TObjectList<TModelPessoa>;
    private function GetIDPessoa(aRange : Integer) : Int64;
    private function GetIDEndereco(aRange : Integer) : Int64;
  public
    constructor Create(aList : TObjectList<TModelPessoa>);
    class function New(aList : TObjectList<TModelPessoa>) : iDAOPessoaLote;
    function Inserir : iDAOPessoaLote;

  end;

implementation

uses
  Data.DB,
  server.model.resource.interfaces, server.model.resource.impl.factory,
  System.SysUtils;

{ TDAOPessoaLote }

constructor TDAOPessoaLote.Create(aList: TObjectList<TModelPessoa>);
begin
  FList := aList;
end;

function TDAOPessoaLote.GetIDEndereco(aRange: Integer): Int64;
var
  LConexao : iConexao;
  LQueryID : iQuery;
begin
  LConexao := TResourceFactory.Conexao;
  LQueryID := TResourceFactory.Query(LConexao);
  LQueryID.Open(Format('SELECT setval(pg_get_serial_sequence(''endereco'',''idendereco''), Nextval(pg_get_serial_sequence(''endereco'',''idendereco'')) + %d, false) as id', [aRange]));
  Result := LQueryID.DataSet.FieldByName('id').AsLargeInt - aRange;

end;

function TDAOPessoaLote.GetIDPessoa(aRange: Integer): Int64;
var
  LConexao : iConexao;
  LQueryID : iQuery;
begin
  LConexao := TResourceFactory.Conexao;
  LQueryID := TResourceFactory.Query(LConexao);
  LQueryID.Open(Format('SELECT setval(pg_get_serial_sequence(''pessoa'',''idpessoa''), Nextval(pg_get_serial_sequence(''pessoa'',''idpessoa'')) + %d, false) as id', [aRange]));
  Result := LQueryID.DataSet.FieldByName('id').AsLargeInt - aRange;
end;

function TDAOPessoaLote.Inserir: iDaoPessoaLote;
var
  LConexao : iConexao;
  LQueryPessoa : iQuery;
  LQueryEndereco : iQuery;
  LQueryEnderecoIntegracao : iQuery;
  LIDPessoa : int64;
  LIDEndereco : int64;
  LParamsPessoa : TArray<TParams>;
  LParamsEndereco : TArray<TParams>;
  LParamsEnderecoIntegracao : TArray<TParams>;
  I : Integer;
begin
  Result := Self;

  LIDPessoa := GetIDPessoa(FList.Count);
  LIDEndereco := GetIDEndereco(FList.Count);
  SetLength(LParamsPessoa, FList.Count);
  SetLength(LParamsEndereco, FList.Count);
  SetLength(LParamsEnderecoIntegracao, FList.Count);

  LConexao := TResourceFactory.Conexao;
  LQueryPessoa := TResourceFactory.Query(LConexao);
  LQueryEndereco := TResourceFactory.Query(LConexao);
  LQueryEnderecoIntegracao := TResourceFactory.Query(LConexao);

  LQueryPessoa.SQL.Add('INSERT INTO pessoa (idpessoa, flnatureza, dsdocumento, nmprimeiro, nmsegundo, dtregistro)');
  LQueryPessoa.SQL.Add('VALUES (:idpessoa, :flnatureza, :dsdocumento, :nmprimeiro, :nmsegundo, CURRENT_DATE) ');

  LQueryEndereco.SQL.Add('INSERT INTO endereco (idendereco, idpessoa , dscep) ');
  LQueryEndereco.SQL.Add('VALUES (:idendereco, :idpessoa, :dscep) ');

  LQueryEnderecoIntegracao.SQL.Add('INSERT INTO endereco_integracao (idendereco, dsuf, nmcidade, nmbairro, nllogradouro, dscomplemento) ');
  LQueryEnderecoIntegracao.SQL.Add('VALUES (:idendereco, :dsuf, :nmcidade, :nmbairro, :nllogradouro, :dscomplemento) ');
  try
    for I := 0 to Pred(FList.Count) do
    begin
      LParamsPessoa[I] := TParams.Create(nil);
      LParamsPessoa[I].Assign(LQueryPessoa.Params);
      LParamsPessoa[I].ParamByName('idpessoa').AsLargeInt := LIDPessoa;
      LParamsPessoa[I].ParamByName('flnatureza').AsInteger := FList[i].Natureza;
      LParamsPessoa[I].ParamByName('dsdocumento').AsString := FList[i].Documento;
      LParamsPessoa[I].ParamByName('nmprimeiro').AsString := FList[i].PrimeiroNome;
      LParamsPessoa[I].ParamByName('nmsegundo').AsString := FList[i].SegundoNome;

      LParamsEndereco[I] := TParams.Create(nil);
      LParamsEndereco[I].Assign(LQueryEndereco.Params);
      LParamsEndereco[I].ParamByName('idendereco').AsLargeInt := LIDEndereco;
      LParamsEndereco[I].ParamByName('idpessoa').AsLargeInt := LIDPessoa;
      LParamsEndereco[I].ParamByName('dscep').AsString := FList[i].Endereco.CEP;

      LParamsEnderecoIntegracao[I] := TParams.Create(nil);
      LParamsEnderecoIntegracao[I].Assign(LQueryEnderecoIntegracao.Params);
      LParamsEnderecoIntegracao[I].ParamByName('idendereco').AsLargeInt := LIDEndereco;
      LParamsEnderecoIntegracao[I].ParamByName('dsuf').AsString := FList[i].EnderecoIntegracao.UF;
      LParamsEnderecoIntegracao[I].ParamByName('nmcidade').AsString := FList[i].EnderecoIntegracao.Cidade;
      LParamsEnderecoIntegracao[I].ParamByName('nmbairro').AsString := FList[i].EnderecoIntegracao.Bairro;
      LParamsEnderecoIntegracao[I].ParamByName('nllogradouro').AsString := FList[i].EnderecoIntegracao.Logradouro;
      LParamsEnderecoIntegracao[I].ParamByName('dscomplemento').AsString := FList[i].EnderecoIntegracao.Complemento;

      Inc(LIDPessoa);
      Inc(LIDEndereco);
    end;

    LConexao.StartTransaction;
    try
      LQueryPessoa.ExecSQLArray(LParamsPessoa);
      LQueryEndereco.ExecSQLArray(LParamsEndereco);
      LQueryEnderecoIntegracao.ExecSQLArray(LParamsEnderecoIntegracao);

      LConexao.Commit;
    except
      LConexao.Rollback;
    end;
  finally
    for I := 0 to pred(FList.Count) do
    begin
      FreeAndNil(LParamsPessoa[I]);
      FreeAndNil(LParamsEndereco[I]);
      FreeAndNil(LParamsEnderecoIntegracao[I]);
    end;
    finalize(LParamsPessoa);
    finalize(LParamsEndereco);
    finalize(LParamsEnderecoIntegracao);
  end;
end;

class function TDAOPessoaLote.New(
  aList: TObjectList<TModelPessoa>): iDAOPessoaLote;
begin
  Result := Self.Create(aList);
end;

end.
