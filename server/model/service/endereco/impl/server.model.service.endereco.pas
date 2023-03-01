unit server.model.service.endereco;

interface

uses
  server.model.service.endereco.interfaces,
  server.model.dao.interfaces,
  server.model.entity.endereco.integracao;
type
  TServiceEndereco = class(TInterfacedObject, iServiceEndereco)
  private
    FDAOEndereco : IDAOEndereco;

  public
    constructor Create;
    class function New : iServiceEndereco;
    procedure AtualizarEnderecos;

  end;
implementation

uses
  server.model.entity.endereco,
  server.model.dao.impl.endereco,
  server.model.service.impl.factory,
  server.model.entity.consultacep,
  server.model.dao.impl.factory;

{ TServiceEndereco }

procedure TServiceEndereco.AtualizarEnderecos;
var
  LEndereco : TModelEndereco;
  LConsultaCEP : TModelConsultaCEP;
  LEnderecoIntegracao : TModelEnderecoIntegracao;
begin
  FDAOEndereco.ListarNaoAtualizados;
  while FDAOEndereco.List.HasNext do
  begin
    LEndereco := FDAOEndereco.List.Next;
    try
      TServiceFactory.New.CEP.Code(LEndereco.CEP).Execute(LConsultaCEP).Return;
      if not LConsultaCEp.Erro then
      begin
        LenderecoIntegracao := TModelEnderecoIntegracao.Create;
        try
         LenderecoIntegracao.IDEndereco := LEndereco.IDEndereco;
         LenderecoIntegracao.UF := LConsultaCEP.Uf;
         LenderecoIntegracao.Cidade := LConsultaCEP.Localidade;
         LenderecoIntegracao.Bairro := LConsultaCEP.Bairro;
         LenderecoIntegracao.Logradouro := LConsultaCEP.Logradouro;
         LenderecoIntegracao.Complemento := LConsultaCEP.Complemento;
         TDAOFactory.New.EnderecoIntegracao(LEnderecoIntegracao).Alterar;
        finally
          LEnderecoIntegracao.Free;
        end;
      end;
    finally
      if Assigned(LConsultaCEP) then
        LConsultaCEP.Free;
    end;
  end;

end;

constructor TServiceEndereco.Create;
begin
  FDAOEndereco := TDAOFactory.New.Endereco(nil);
end;

class function TServiceEndereco.New: iServiceEndereco;
begin
  Result := Self.Create;
end;

end.
