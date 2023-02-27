unit server.model.dao.impl.endereco;

interface

uses
  server.model.dao.interfaces,
  server.model.entity.endereco,
  Data.DB,
  System.Generics.Collections;
type
  TDAOEndereco = class(TInterfacedObject, iDAOEndereco)
  private
    FParent : TModelEndereco;
    FList : TObjectList<TModelEndereco>;
    FListIterator : iDAOGenericIterator<TModelEndereco>;
    procedure DatasetToList(aDataSet : TDataset);
    procedure DatasetToEntity(AEndereco : TModelEndereco; aDataSet : TDataset);
  public
    constructor Create(aParent : TModelEndereco);
    class function New(aParent : TModelEndereco) : iDAOEndereco;
    destructor Destroy; override;
    function ListarNaoAtualizados : iDAOEndereco;
    function List : iDAOGenericIterator<TModelEndereco>;
  end;
implementation

uses
  server.model.resource.interfaces,
  server.model.resource.impl.factory,
  server.model.dao.impl.generic.iterator;

{ TDAOEndereco }

constructor TDAOEndereco.Create(aParent: TModelEndereco);
begin
  FParent := aParent;
  FList :=TObjectList<TModelEndereco>.Create;
end;

procedure TDAOEndereco.DatasetToEntity(AEndereco: TModelEndereco;
  aDataSet: TDataset);
begin
    AEndereco.IDEndereco := aDataset.FieldByName('idendereco').AsLargeInt;
    AEndereco.IDPessoa := aDataset.FieldByName('idpessoa').AsLargeInt;
    AEndereco.CEP := aDataset.FieldByName('dscep').AsString;
end;

procedure TDAOEndereco.DatasetToList(aDataSet: TDataset);
var
  I: Integer;
  LEndereco : TModelEndereco;
begin
  Flist.Clear;
  FListIterator := TDAOGenericIterator<TModelEndereco>.New(Flist);
  aDataset.First;
  for I := 0 to Pred(aDataset.RecordCount) do
  begin
    LEndereco := TModelEndereco.Create;
    DatasetToEntity(LEndereco, aDataSet);
    FList.Add(LEndereco);
    aDataset.Next;
  end;
end;

destructor TDAOEndereco.Destroy;
begin
  FList.Free;
  inherited;
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
  LQuery.SQL.Add('SELECT * FROM endereco e WHERE e.idendereco NOT IN (SELECT idendereco FROM endereco_integracao)');
  LQuery.Open;
  DatasetToList(LQuery.DataSet);
end;

class function TDAOEndereco.New(aParent: TModelEndereco): iDAOEndereco;
begin
  Result := Self.Create(aParent);
end;

end.
