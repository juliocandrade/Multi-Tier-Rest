unit client.controller.dto.impl.pessoa.lote;

interface

uses
  client.controller.dto.interfaces,
  client.model.dao.Interfaces,
  client.model.entity.pessoa,
  System.Generics.Collections;
type
  TPessoaLoteDTO = class(TInterfacedObject, iPessoaLote)
  private
    FEntity : TModelPessoa;
    FList : TObjectDictionary<integer,TModelPessoa>;
    FServices : iDAOPessoaLote;
    FIndiceAtual : Integer;
    procedure InternalLimparLista;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iPessoaLote;
    function Services : iDAOPessoaLote;
    function Entity : iPessoaEntity<iPessoaLote>;
    function AdicionarPessoa : integer;
    function RemoverPessoa(aIndex : Integer) : iPessoaLote;
    function LimparLista : iPessoaLote;
    function AtualizarPessoa(aIndex : Integer) : iPessoaLote;
  end;
implementation

uses
  client.controller.dto.impl.pessoa.entity,
  client.model.dao.impl.factory,
  System.SysUtils;

{ TPessoaLoteDTO }

function TPessoaLoteDTO.AdicionarPessoa: integer;
begin
  Inc(FIndiceAtual);
  FList.Add(FIndiceAtual, FEntity);
  FEntity := TModelPessoa.Create;
  Result := FIndiceAtual;
end;

constructor TPessoaLoteDTO.Create;
begin
  FIndiceAtual := 0;
  FEntity := TModelPessoa.Create;
  FList := TObjectDictionary<integer, TModelPessoa>.Create;
  FServices := TDAOFactory.New.PessoaLote(FList);
end;

destructor TPessoaLoteDTO.Destroy;
begin
  FEntity.Free;
  LimparLista;
  FList.Free;
  inherited;
end;

function TPessoaLoteDTO.Entity: iPessoaEntity<iPessoaLote>;
begin
  Result := TPessoaEntityDTO<iPessoaLote>.New(Self, FEntity);
end;

function TPessoaLoteDTO.LimparLista: iPessoaLote;
begin
  InternalLimparLista;
  FList.Clear;
end;

procedure TPessoaLoteDTO.InternalLimparLista;
var
  LPessoa : TMOdelPessoa;
begin
  for LPessoa in FList.Values do
    LPessoa.Free;
end;

class function TPessoaLoteDTO.New: iPessoaLote;
begin
  Result := Self.Create;
end;

function TPessoaLoteDTO.RemoverPessoa(aIndex: Integer): iPessoaLote;
begin
  Result := Self;
  if not FList.ContainsKey(aIndex) then
    raise Exception.Create('Índice inválido');
  FList.Remove(aIndex);
end;

function TPessoaLoteDTO.Services: iDAOPessoaLote;
begin
  Result := FServices;
end;

function TPessoaLoteDTO.AtualizarPessoa(aIndex: Integer): iPessoaLote;
var
  LPessoa : TModelPessoa;
begin
  if not FList.TryGetValue(aIndex, LPessoa) then
    raise Exception.Create('Índice inválido');
  FList.AddOrSetValue(aIndex, FEntity);
  LPessoa.Free;
  FEntity := TModelPessoa.Create;
end;

end.
