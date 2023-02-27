unit client.model.service.interfaces;

interface

uses
  client.model.service.rest.interfaces;
type
  iServiceFactory = interface
    ['{9F24D8DE-A659-44B1-A43E-E45AC398DC3C}']
    function Rest : iRest;
  end;
implementation

end.
