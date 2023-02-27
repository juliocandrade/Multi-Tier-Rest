unit server.model.service.interfaces;

interface

uses
  server.model.service.rest.interfaces,
  server.model.service.cep.interfaces,
  server.model.service.endereco.interfaces;
type
  iServiceFactory = interface
    ['{6C666B35-13E3-413F-B7C1-C9A2914D1000}']
    function Rest : iRest;
    function CEP : iServiceCEP;
    function Endereco : iServiceEndereco;
  end;

implementation

end.
