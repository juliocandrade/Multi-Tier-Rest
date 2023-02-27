program server;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  server.routers.pessoas in 'routers\server.routers.pessoas.pas',
  server.model.resource.interfaces in 'model\resource\server.model.resource.interfaces.pas',
  server.model.resource.impl.configuracao in 'model\resource\impl\server.model.resource.impl.configuracao.pas',
  server.model.resource.impl.conexaofiredac in 'model\resource\impl\server.model.resource.impl.conexaofiredac.pas',
  server.model.entity.pessoa in 'model\entity\server.model.entity.pessoa.pas',
  server.model.resource.impl.queryfiredac in 'model\resource\impl\server.model.resource.impl.queryfiredac.pas',
  server.model.resource.impl.factory in 'model\resource\impl\server.model.resource.impl.factory.pas',
  server.model.entity.endereco.integracao in 'model\entity\server.model.entity.endereco.integracao.pas',
  server.model.entity.endereco in 'model\entity\server.model.entity.endereco.pas',
  server.model.dao.impl.pessoa in 'model\dao\impl\server.model.dao.impl.pessoa.pas',
  server.model.dao.interfaces in 'model\dao\server.model.dao.interfaces.pas',
  server.controller.dto.impl.pessoa in 'controller\dto\impl\server.controller.dto.impl.pessoa.pas',
  server.controller.dto.interfaces in 'controller\dto\server.controller.dto.interfaces.pas',
  server.controller.interfaces in 'controller\server.controller.interfaces.pas',
  server.controller.impl.controller in 'controller\impl\server.controller.impl.controller.pas',
  server.utils in 'utils\server.utils.pas',
  server.model.service.cep.impl.viacep in 'model\service\cep\impl\server.model.service.cep.impl.viacep.pas',
  server.model.dao.impl.endereco.integracao in 'model\dao\impl\server.model.dao.impl.endereco.integracao.pas',
  server.model.service.cep.interfaces in 'model\service\cep\server.model.service.cep.interfaces.pas',
  server.model.service.provider.impl.action in 'model\service\provider\impl\server.model.service.provider.impl.action.pas',
  server.model.service.provider.impl.core in 'model\service\provider\impl\server.model.service.provider.impl.core.pas',
  server.model.service.provider.impl.request in 'model\service\provider\impl\server.model.service.provider.impl.request.pas',
  server.model.service.provider.impl.response in 'model\service\provider\impl\server.model.service.provider.impl.response.pas',
  server.model.service.provider.impl.route.action in 'model\service\provider\impl\server.model.service.provider.impl.route.action.pas',
  server.model.service.provider.impl.routes in 'model\service\provider\impl\server.model.service.provider.impl.routes.pas',
  server.model.service.provider.interfaces in 'model\service\provider\server.model.service.provider.interfaces.pas',
  server.model.service.rest.interfaces in 'model\service\rest\server.model.service.rest.interfaces.pas',
  server.model.service.rest.impl.clientrest.params in 'model\service\rest\impl\server.model.service.rest.impl.clientrest.params.pas',
  server.model.service.rest.impl.clientrest in 'model\service\rest\impl\server.model.service.rest.impl.clientrest.pas',
  server.utils.thread.timer in 'utils\server.utils.thread.timer.pas',
  server.model.dao.impl.endereco in 'model\dao\impl\server.model.dao.impl.endereco.pas',
  server.model.dao.impl.generic.iterator in 'model\dao\impl\server.model.dao.impl.generic.iterator.pas',
  server.model.service.endereco.interfaces in 'model\service\endereco\server.model.service.endereco.interfaces.pas',
  server.model.service.endereco in 'model\service\endereco\impl\server.model.service.endereco.pas',
  server.model.service.interfaces in 'model\service\server.model.service.interfaces.pas',
  server.model.service.impl.factory in 'model\service\impl\server.model.service.impl.factory.pas',
  server.model.entity.consultacep in 'model\entity\server.model.entity.consultacep.pas',
  server.model.service.endereco.thread in 'model\service\endereco\impl\server.model.service.endereco.thread.pas',
  server.model.dao.impl.pessoa.lote in 'model\dao\impl\server.model.dao.impl.pessoa.lote.pas',
  server.controller.dto.impl.pessoa.lote in 'controller\dto\impl\server.controller.dto.impl.pessoa.lote.pas',
  server.model.dao.impl.factory in 'model\dao\impl\server.model.dao.impl.factory.pas',
  server.model.exceptions in 'model\exceptions\server.model.exceptions.pas';

begin
  ReportMemoryLeaksOnShutdown := True;
//  isConsole := true;
  try
    TResourceFactory
      .Configuracao
        .DriverID('PG')
        .Database('cadastropessoas')
        .UserName('postgres')
        .Password('1234')
        .Port('5432');
    TThreadAutalizaEnderecos.Interval(10000);
    TThreadAutalizaEnderecos.Start;
    TProvider.Listen(3000);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
