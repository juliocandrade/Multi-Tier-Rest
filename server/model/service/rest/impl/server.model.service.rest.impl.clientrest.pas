unit server.model.service.rest.impl.clientrest;

interface

uses
  server.model.service.rest.interfaces,
  REST.Types,
  REST.Client,
  Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TClientRest = class(TInterfacedObject, iRest)
  private
    FRESTClient: TRestClient;
    FRESTResponse: TRESTResponse;
    FRESTRequest: TRestRequest;
    FParams : iRestParams;
    FContent : String;
    procedure DoJoinComponents;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iRest;

    function Content : string;
    function Delete : iRest;
    function Get : iRest;
    function Params : iRestParams;
    function Post : iRest; overload;
    function Put : iRest;

  end;
implementation

uses
  System.SysUtils,
  System.Classes,
  server.model.service.rest.impl.ClientRest.Params;

{ TClientRest }

function TClientRest.Content: string;
begin
  Result := FContent;
end;

constructor TClientRest.Create;
begin
  FRESTClient := TRestClient.Create(nil);
  FRestClient.SynchronizedEvents := False;
  FRESTResponse := TRESTResponse.Create(nil);
  FRESTRequest := TRestRequest.Create(nil);
  FRestRequest.SynchronizedEvents := False;
  FParams := TClientRestParams.New(Self);
  DoJoinComponents;

end;

function TClientRest.Delete: iRest;
begin

end;

destructor TClientRest.Destroy;
begin
  FreeAndNil(FRESTClient);
  FreeAndNil(FRESTResponse);
  FreeAndNil(FRESTRequest);
  inherited;
end;

procedure TClientRest.DoJoinComponents;
begin
  FRestRequest.Client := FRestClient;
  FRestRequest.Response := FRestResponse;
end;

function TClientRest.Get: iRest;
begin
  FRestClient.BaseURL := FParams.BaseURL;
  FRestRequest.Method := rmGET;
  FRestRequest.Resource := FParams.EndPoint;
  FRestRequest.Accept := CONTENTTYPE_APPLICATION_JSON + ', ' + CONTENTTYPE_TEXT_PLAIN + '; q=0.9, ' + CONTENTTYPE_TEXT_HTML + ';q=0.8,';
  FRestRequest.AcceptCharset := 'utf-8, *;q=0.8';
  FRestRequest.Execute;
  FContent := FRestResponse.Content;
end;

class function TClientRest.New: iRest;
begin
  Result := Self.Create;
end;

function TClientRest.Params: iRestParams;
begin
  Result := FParams;
end;

function TClientRest.Post: iRest;
begin

end;

function TClientRest.Put: iRest;
begin

end;

end.
