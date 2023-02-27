unit server.model.resource.interfaces;

interface

uses
  Data.DB,
  System.Classes;

type
  iConexao = interface
    ['{DB069014-7641-47C0-903C-19C1F70E37ED}']
    function Connect : TCustomConnection;
    procedure Disconnect;
    procedure StartTransaction;
    procedure Commit;
    procedure Rollback;

  end;

  iConfiguracao = interface
    ['{CA15298D-1C36-47C1-BBBA-7D7410D272AA}']
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

  iQuery = interface
    ['{81CDFB8B-7C76-4FC6-87A7-D9022BD49AFC}']
    function SQL : TStrings;
    function Params : TParams;
    function ExecSQL : iQuery;
    function ExecSQLArray(aParams : TArray<TParams>) : iQuery;
    function DataSet : TDataSet;
    function Open(aSQL : String) : iQuery; overload;
    function Open : iQuery; overload;
  end;

  iResourceFactory = interface
    ['{6B7D5ABE-F5B7-4F32-BB3F-33409CF41B09}']
    function Query : iQuery;
    function Conexao : iConexao;
  end;

implementation

end.
