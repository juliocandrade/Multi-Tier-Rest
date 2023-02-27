unit server.model.service.provider.interfaces;

interface

uses
  server.model.service.provider.impl.action;
type
  iProvider = interface
    ['{C1E4FC4F-A73A-480B-A736-25DCC7D68836}']
  end;

  iProviderRoutes = interface
    ['{F70AE449-7EEF-4376-B2ED-B69DFCBBA860}']
    function Get(aPath : string; aAction : TProviderActionRequestResponse) : iProviderRoutes;
    function Post(aPath : string; aAction : TProviderActionRequestResponse) : iProviderRoutes;
    function Put(aPath : string; aAction : TProviderActionRequestResponse) : iProviderRoutes;
    function Delete(aPath : string; aAction : TProviderActionRequestResponse) : iProviderRoutes;
    procedure ActionGet(aPath: string; var aAction: TProviderActionRequestResponse);
    procedure ActionPost(aPath: string; var aAction: TProviderActionRequestResponse);
    procedure ActionDelete(aPath: string; var aAction: TProviderActionRequestResponse);
    procedure ActionPut(aPath: string; var aAction: TProviderActionRequestResponse);
  end;

  iProviderRouteAction = interface
    ['{A1EEFDD7-74EB-46E0-AA64-2227F026BC9F}']
    procedure RegisterRouter(aPath : string; aAction : TProviderActionRequestResponse);
    function GetRoute(aPath : string; var aAction : TProviderActionRequestResponse) : boolean;
  end;
implementation

end.
