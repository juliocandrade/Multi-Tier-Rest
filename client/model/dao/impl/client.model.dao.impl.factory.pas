unit client.model.dao.impl.factory;

interface

uses
  client.model.dao.Interfaces,
  client.model.entity.pessoa;
type
  TDAOFactory = class(TInterfacedObject, iDAOFactory)
  private
  public
    class function New : iDAOFactory;
    function Pessoa(aParent : TModelPessoa) : IDAOPessoa;
  end;
implementation

uses
  client.model.dao.impl.pessoa;

{ TDAOFactory }

class function TDAOFactory.New : iDAOFactory;
begin
  Result := Self.Create;
end;

function TDAOFactory.Pessoa(aParent : TModelPessoa) : IDAOPessoa;
begin
  Result := TDAOPessoa.New(aParent);
end;

end.
