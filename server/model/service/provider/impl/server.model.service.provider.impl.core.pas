unit server.model.service.provider.impl.core;

interface
uses
  IdBaseComponent,
  IdComponent,
  IdCustomTCPServer,
  IdCustomHTTPServer,
  IdHTTPServer,
  IdContext,
  server.model.service.provider.interfaces,
  server.model.service.provider.impl.request,
  server.model.service.provider.impl.response;

type
  TProviderRequest = server.model.service.provider.impl.request.TProviderRequest;
  TProviderResponse = server.model.service.provider.impl.response.TProviderResponse;

  TProvider = class
  private
    const DEFAULT_PORT = 3000;
    class var FHTTPServer : TIdHTTPServer;
    class var FPort : Integer;
    class var FRoutes : iProviderRoutes;
    class function GetDefaultPort : Integer;
    class procedure InternalListen;
    class procedure InternalStopListen;
    class procedure DoCommand(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
  public
    class constructor Create;
    class destructor Finish;

    class procedure Listen(APort : integer);
    class procedure StopListen;
    class function Routes : iProviderRoutes;
  end;
implementation

uses
  System.SysUtils,
  System.Classes,
  System.JSON,
  IdGlobal,
  server.model.service.provider.impl.routes,
  server.model.service.provider.impl.action,
  server.model.exceptions,
  server.utils;

{ TProvider }

class constructor TProvider.Create;
begin
  FHTTPServer := TIdHTTPServer.Create(nil);
  FRoutes := TProviderRoutes.New;
end;

class procedure TProvider.DoCommand(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  LContentStream : TStream;
  LContentString : String;
  LMethod : THTTPCommandType;
  LProviderActionRequestResponse : TProviderActionRequestResponse;
  LReq : TProviderRequest;
  LRes : TProviderResponse;
  LPath : String;
  LURIParams : TArray<string>;
begin
  LRes := TProviderResponse.Create;
  try
    try
      LMethod := ARequestInfo.CommandType;
      LURIParams := TServerUtils.GetParamsFromURI(ARequestInfo.URI);
      LPath := TServerUtils.DecodeURI(ARequestInfo.URI);
      case LMethod of
        hcGET: FRoutes.ActionGet(LPath, LProviderActionRequestResponse);
        hcPOST: FRoutes.ActionPost(LPath, LProviderActionRequestResponse);
        hcDELETE: FRoutes.ActionDelete(LPath, LProviderActionRequestResponse);
        hcPUT: FRoutes.ActionPut(LPath, LProviderActionRequestResponse);
      else
        raise EProviderException.New.Status(404).Error('Not Found');
      end;
      LContentStream := ARequestInfo.PostStream;
      if assigned(LContentStream) then
        LContentString := ReadStringFromStream(LContentStream);
      LReq := TProviderRequest.Create(LContentString,LURIParams);
      try
        LProviderActionRequestResponse(LReq, LRes);
      finally
        LReq.Free;
      end;
    except
      on E : Exception do
      begin
        if E is ECampoInvalido then
        begin
          LRes.ResultStatusCode := 400;
          LRes.Body := Format('{"error": "%s"}', [E.Message]);
        end
        else if E is EProviderException then
        begin
          LRes.ResultStatusCode := EProviderException(E).Status;
          LRes.Body := EProviderException(E).ToJSONText;
        end
        else
        begin
          LRes.ResultStatusCode := 500;
          LRes.Body := Format('{"error": "%s"}', [E.Message]);
        end;
      end;
    end;
    AResponseInfo.ContentType := 'application/json';
    AResponseInfo.CharSet := 'UTF-8';
    AResponseInfo.ResponseNo := LRes.ResultStatusCode;
    AResponseInfo.ContentText := LRes.Body;
    AResponseInfo.WriteContent;
  finally
    LRes.Free;
  end;
end;

class destructor TProvider.Finish;
begin
  FreeAndNil(FHTTPServer);
end;

class function TProvider.GetDefaultPort: Integer;
begin
  Result := DEFAULT_PORT;
end;

class procedure TProvider.InternalListen;
begin
  if FPort <= 0 then
    FPort := GetDefaultPort;

  FHTTPServer.DefaultPort := FPort;
  FHTTPServer.OnCommandGet := DoCommand;
  FHTTPServer.OnCommandOther := DoCommand;
  FHTTPServer.Active := True;
  System.Writeln(Format('Servidor rodando na porta %d', [FPort]));
  System.Readln;
end;

class procedure TProvider.InternalStopListen;
begin
  FHTTPServer.StopListening;
end;

class procedure TProvider.Listen(APort: integer);
begin
  FPort := APort;
  InternalListen;

end;

class function TProvider.Routes: iProviderRoutes;
begin
  Result := FRoutes;
end;

class procedure TProvider.StopListen;
begin
  InternalStopListen;
end;

end.
