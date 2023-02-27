unit server.utils;

interface
type
  TServerUtils = class
    class function DecodeURI(URI : String) : String;
    class function GetParamsFromURI(URI : String) : TArray<String>;
  end;
implementation

uses
  System.SysUtils;

{ TServerUtils }

class function TServerUtils.DecodeURI(URI: String): String;
var
  LURIParts : TArray<String>;
begin
  LURIParts := URI.Split(['/']);
  Result := '/' + LURIParts[1] + StringOfChar('/', Length(LURIParts) - 2);
end;

class function TServerUtils.GetParamsFromURI(URI: String): TArray<String>;
begin
  Result := URI.Split(['/']);
  Delete(Result,0, 2);
end;

end.
