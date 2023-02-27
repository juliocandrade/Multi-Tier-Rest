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
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iPessoa;
    function Services : iDAOPessoa;
    function ID(aValue: int64) : iPessoa; overload;
    function ID(aValue: String) : iPessoa; overload;
    function ID : int64; overload;
    function Natureza(aValue: integer) : iPessoa; overload;
    function Natureza(aValue: String) : iPessoa; overload;
    function Natureza : integer; overload;
    function DataRegistro(aValue: TDate) : iPessoa; overload;
    function DataRegistro : TDate; overload;
    function Documento(aValue: string) : iPessoa; overload;
    function Documento : string; overload;
    function PrimeiroNome(aValue: string) : iPessoa; overload;
    function PrimeiroNome : string; overload;
    function SegundoNome(aValue: string) : iPessoa; overload;
    function SegundoNome : string; overload;
    function CEP(aValue: string) : iPessoa; overload;
    function CEP : string; overload;
    function Bairro(aValue: String) : iPessoa; overload;
    function Bairro : String; overload;
    function Cidade(aValue: string) : iPessoa; overload;
    function Cidade : string; overload;
    function Complemento(aValue: String) : iPessoa; overload;
    function Complemento : String; overload;
    function Logradouro(aValue: String) : iPessoa; overload;
    function Logradouro : String; overload;
    function UF(aValue: String) : iPessoa; overload;
    function UF : String; overload;

  end;
implementation

uses
  client.model.dao.impl.factory, System.SysUtils;

{ TPessoaDTO }

function TPessoaDTO.Bairro: String;
begin
  Result := FEntity.EnderecoIntegracao.Bairro;
end;

function TPessoaDTO.Bairro(aValue: String): iPessoa;
begin
  Result := Self;
  FEntity.EnderecoIntegracao.Bairro := aValue;
end;

function TPessoaDTO.CEP: string;
begin
  Result := FEntity.Endereco.CEP;
end;

function TPessoaDTO.CEP(aValue: string): iPessoa;
begin
  Result := Self;
  FEntity.Endereco.CEP := aValue;
end;

function TPessoaDTO.Cidade: string;
begin
  Result := FEntity.EnderecoIntegracao.Cidade;
end;

function TPessoaDTO.Cidade(aValue: string): iPessoa;
begin
  Result := Self;
  FEntity.EnderecoIntegracao.Cidade := aValue;
end;

function TPessoaDTO.Complemento: String;
begin
  Result := FEntity.EnderecoIntegracao.Complemento;
end;

function TPessoaDTO.Complemento(aValue: String): iPessoa;
begin
  Result := Self;
  FEntity.EnderecoIntegracao.Complemento := aValue;
end;

constructor TPessoaDTO.Create;
begin
  FEntity := TModelPessoa.Create;
  FServices := TDAOFactory.New.Pessoa(FEntity);
end;

function TPessoaDTO.DataRegistro: TDate;
begin
  Result := FEntity.DataRegistro;
end;

function TPessoaDTO.DataRegistro(aValue: TDate): iPessoa;
begin
  Result := Self;
  FEntity.DataRegistro := aValue;
end;

destructor TPessoaDTO.Destroy;
begin
  FEntity.Free;
  inherited;
end;

function TPessoaDTO.Documento: string;
begin
  Result := FEntity.Documento;
end;

function TPessoaDTO.ID(aValue: String): iPessoa;
begin
  Result := Self;
  try
    FEntity.ID := StrToInt64(aValue);
  except
    raise Exception.Create('ID Inválido');
  end;
end;

function TPessoaDTO.Documento(aValue: string): iPessoa;
begin
  Result := Self;
  FEntity.Documento := aValue;
end;

function TPessoaDTO.ID(aValue: int64): iPessoa;
begin
  Result := Self;
  FEntity.ID := aValue;
end;

function TPessoaDTO.ID: int64;
begin
  Result := FEntity.ID;
end;

function TPessoaDTO.Logradouro: String;
begin
  Result := FEntity.EnderecoIntegracao.Logradouro;
end;

function TPessoaDTO.Logradouro(aValue: String): iPessoa;
begin
  Result := Self;
  FEntity.EnderecoIntegracao.Logradouro := aValue;
end;

function TPessoaDTO.Natureza(aValue: integer): iPessoa;
begin
  Result := Self;
  FEntity.Natureza := aValue;
end;

function TPessoaDTO.Natureza: integer;
begin
  Result := FEntity.Natureza
end;

function TPessoaDTO.Natureza(aValue: String): iPessoa;
begin
  Result := Self;
  try
    FEntity.Natureza := StrToInt64(aValue);
  except
    raise Exception.Create('Natureza Inválida');
  end;
end;

class function TPessoaDTO.New: iPessoa;
begin
  Result := Self.Create;
end;

function TPessoaDTO.PrimeiroNome: string;
begin
  Result := FEntity.PrimeiroNome;
end;

function TPessoaDTO.PrimeiroNome(aValue: string): iPessoa;
begin
  Result := Self;
  FEntity.PrimeiroNome := aValue;
end;

function TPessoaDTO.SegundoNome: string;
begin
  Result := FEntity.SegundoNome;
end;

function TPessoaDTO.SegundoNome(aValue: string): iPessoa;
begin
  Result := Self;
  FEntity.SegundoNome := aValue;
end;

function TPessoaDTO.Services: iDAOPessoa;
begin
  Result := FServices;
end;

function TPessoaDTO.UF: String;
begin
  Result := FEntity.EnderecoIntegracao.UF;
end;

function TPessoaDTO.UF(aValue: String): iPessoa;
begin
  Result := Self;
  FEntity.EnderecoIntegracao.UF := aValue;
end;

end.
