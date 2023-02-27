unit server.controller.interfaces;

interface

uses
  server.controller.dto.interfaces;
type
  iController = interface
    ['{9602C436-30AD-414D-B325-74DADB6131BD}']
    function Pessoa : iPessoa;
    function PessoaLote : iPessoaLote;
  end;
implementation

end.
