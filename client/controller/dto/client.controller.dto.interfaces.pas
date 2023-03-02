unit client.controller.dto.interfaces;

interface

uses
  client.model.entity.pessoa, client.model.dao.Interfaces;
type
  iPessoaEntity<T> = interface
    ['{49148AA6-4ED9-4B0F-95EB-E7EA5071BDD8}']
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

  iPessoa = interface
    ['{C0BC0A6C-FA9F-44EA-B331-A35E63237C98}']
    function Services : iDAOPessoa;
    function Entity : iPessoaEntity<iPessoa>;
  end;

  iPessoaLote = interface
    ['{8382F831-8086-4F63-8977-E0046F251E79}']
    function Services : iDAOPessoaLote;
    function Entity : iPessoaEntity<iPessoaLote>;
    function AdicionarPessoa : integer;
    function RemoverPessoa(aIndex : Integer) : iPessoaLote;
    function AtualizarPessoa(aIndex : Integer) : iPessoaLote;
    function LimparLista : iPessoaLote;
 end;

implementation

end.
