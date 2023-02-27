unit server.controller.impl.controller;

interface

uses
  server.controller.interfaces,
  server.controller.dto.interfaces;
type
  TController = class(TInterfacedObject, iController)
  private
    FPessoa : iPessoa;
    FPessoaLote : iPessoaLote;
  public
    class function New : iController;
    function Pessoa : iPessoa;
    function PessoaLote : iPessoaLote;
  end;
implementation

uses
  server.controller.dto.impl.pessoa, server.controller.dto.impl.pessoa.lote;

{ TController }

class function TController.New: iController;
begin
  Result := Self.Create;
end;

function TController.Pessoa: iPessoa;
begin
  if not Assigned(FPessoa) then
    FPessoa := TPessoaDTO.New;
  Result := FPessoa;
end;

function TController.PessoaLote: iPessoaLote;
begin
  if not Assigned(FPessoaLote) then
    FPessoaLote := TPessoaLoteDTO.New;
  Result := FPessoaLote;

end;

end.
