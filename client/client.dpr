program client;

uses
  Vcl.Forms,
  client.view.principal in 'view\client.view.principal.pas' {frmPrincipal},
  client.model.principal in 'model\client.model.principal.pas' {dmPrincipal: TDataModule},
  client.view.pessoas in 'View\client.view.pessoas.pas' {frmPessoas},
  client.view.pessoas.lote in 'view\client.view.pessoas.lote.pas' {frmPessoasLote},
  client.view.Style in 'View\style\client.view.Style.pas',
  client.model.entity.pessoa in 'model\entity\client.model.entity.pessoa.pas',
  client.model.entity.endereco.integracao in 'model\entity\client.model.entity.endereco.integracao.pas',
  client.model.entity.endereco in 'model\entity\client.model.entity.endereco.pas',
  client.model.resource.factory in 'model\resource\client.model.resource.factory.pas',
  client.model.resource.interfaces in 'model\resource\client.model.resource.interfaces.pas',
  client.model.resource.rest.delphirestclient in 'model\resource\client.model.resource.rest.delphirestclient.pas',
  client.model.resource.rest.params in 'model\resource\client.model.resource.rest.params.pas',
  client.model.dao.factory in 'model\dao\client.model.dao.factory.pas',
  client.model.dao.interfaces in 'model\dao\client.model.dao.interfaces.pas',
  client.model.dao.pessoa.lote in 'model\dao\client.model.dao.pessoa.lote.pas',
  client.model.dao.pessoa in 'model\dao\client.model.dao.pessoa.pas',
  client.model.service.pessoa in 'model\service\client.model.service.pessoa.pas',
  client.model.service.interfaces in 'model\service\client.model.service.interfaces.pas',
  client.controller.pessoa.dto in 'controller\client.controller.pessoa.dto.pas',
  client.controller.pessoa in 'controller\client.controller.pessoa.pas',
  client.controller.factory in 'controller\client.controller.factory.pas',
  client.controller.interfaces in 'controller\client.controller.interfaces.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmPessoas, frmPessoas);
  Application.CreateForm(TfrmPessoasLote, frmPessoasLote);
  Application.Run;
end.
