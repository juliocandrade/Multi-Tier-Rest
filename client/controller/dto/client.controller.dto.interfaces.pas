unit client.controller.dto.interfaces;

interface

uses
  client.model.entity.pessoa, client.model.dao.Interfaces;
type
  iPessoa = interface
    ['{C0BC0A6C-FA9F-44EA-B331-A35E63237C98}']
    function Entity : TModelPessoa;
    function Service : iDAOPessoa;
  end;
implementation

end.
