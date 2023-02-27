unit client.controller.dto.interfaces;

interface

uses
  client.model.entity.pessoa, client.model.dao.Interfaces;
type
  iPessoa = interface
    ['{C0BC0A6C-FA9F-44EA-B331-A35E63237C98}']
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

end.
