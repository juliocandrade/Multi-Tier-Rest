unit server.model.service.cep.interfaces;

interface

uses
  server.model.entity.consultacep;

type
  iServiceCEP = interface
    ['{DCEEC845-D86B-43E8-BF0C-0222706FD51F}']
    function Code(aValue : String) : iServiceCEP;
    function Execute : iServiceCEP; overload;
    function Execute(var aValue : TModelConsultaCEP) : iServiceCEP; overload;
    function Return : String;
  end;
implementation

end.
