unit client.controller.dto.impl.pessoa.entity;

interface

uses
  client.model.entity.pessoa,
  client.controller.dto.interfaces;
type
  TPessoaEntityDTO<T: IInterface> = class(TInterfacedObject, iPessoaEntity<T>)
  private
    [weak]
    FParent : T;
    FEntity : TModelPessoa;
  public
    constructor Create(aParent : T; aEntity : TModelPessoa);
    class function New(aParent : T; aEntity : TModelPessoa) : iPessoaEntity<T>;
    function ID(aValue: int64) : iPessoaEntity<T>; overload;
    function ID(aValue: String) : iPessoaEntity<T>; overload;
    function ID : int64; overload;
    function Natureza(aValue: integer) : iPessoaEntity<T>; overload;
    function Natureza(aValue: String) : iPessoaEntity<T>; overload;
    function Natureza : integer; overload;
    function DataRegistro(aValue: TDate) : iPessoaEntity<T>; overload;
    function DataRegistro : TDate; overload;
    function Documento(aValue: string) : iPessoaEntity<T>; overload;
    function Documento : string; overload;
    function PrimeiroNome(aValue: string) : iPessoaEntity<T>; overload;
    function PrimeiroNome : string; overload;
    function SegundoNome(aValue: string) : iPessoaEntity<T>; overload;
    function SegundoNome : string; overload;
    function CEP(aValue: string) : iPessoaEntity<T>; overload;
    function CEP : string; overload;
    function Bairro(aValue: String) : iPessoaEntity<T>; overload;
    function Bairro : String; overload;
    function Cidade(aValue: string) : iPessoaEntity<T>; overload;
    function Cidade : string; overload;
    function Complemento(aValue: String) : iPessoaEntity<T>; overload;
    function Complemento : String; overload;
    function Logradouro(aValue: String) : iPessoaEntity<T>; overload;
    function Logradouro : String; overload;
    function UF(aValue: String) : iPessoaEntity<T>; overload;
    function UF : String; overload;
    function &End : T;

  end;
implementation

uses
  System.SysUtils;

{ TPessoaEntityDTO<T> }

function TPessoaEntityDTO<T>.&End: T;
begin
  Result := FParent;
end;

function TPessoaEntityDTO<T>.Bairro: String;
begin
  Result := FEntity.EnderecoIntegracao.Bairro;
end;

function TPessoaEntityDTO<T>.Bairro(aValue: String): iPessoaEntity<T>;
begin
  Result := Self;
  FEntity.EnderecoIntegracao.Bairro := aValue;
end;

function TPessoaEntityDTO<T>.CEP: string;
begin
  Result := FEntity.Endereco.CEP;
end;

function TPessoaEntityDTO<T>.CEP(aValue: string): iPessoaEntity<T>;
begin
  Result := Self;
  FEntity.Endereco.CEP := aValue;
end;

function TPessoaEntityDTO<T>.Cidade: string;
begin
  Result := FEntity.EnderecoIntegracao.Cidade;
end;

function TPessoaEntityDTO<T>.Cidade(aValue: string): iPessoaEntity<T>;
begin
  Result := Self;
  FEntity.EnderecoIntegracao.Cidade := aValue;
end;

function TPessoaEntityDTO<T>.Complemento: String;
begin
  Result := FEntity.EnderecoIntegracao.Complemento;
end;

function TPessoaEntityDTO<T>.Complemento(aValue: String): iPessoaEntity<T>;
begin
  Result := Self;
  FEntity.EnderecoIntegracao.Complemento := aValue;
end;

constructor TPessoaEntityDTO<T>.Create(aParent : T; aEntity : TModelPessoa);
begin
  FEntity := aEntity;
  FParent := aParent;
end;

function TPessoaEntityDTO<T>.DataRegistro: TDate;
begin
  Result := FEntity.DataRegistro;
end;

function TPessoaEntityDTO<T>.DataRegistro(aValue: TDate): iPessoaEntity<T>;
begin
  Result := Self;
  FEntity.DataRegistro := aValue;
end;

function TPessoaEntityDTO<T>.Documento: string;
begin
  Result := FEntity.Documento;
end;

function TPessoaEntityDTO<T>.ID(aValue: String): iPessoaEntity<T>;
begin
  Result := Self;
  try
    FEntity.ID := StrToInt64(aValue);
  except
    raise Exception.Create('ID Inválido');
  end;
end;

function TPessoaEntityDTO<T>.Documento(aValue: string): iPessoaEntity<T>;
begin
  Result := Self;
  FEntity.Documento := aValue;
end;

function TPessoaEntityDTO<T>.ID(aValue: int64): iPessoaEntity<T>;
begin
  Result := Self;
  FEntity.ID := aValue;
end;

function TPessoaEntityDTO<T>.ID: int64;
begin
  Result := FEntity.ID;
end;

function TPessoaEntityDTO<T>.Logradouro: String;
begin
  Result := FEntity.EnderecoIntegracao.Logradouro;
end;

function TPessoaEntityDTO<T>.Logradouro(aValue: String): iPessoaEntity<T>;
begin
  Result := Self;
  FEntity.EnderecoIntegracao.Logradouro := aValue;
end;

function TPessoaEntityDTO<T>.Natureza(aValue: integer): iPessoaEntity<T>;
begin
  Result := Self;
  FEntity.Natureza := aValue;
end;

function TPessoaEntityDTO<T>.Natureza: integer;
begin
  Result := FEntity.Natureza
end;

function TPessoaEntityDTO<T>.Natureza(aValue: String): iPessoaEntity<T>;
begin
  Result := Self;
  try
    FEntity.Natureza := StrToInt64(aValue);
  except
    raise Exception.Create('Natureza Inválida');
  end;
end;

class function TPessoaEntityDTO<T>.New(aParent : T; aEntity : TModelPessoa): iPessoaEntity<T>;
begin
  Result := Self.Create(aParent, aEntity);
end;

function TPessoaEntityDTO<T>.PrimeiroNome: string;
begin
  Result := FEntity.PrimeiroNome;
end;

function TPessoaEntityDTO<T>.PrimeiroNome(aValue: string): iPessoaEntity<T>;
begin
  Result := Self;
  FEntity.PrimeiroNome := aValue;
end;

function TPessoaEntityDTO<T>.SegundoNome: string;
begin
  Result := FEntity.SegundoNome;
end;

function TPessoaEntityDTO<T>.SegundoNome(aValue: string): iPessoaEntity<T>;
begin
  Result := Self;
  FEntity.SegundoNome := aValue;
end;

function TPessoaEntityDTO<T>.UF: String;
begin
  Result := FEntity.EnderecoIntegracao.UF;
end;

function TPessoaEntityDTO<T>.UF(aValue: String): iPessoaEntity<T>;
begin
  Result := Self;
  FEntity.EnderecoIntegracao.UF := aValue;
end;
end.
