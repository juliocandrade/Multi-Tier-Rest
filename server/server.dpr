program server;
{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  server.routers.pessoas in 'routers\server.routers.pessoas.pas',
  server.model.resource.interfaces in 'model\resource\server.model.resource.interfaces.pas',
  server.model.entity.pessoa in 'model\entity\server.model.entity.pessoa.pas',
  server.model.entity.endereco.integracao in 'model\entity\server.model.entity.endereco.integracao.pas',
  server.model.entity.endereco in 'model\entity\server.model.entity.endereco.pas',
  server.model.dao.interfaces in 'model\dao\server.model.dao.interfaces.pas',
  server.model.entity.consultacep in 'model\entity\server.model.entity.consultacep.pas',
  server.model.exceptions in 'model\exceptions\server.model.exceptions.pas',
  server.model.resource.factory in 'model\resource\server.model.resource.factory.pas',
  server.model.resource.conexao.conexaofiredac in 'model\resource\conexao\server.model.resource.conexao.conexaofiredac.pas',
  server.model.resource.conexao.databaseconfig in 'model\resource\conexao\server.model.resource.conexao.databaseconfig.pas',
  server.model.resource.conexao.queryfiredac in 'model\resource\conexao\server.model.resource.conexao.queryfiredac.pas',
  server.model.resource.config in 'model\resource\server.model.resource.config.pas',
  server.model.resource.rest.params in 'model\resource\rest\server.model.resource.rest.params.pas',
  server.model.resource.rest.delphirestclient in 'model\resource\rest\server.model.resource.rest.delphirestclient.pas',
  server.utils.thread.timer in 'utils\server.utils.thread.timer.pas',
  server.utils in 'utils\server.utils.pas',
  server.model.service.cep.viacep in 'model\service\server.model.service.cep.viacep.pas',
  server.model.service.factory in 'model\service\server.model.service.factory.pas',
  server.model.service.endereco in 'model\service\server.model.service.endereco.pas',
  server.model.service.endereco.thread in 'model\service\server.model.service.endereco.thread.pas',
  server.provider.action in 'provider\server.provider.action.pas',
  server.provider.core in 'provider\server.provider.core.pas',
  server.provider.request in 'provider\server.provider.request.pas',
  server.provider.response in 'provider\server.provider.response.pas',
  server.provider.route.action in 'provider\server.provider.route.action.pas',
  server.provider.routes in 'provider\server.provider.routes.pas',
  server.provider.interfaces in 'provider\server.provider.interfaces.pas',
  server.model.dao.endereco.integracao in 'model\dao\server.model.dao.endereco.integracao.pas',
  server.model.dao.endereco in 'model\dao\server.model.dao.endereco.pas',
  server.model.dao.factory in 'model\dao\server.model.dao.factory.pas',
  server.model.dao.pessoa.lote in 'model\dao\server.model.dao.pessoa.lote.pas', server.model.dao.pessoa in 'model\dao\server.model.dao.pessoa.pas',
  server.utils.generic.iterator in 'utils\server.utils.generic.iterator.pas',
  server.controller.pessoa in 'controller\server.controller.pessoa.pas',
  server.controller.factory in 'controller\server.controller.factory.pas',
  server.controller.interfaces in 'controller\server.controller.interfaces.pas',
  server.model.service.interfaces in 'model\service\server.model.service.interfaces.pas',
  server.model.service.pessoa in 'model\service\server.model.service.pessoa.pas';

begin
  ReportMemoryLeaksOnShutdown := True;
//   isConsole := true;
  try
    TResourceConfig.Database.DriverID('PG').Database('cadastropessoas')
      .UserName('postgres').Password('1234').Port('5432');
    TThreadAutalizaEnderecos.Interval(10000);
    TThreadAutalizaEnderecos.Start;
    TProvider.Listen(3000);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
