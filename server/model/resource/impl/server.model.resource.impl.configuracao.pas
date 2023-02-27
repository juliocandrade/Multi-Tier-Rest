unit server.model.resource.impl.configuracao;

interface

uses
  server.model.resource.interfaces;

Type
  TConfiguracao = class(TInterfacedObject, iConfiguracao)
  private
    FDriverID : string;
    FDatabase : string;
    FUserName : String;
    FPassword : String;
    FPort : string;
    FServer : String;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iConfiguracao;
    function DriverID(aValue : String) : iConfiguracao; overload;
    function DriverID : String; overload;
    function Database(aValue : String) : iConfiguracao; overload;
    function Database : String; overload;
    function UserName(aValue : String) : iConfiguracao; overload;
    function UserName : String; overload;
    function Password(aValue : String) : iConfiguracao; overload;
    function Password : String; overload;
    function Port(aValue : String) : iConfiguracao; overload;
    function Port : String; overload;
    function Server(aValue : String) : iConfiguracao; overload;
    function Server : String; overload;
  end;

implementation

{ TConfiguracao }

constructor TConfiguracao.Create;
begin

end;

function TConfiguracao.Database: String;
begin
  Result := FDatabase;
end;

function TConfiguracao.Database(aValue: String): iConfiguracao;
begin
  Result := Self;
  FDataBase := aValue;
end;

destructor TConfiguracao.Destroy;
begin

  inherited;
end;

function TConfiguracao.DriverID: String;
begin
  Result := FDriverID;
end;

function TConfiguracao.DriverID(aValue: String): iConfiguracao;
begin
  Result := Self;
  FDriverID := aValue;
end;

class function TConfiguracao.New : iConfiguracao;
begin
  Result := Self.Create;
end;

function TConfiguracao.Password: String;
begin
  Result := FPassword;
end;

function TConfiguracao.Password(aValue: String): iConfiguracao;
begin
  Result := Self;
  FPassword := aValue;
end;

function TConfiguracao.Port(aValue: String): iConfiguracao;
begin
  Result := Self;
  FPort := aValue;
end;

function TConfiguracao.Port: String;
begin
  Result := FPort;
end;

function TConfiguracao.Server(aValue: String): iConfiguracao;
begin
  Result := Self;
  FServer := aValue;
end;

function TConfiguracao.Server: String;
begin
  Result := FServer;
end;

function TConfiguracao.UserName(aValue: String): iConfiguracao;
begin
  Result := Self;
  FUserName := aValue;
end;

function TConfiguracao.UserName: String;
begin
  Result := FUserName;
end;

end.
