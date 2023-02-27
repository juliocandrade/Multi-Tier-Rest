unit server.model.dao.impl.pessoa;

interface
uses
  System.Generics.Collections,
  System.Classes,
  Data.DB,
  server.model.dao.interfaces,
  server.model.entity.pessoa;

type
  TDAOPessoa = class(TInterfacedObject, iDAOPessoa)
  private
    FParent : TModelPessoa;
    FList : TObjectList<TModelPessoa>;
    procedure DatasetToList(aDataSet : TDataset);
    procedure DatasetToEntity(APessoa : TModelPessoa; aDataSet : TDataset);
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
  server.model.resource.interfaces,
  server.model.resource.impl.factory;

{ TDAOPessoa }

function TDAOPessoa.Alterar: iDaoPessoa;
var
  LConexao : iConexao;
  LQueryPessoa : iQuery;
  LQueryEndereco : iQuery;
begin
  Result := Self;
  LConexao := TResourceFactory.Conexao;
  LQueryPessoa := TResourceFactory.Query(LConexao);
  LQueryEndereco := TResourceFactory.Query(LConexao);
  LQueryPessoa.SQL.Add('UPDATE pessoa SET flnatureza = :flnatureza, dsdocumento = :dsdocumento, ');
  LQueryPessoa.SQL.Add('nmprimeiro = :nmprimeiro, nmsegundo = :nmsegundo WHERE idpessoa = :idpessoa');
  LQueryPessoa.Params.ParamByName('flnatureza').AsInteger := FParent.Natureza;
  LQueryPessoa.Params.ParamByName('dsdocumento').AsString := FParent.Documento;
  LQueryPessoa.Params.ParamByName('nmprimeiro').AsString := FParent.PrimeiroNome;
  LQueryPessoa.Params.ParamByName('nmsegundo').AsString := FParent.SegundoNome;
  LQueryPessoa.Params.ParamByName('idpessoa').AsLargeInt := FParent.ID;

  LQueryEndereco.SQL.Add('UPDATE endereco SET dscep = :dscep WHERE idpessoa = :idpessoa');
  LQueryEndereco.Params.ParamByName('dscep').AsString := FParent.Endereco.CEP;
  LQueryEndereco.Params.ParamByName('idpessoa').AsLargeInt := FParent.ID;

  LConexao.StartTransaction;
  try
    LQueryPessoa.ExecSQL;
    LQueryEndereco.ExecSQL;
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

procedure TDAOPessoa.DatasetToEntity(APessoa : TModelPessoa; aDataSet: TDataset);
begin
    APessoa.ID := aDataset.FieldByName('idpessoa').AsLargeInt;
    APessoa.Natureza := aDataset.FieldByName('flnatureza').AsInteger;
    APessoa.Documento := aDataset.FieldByName('dsdocumento').AsString;
    APessoa.PrimeiroNome := aDataset.FieldByName('nmprimeiro').AsString;
    APessoa.SegundoNome := aDataset.FieldByName('nmsegundo').AsString;
    APessoa.DataRegistro := aDataset.FieldByName('dtregistro').AsDateTime;

    APessoa.Endereco.IDEndereco := aDataset.FieldByName('idendereco').AsLargeInt;
    APessoa.Endereco.IDPessoa := aDataset.FieldByName('eidpessoa').AsLargeInt;
    APessoa.Endereco.CEP := aDataset.FieldByName('dscep').AsString;

    APessoa.EnderecoIntegracao.IDEndereco := aDataset.FieldByName('iidendereco').AsLargeInt;
    APessoa.EnderecoIntegracao.UF := aDataset.FieldByName('dsuf').AsString;
    APessoa.EnderecoIntegracao.Cidade := aDataset.FieldByName('nmcidade').AsString;
    APessoa.EnderecoIntegracao.Bairro := aDataset.FieldByName('nmbairro').AsString;
    APessoa.EnderecoIntegracao.Logradouro := aDataset.FieldByName('nllogradouro').AsString;
    APessoa.EnderecoIntegracao.Complemento := aDataset.FieldByName('dscomplemento').AsString;
end;

procedure TDAOPessoa.DatasetToList(aDataSet: TDataset);
var
  I: Integer;
  LPessoa : TModelPessoa;
begin
  Flist.Clear;
  aDataset.First;
  for I := 0 to Pred(aDataset.RecordCount) do
  begin
    LPessoa := TModelPessoa.Create;
    DatasetToEntity(LPessoa, aDataSet);
    FList.Add(LPessoa);
    aDataset.Next;
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
  LQueryEndereco : iQuery;
  LIdPessoa : int64;
begin
  Result := Self;
  LConexao := TResourceFactory.Conexao;
  LQueryPessoa := TResourceFactory.Query(LConexao);
  LQueryEndereco := TResourceFactory.Query(LConexao);
  LQueryPessoa.SQL.Add('INSERT INTO pessoa (flnatureza, dsdocumento, nmprimeiro, nmsegundo, dtregistro) ');
  LQueryPessoa.SQL.Add('VALUES (:flnatureza, :dsdocumento, :nmprimeiro, :nmsegundo, CURRENT_DATE) ');
  LQueryPessoa.SQL.Add('RETURNING idpessoa');
  LQueryPessoa.Params.ParamByName('flnatureza').AsInteger := FParent.Natureza;
  LQueryPessoa.Params.ParamByName('dsdocumento').AsString := FParent.Documento;
  LQueryPessoa.Params.ParamByName('nmprimeiro').AsString := FParent.PrimeiroNome;
  LQueryPessoa.Params.ParamByName('nmsegundo').AsString := FParent.SegundoNome;

  LConexao.StartTransaction;
  try
    LQueryPessoa.Open;

    LIDPessoa := LQueryPessoa.DataSet.FieldByName('idpessoa').AsLargeInt;
    LQueryEndereco.SQL.Add('INSERT INTO endereco (idpessoa , dscep) ');
    LQueryEndereco.SQL.Add('VALUES (:idpessoa, :dscep)');
    LQueryEndereco.Params.ParamByName('idpessoa').AsLargeInt := LIDPessoa;
    LQueryEndereco.Params.ParamByName('dscep').AsString := FParent.Endereco.CEP;
    LQueryEndereco.ExecSQL;
    LConexao.Commit;
  except
    LConexao.Rollback;
    raise;
  end;
  ListarPorID(LIDPessoa);

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
  DatasetToEntity(FParent, LQuery.DataSet);
  DatasetToList(LQuery.DataSet);
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
  DatasetToList(LQuery.DataSet);

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
  SQL.Add('SELECT p.*, e.idpessoa as eidpessoa, e.idendereco, e.idendereco, e.dscep, ');
  SQL.Add('ei.idendereco as iidendereco, ei.dsuf, ei.nmcidade, ei.nmbairro, ');
  SQL.Add('ei.nllogradouro, ei.dscomplemento FROM pessoa p ');
  SQL.Add('LEFT JOIN endereco e ON p.idpessoa = e.idpessoa ');
  SQL.Add('LEFT JOIN endereco_integracao ei ON e.idendereco = ei.idendereco');
end;

end.
