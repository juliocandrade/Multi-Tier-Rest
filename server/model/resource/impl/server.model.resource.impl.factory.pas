unit server.model.resource.impl.factory;

interface
uses
  server.model.resource.interfaces;

type
  TResourceFactory = class
  private
    class var FConfiguracao : iConfiguracao;

  public
    class constructor Create;
    class function Configuracao : iConfiguracao;
    class function Query(aConexao : iConexao) : iQuery;
    class function Conexao : iConexao;

  end;
implementation

uses
  server.model.resource.impl.configuracao,
  server.model.resource.impl.conexaofiredac,
  server.model.resource.impl.queryfiredac;

{ TResourceFactory }

class function TResourceFactory.Conexao: iConexao;
begin
  Result := TConexaoFiredac.New(FConfiguracao);
end;

class function TResourceFactory.Configuracao: iConfiguracao;
begin
  Result := FConfiguracao;
end;

class constructor TResourceFactory.Create;
begin
  FConfiguracao := TConfiguracao.New;
end;

class function TResourceFactory.Query(aConexao : iConexao): iQuery;
begin
  Result := TQueryFiredac.New(aConexao);
end;

end.
