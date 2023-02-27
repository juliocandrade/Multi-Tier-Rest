unit client.model.pessoa;

interface

uses
  System.SysUtils, System.Classes, REST.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TdmPessoa = class(TDataModule)
    RestClientPessoa: TRESTClient;
    RestRequestPessoa: TRESTRequest;
    RestResponsePessoa: TRESTResponse;
    RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
    FDMemTablePessoa: TFDMemTable;
    FDMemTablePessoaid: TWideStringField;
    FDMemTablePessoanatureza: TWideStringField;
    FDMemTablePessoadataregistro: TWideStringField;
    FDMemTablePessoadocumento: TWideStringField;
    FDMemTablePessoaprimeironome: TWideStringField;
    FDMemTablePessoasegundonome: TWideStringField;
    FDMemTablePessoaendereco: TWideStringField;
    FDMemTablePessoaenderecoidendereco: TWideStringField;
    FDMemTablePessoaenderecoidpessoa: TWideStringField;
    FDMemTablePessoaenderecocep: TWideStringField;
    FDMemTablePessoaenderecointegracao: TWideStringField;
    FDMemTablePessoaenderecointegracaoidendereco: TWideStringField;
    FDMemTablePessoaenderecointegracaouf: TWideStringField;
    FDMemTablePessoaenderecointegracaocidade: TWideStringField;
    FDMemTablePessoaenderecointegracaobairro: TWideStringField;
    FDMemTablePessoaenderecointegracaologradouro: TWideStringField;
    FDMemTablePessoaenderecointegracaocomplemento: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pesquisar;
  end;

var
  dmPessoa: TdmPessoa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmPessoa }

procedure TdmPessoa.Pesquisar;
var
  x : String;
begin
  RESTRequestPessoa.Execute;
  X:= RestResponsePessoa.Content;
end;

end.
