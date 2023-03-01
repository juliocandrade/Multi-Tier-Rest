unit server.model.dao.impl.endereco;

interface

uses
  server.model.dao.interfaces,
  server.model.entity.endereco,
  System.Generics.Collections,
  server.model.resource.interfaces;
type
  TDAOEndereco = class(TInterfacedObject, iDAOEndereco)
  private
    FParent : TModelEndereco;
    FList : TObjectList<TModelEndereco>;
    FListIterator : iDAOGenericIterator<TModelEndereco>;
    procedure DatasetToList(aQuery : iQuery);
  public
    constructor Create(aParent : TModelEndereco);
    class function New(aParent : TModelEndereco) : iDAOEndereco;
    destructor Destroy; override;
    function ListarNaoAtualizados : iDAOEndereco;
    function List : iDAOGenericIterator<TModelEndereco>;
    function Inserir : iDAOEndereco; overload;
    function Inserir(aConexao : iConexao) : iDAOEndereco; overload;
    function Alterar : iDAOEndereco; overload;
    function Alterar(aConexao : iConexao) : iDAOEndereco; overload;
    function DatasetToEntity(AEndereco : TModelEndereco; aQuery : iQuery) : iDAOEndereco;
  end;
implementation

uses
  server.model.resource.impl.factory,
  server.model.dao.impl.generic.iterator;

{ TDAOEndereco }

function TDAOEndereco.Alterar: iDAOEndereco;
var
  LQueryEndereco : iQuery;
  LConexao : iConexao;
begin
  Result := Self;
  LConexao := TResourceFactory.Conexao;
  LQueryEndereco := TResourceFactory.Query(LConexao);
  LConexao.StartTransaction;
  Alterar(LConexao);
end;

function TDAOEndereco.Alterar(aConexao: iConexao): iDAOEndereco;
var
  LQueryEndereco : iQuery;
begin
  Result := Self;
  LQueryEndereco := TResourceFactory.Query(aConexao);
  LQueryEndereco.SQL.Add('UPDATE endereco SET dscep = :dscep WHERE idpessoa = :idpessoa ');
  LQueryEndereco.SQL.Add('RETURNING *');
  LQueryEndereco.Params.ParamByName('dscep').AsString := FParent.CEP;
  LQueryEndereco.Params.ParamByName('idpessoa').AsLargeInt := FParent.IDPessoa;
  LQueryEndereco.Open;
  DatasetToEntity(FParent, LQueryEndereco);
end;

constructor TDAOEndereco.Create(aParent: TModelEndereco);
begin
  FParent := aParent;
  FList :=TObjectList<TModelEndereco>.Create;
end;

function  TDAOEndereco.DatasetToEntity(AEndereco: TModelEndereco;
  aQuery : iQuery) : iDAOEndereco;
begin
  Result := Self;
  AEndereco.IDEndereco := aQuery.Dataset.FieldByName('idendereco').AsLargeInt;
  AEndereco.IDPessoa := aQuery.Dataset.FieldByName('idpessoa').AsLargeInt;
  AEndereco.CEP := aQuery.Dataset.FieldByName('dscep').AsString;
end;

procedure TDAOEndereco.DatasetToList(aQuery : iQuery);
var
  I: Integer;
  LEndereco : TModelEndereco;
begin
  Flist.Clear;
  FListIterator := TDAOGenericIterator<TModelEndereco>.New(Flist);
  aQuery.Dataset.First;
  for I := 0 to Pred(aQuery.Dataset.RecordCount) do
  begin
    LEndereco := TModelEndereco.Create;
    DatasetToEntity(LEndereco, aQuery);
    FList.Add(LEndereco);
    aQuery.Dataset.Next;
  end;
end;

destructor TDAOEndereco.Destroy;
begin
  FList.Free;
  inherited;
end;

function TDAOEndereco.Inserir: iDAOEndereco;
var
  LQueryEndereco : iQuery;
  LConexao : iConexao;
begin
  Result := Self;
  LConexao := TResourceFactory.Conexao;
  LQueryEndereco := TResourceFactory.Query(LConexao);
  LConexao.StartTransaction;
  Inserir(LConexao);
end;

function TDAOEndereco.Inserir(aConexao: iConexao): iDAOEndereco;
var
  LQueryEndereco : iQuery;
begin
  Result := Self;
  LQueryEndereco := TResourceFactory.Query(aConexao);
  LQueryEndereco.SQL.Add('INSERT INTO endereco (idpessoa , dscep) ');
  LQueryEndereco.SQL.Add('VALUES (:idpessoa , :dscep)');
  LQueryEndereco.Params.ParamByName('idpessoa').AsLargeInt := FParent.IDPessoa;
  LQueryEndereco.Params.ParamByName('dscep').AsString := FParent.CEP;
  LQueryEndereco.SQL.Add('RETURNING *');
  LQueryEndereco.Open;
  DatasetToEntity(FParent, LQueryEndereco);
end;

function TDAOEndereco.List: iDAOGenericIterator<TModelEndereco>;
begin
  Result := FListIterator;
end;

function TDAOEndereco.ListarNaoAtualizados: iDAOEndereco;
var
  LConexao : iConexao;
  LQuery : iQuery;
begin
  Result := Self;
  LConexao := TResourceFactory.Conexao;
  LQuery := TResourceFactory.Query(LConexao);
  LQuery.SQL.Add('SELECT * FROM endereco e LEFT JOIN endereco_integracao ei ');
  LQuery.SQL.Add('ON e.idendereco = ei.idendereco ');
  LQuery.SQL.Add('WHERE ei.dsuf IS NULL AND ei.nmcidade IS NULL ');
  LQuery.SQL.Add('AND ei.nmbairro IS NULL AND ei.nllogradouro IS NULL ');
  LQuery.SQL.Add('AND dscomplemento IS NULL AND e.dscep IS NOT NULL');
  LQuery.Open;
  DatasetToList(LQuery);
end;

class function TDAOEndereco.New(aParent: TModelEndereco): iDAOEndereco;
begin
  Result := Self.Create(aParent);
end;

end.
