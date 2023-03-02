unit client.controller.dto.impl.pessoa;

interface

uses
  client.controller.dto.interfaces,
  client.model.entity.pessoa,
  client.model.dao.Interfaces;
type
  TPessoaDTO = class(TInterfacedObject, iPessoa)
  private
    FEntity : TModelPessoa;
    FServices : iDAOPEssoa;
    FDTOEntity : iPessoaEntity<iPessoa>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iPessoa;
    function Services : iDAOPessoa;
    function Entity : iPessoaEntity<iPessoa>;
  end;
implementation

uses
  client.model.dao.impl.factory, System.SysUtils,
  client.controller.dto.impl.pessoa.entity;

{ TPessoaDTO }

constructor TPessoaDTO.Create;
begin
  FEntity := TModelPessoa.Create;
  FDTOEntity := TPessoaEntityDTO<iPessoa>.New(Self, FEntity);
  FServices := TDAOFactory.New.Pessoa(FEntity);
end;

destructor TPessoaDTO.Destroy;
begin
  FEntity.Free;
  inherited;
end;

function TPessoaDTO.Entity: iPessoaEntity<iPessoa>;
begin
  Result := FDTOEntity;
end;

class function TPessoaDTO.New: iPessoa;
begin
  Result := Self.Create;
end;

function TPessoaDTO.Services: iDAOPessoa;
begin
  Result := FServices;
end;

end.
