unit server.model.dao.impl.pessoa;

interface
uses
  System.Generics.Collections,
  System.Classes,
  server.model.dao.interfaces,
  server.model.entity.pessoa,
  server.model.resource.interfaces;

type
  TDAOPessoa = class(TInterfacedObject, iDAOPessoa)
  private
    FParent : TModelPessoa;
    FList : TObjectList<TModelPessoa>;
    procedure DatasetToList(aQuery : iQuery);
    procedure DatasetToEntity(APessoa : TModelPessoa; aQuery : iQuery);
    procedure SQLPessoa(SQL : TStrings);
  public
    constructor Create(aParent : TModelPessoa);
    class function New(aParent : TModelPessoa) : iDAOPessoa;
    destructor Destroy; override;
    function ListarTodos : iDAOPessoa;
    function ListarPorID(ID : Int64) : iDAOPessoa;
    function Inserir : iDAOPessoa;
    function Excluir : iDaoPessoa;
    function Alterar : iDaoPessoa;
    function IsEmpty : Boolean;
    function ListAsJSONArray : String;
    function EntityAsJSONObject : string;
  end;
implementation

uses
  REST.Json,
  System.JSON,
  System.SysUtils,
  server.model.resource.impl.factory,
  server.model.dao.impl.endereco,
  server.model.dao.impl.endereco.integracao;

{ TDAOPessoa }

function TDAOPessoa.Alterar: iDaoPessoa;
var
  LConexao : iConexao;
  LQueryPessoa : iQuery;
  LDAOEndereco : iDAOEndereco;
  LDAOEnderecoIntegracao : iDAOEnderecoIntegracao;
begin
  Result := Self;
  LConexao := TResourceFactory.Conexao;
  LQueryPessoa := TResourceFactory.Query(LConexao);
  LDAOEndereco := TDAOEndereco.New(FParent.Endereco);
  LDAOEnderecoIntegracao := TDAOEnderecoIntegracao.New(FParent.EnderecoIntegracao);

  LQueryPessoa.SQL.Add('UPDATE pessoa SET flnatureza = :flnatureza, dsdocumento = :dsdocumento, ');
  LQueryPessoa.SQL.Add('nmprimeiro = :nmprimeiro, nmsegundo = :nmsegundo WHERE idpessoa = :idpessoa ');
  LQueryPessoa.SQL.Add('RETURNING *');
  LQueryPessoa.Params.ParamByName('flnatureza').AsInteger := FParent.Natureza;
  LQueryPessoa.Params.ParamByName('dsdocumento').AsString := FParent.Documento;
  LQueryPessoa.Params.ParamByName('nmprimeiro').AsString := FParent.PrimeiroNome;
  LQueryPessoa.Params.ParamByName('nmsegundo').AsString := FParent.SegundoNome;
  LQueryPessoa.Params.ParamByName('idpessoa').AsLargeInt := FParent.ID;

  LConexao.StartTransaction;
  try
    LQueryPessoa.Open;
    FParent.Endereco.IDPessoa := FParent.ID;
    LDAOEndereco.Alterar(LConexao);
    FParent.EnderecoIntegracao.IDEndereco := FParent.Endereco.IDEndereco;
    LDAOEnderecoIntegracao.Alterar(LConexao);
    LConexao.Commit;
  except
    LConexao.Rollback;
    raise;
  end;
end;

constructor TDAOPessoa.Create(aParent : TModelPessoa);
begin
  FParent := aParent;
  FList :=TObjectList<TModelPessoa>.Create;
end;

procedure TDAOPessoa.DatasetToEntity(APessoa : TModelPessoa; aQuery : iQuery);
begin
    APessoa.ID := aQuery.Dataset.FieldByName('idpessoa').AsLargeInt;
    APessoa.Natureza := aQuery.Dataset.FieldByName('flnatureza').AsInteger;
    APessoa.Documento := aQuery.Dataset.FieldByName('dsdocumento').AsString;
    APessoa.PrimeiroNome := aQuery.Dataset.FieldByName('nmprimeiro').AsString;
    APessoa.SegundoNome := aQuery.Dataset.FieldByName('nmsegundo').AsString;
    APessoa.DataRegistro := aQuery.Dataset.FieldByName('dtregistro').AsDateTime;

    TDAOEndereco.New(aPessoa.Endereco).DatasetToEntity(aPessoa.Endereco, aQuery);
    TDAOEnderecoIntegracao.New(aPessoa.EnderecoIntegracao).DatasetToEntity(aPessoa.EnderecoIntegracao, aQuery);
end;

procedure TDAOPessoa.DatasetToList(aQuery : iQuery);
var
  I: Integer;
  LPessoa : TModelPessoa;
begin
  Flist.Clear;
  aQuery.DataSet.First;
  for I := 0 to Pred(aQuery.Dataset.RecordCount) do
  begin
    LPessoa := TModelPessoa.Create;
    DatasetToEntity(LPessoa, aQuery);
    FList.Add(LPessoa);
    aQuery.Dataset.Next;
  end;
end;

destructor TDAOPessoa.Destroy;
begin
  FList.Free;
  inherited;
end;

function TDAOPessoa.EntityAsJSONObject: string;
begin
  Result := TJSON.ObjectToJsonString(FParent, [joIndentCaseLower]);
end;

function TDAOPessoa.Excluir: iDaoPessoa;
var
  LConexao : iConexao;
  LQueryPessoa : iQuery;
begin
  Result := Self;
  LConexao := TResourceFactory.Conexao;
  LQueryPessoa := TResourceFactory.Query(LConexao);

  LQueryPessoa.SQL.Add('DELETE FROM pessoa WHERE idpessoa = :idpessoa');
  LQueryPessoa.Params.ParamByName('idpessoa').AsLargeInt := FParent.ID;
  LQueryPessoa.ExecSQL;
end;

function TDAOPessoa.Inserir: iDAOPessoa;
var
  LConexao : iConexao;
  LQueryPessoa : iQuery;
  LDAOEndereco : iDAOEndereco;
  LDAOEnderecoIntegracao : iDAOEnderecoIntegracao;
begin
  Result := Self;
  LConexao := TResourceFactory.Conexao;
  LQueryPessoa := TResourceFactory.Query(LConexao);
  LDAOEndereco := TDAOEndereco.New(FParent.Endereco);
  LDAOEnderecoIntegracao := TDAOEnderecoIntegracao.New(FParent.EnderecoIntegracao);

  LQueryPessoa.SQL.Add('INSERT INTO pessoa (flnatureza, dsdocumento, nmprimeiro, nmsegundo, dtregistro) ');
  LQueryPessoa.SQL.Add('VALUES (:flnatureza, :dsdocumento, :nmprimeiro, :nmsegundo, CURRENT_DATE) ');
  LQueryPessoa.SQL.Add('RETURNING *');
  LQueryPessoa.Params.ParamByName('flnatureza').AsInteger := FParent.Natureza;
  LQueryPessoa.Params.ParamByName('dsdocumento').AsString := FParent.Documento;
  LQueryPessoa.Params.ParamByName('nmprimeiro').AsString := FParent.PrimeiroNome;
  LQueryPessoa.Params.ParamByName('nmsegundo').AsString := FParent.SegundoNome;

  LConexao.StartTransaction;
  try
    LQueryPessoa.Open;
    FPArent.ID := LQueryPessoa.DataSet.FieldByName('idpessoa').AsLargeInt;
    FParent.Endereco.IDPessoa := FParent.ID;
    LDAOEndereco.Inserir(LConexao);
    FParent.EnderecoIntegracao.IDEndereco := FParent.Endereco.IDEndereco;
    LDAOEnderecoIntegracao.Inserir(LConexao);
    LConexao.Commit;
  except
    LConexao.Rollback;
    raise;
  end;
  ListarPorID(FParent.ID);
end;

function TDAOPessoa.IsEmpty: Boolean;
begin
  Result := FList.Count = 0;
end;

function TDAOPessoa.ListarPorID(ID : Int64): iDAOPessoa;
var
  LConexao : iConexao;
  LQuery : iQuery;
begin
  Result := Self;
  LConexao := TResourceFactory.Conexao;
  LQuery := TResourceFactory.Query(LConexao);
  SQLPessoa(LQuery.SQL);
  LQuery.SQL.Add(' WHERE p.idpessoa = :idpessoa');
  LQuery.Params.ParamByName('idpessoa').AsLargeInt := ID;
  LQuery.Open;
  DatasetToEntity(FParent, LQuery);
  DatasetToList(LQuery);
end;

function TDAOPessoa.ListarTodos: iDAOPessoa;
var
  LConexao : iConexao;
  LQuery : iQuery;
begin
  Result := Self;
  LConexao := TResourceFactory.Conexao;
  LQuery := TResourceFactory.Query(LConexao);

  SQLPessoa(LQuery.SQL);
  LQuery.Open;
  DatasetToList(LQuery);

end;

function TDAOPessoa.ListAsJSONArray: String;
var
  LJSONArray : TJSONArray;
  LJSONObject : TJSONObject;
begin
  Result := '[]';
  LJSONObject := TJson.ObjectToJsonObject(FList, [joIndentCaseLower]);
  try
    LJSONArray := LJSONObject.GetValue<TJSONArray>('listhelper');
    Result := TJSON.JsonEncode(LJSONArray);
  finally
    LJSONObject.Free;
  end;
end;

class function TDAOPessoa.New(aParent: TModelPessoa): iDAOPessoa;
begin
  Result := Self.Create(aParent);
end;

procedure TDAOPessoa.SQLPessoa(SQL: TStrings);
begin
  SQL.Add('SELECT p.*, e.idendereco, e.idendereco, e.dscep, ');
  SQL.Add('ei.dsuf, ei.nmcidade, ei.nmbairro, ');
  SQL.Add('ei.nllogradouro, ei.dscomplemento FROM pessoa p ');
  SQL.Add('LEFT JOIN endereco e ON p.idpessoa = e.idpessoa ');
  SQL.Add('LEFT JOIN endereco_integracao ei ON e.idendereco = ei.idendereco');
end;

end.
