program client;

uses
  Vcl.Forms,
  client.view.principal in 'View\client.view.principal.pas' {frmPrincipal},
  client.model.principal in 'model\client.model.principal.pas' {dmPrincipal: TDataModule},
  client.view.Style in 'View\style\client.view.Style.pas',
  client.model.service.rest.interfaces in 'model\service\rest\client.model.service.rest.interfaces.pas',
  client.model.service.rest.impl.clientrest in 'model\service\rest\impl\client.model.service.rest.impl.clientrest.pas',
  client.model.service.rest.impl.clientrest.params in 'model\service\rest\impl\client.model.service.rest.impl.clientrest.params.pas',
  client.model.entity.pessoa in 'model\entity\client.model.entity.pessoa.pas',
  client.controller.dto.impl.pessoa in 'controller\dto\impl\client.controller.dto.impl.pessoa.pas',
  client.model.entity.endereco.integracao in 'model\entity\client.model.entity.endereco.integracao.pas',
  client.model.entity.endereco in 'model\entity\client.model.entity.endereco.pas',
  client.controller.dto.interfaces in 'controller\dto\client.controller.dto.interfaces.pas',
  client.controller.impl.factory in 'controller\impl\client.controller.impl.factory.pas',
  client.controller.interfaces in 'controller\client.controller.interfaces.pas',
  client.model.dao.Interfaces in 'model\dao\client.model.dao.Interfaces.pas',
  client.model.dao.impl.pessoa in 'model\dao\impl\client.model.dao.impl.pessoa.pas',
  client.model.services.impl.factory in 'model\service\impl\client.model.services.impl.factory.pas',
  client.model.service.interfaces in 'model\service\client.model.service.interfaces.pas',
  client.model.dao.impl.factory in 'model\dao\impl\client.model.dao.impl.factory.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
