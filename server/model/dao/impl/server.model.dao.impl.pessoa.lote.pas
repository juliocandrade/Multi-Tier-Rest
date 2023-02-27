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
    private function GetID(aRange : Integer) : Int64;
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

function TDAOPessoaLote.GetID(aRange: Integer): Int64;
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
  LIdPessoa : int64;
  LParamsPessoa : TArray<TParams>;
  LParamsEndereco : TArray<TParams>;
  I : Integer;
begin
  Result := Self;

  LIDPessoa := GetID(FList.Count);
  SetLength(LParamsPessoa, FList.Count);
  SetLength(LParamsEndereco, FList.Count);

  LConexao := TResourceFactory.Conexao;
  LQueryPessoa := TResourceFactory.Query(LConexao);
  LQueryEndereco := TResourceFactory.Query(LConexao);

  LQueryPessoa.SQL.Add('INSERT INTO pessoa (idpessoa, flnatureza, dsdocumento, nmprimeiro, nmsegundo, dtregistro)');
  LQueryPessoa.SQL.Add('VALUES (:idpessoa, :flnatureza, :dsdocumento, :nmprimeiro, :nmsegundo, CURRENT_DATE) ');

  LQueryEndereco.SQL.Add('INSERT INTO endereco (idpessoa , dscep) ');
  LQueryEndereco.SQL.Add('VALUES (:idpessoa, :dscep)');
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
      LParamsEndereco[I].ParamByName('idpessoa').AsLargeInt := LIDPessoa;
      LParamsEndereco[I].ParamByName('dscep').AsString := FList[i].Endereco.CEP;
      Inc(LIDPessoa);
    end;

    LConexao.StartTransaction;
    try
      LQueryPessoa.ExecSQLArray(LParamsPessoa);
      LQueryEndereco.ExecSQLArray(LParamsEndereco);

      LConexao.Commit;
    except
      LConexao.Rollback;
    end;
  finally
    for I := 0 to pred(FList.Count) do
    begin
      FreeAndNil(LParamsPessoa[I]);
      FreeAndNil(LParamsEndereco[I]);
    end;
    finalize(LParamsPessoa);
    finalize(LParamsEndereco);
  end;
end;

class function TDAOPessoaLote.New(
  aList: TObjectList<TModelPessoa>): iDAOPessoaLote;
begin
  Result := Self.Create(aList);
end;

end.
