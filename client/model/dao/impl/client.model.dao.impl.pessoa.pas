unit client.model.dao.impl.pessoa;

interface

uses
  client.model.entity.pessoa;
type
  TDAOPessoa = class(TInterfacedObject, iDAOPessoa)
  private
    FParent : TModelPessoa;
  public
    constructor Create(aParent : TModelPessoa);
    class function New(aParent : TModelPessoa) : iDAOPessoa;
    function Inserir : iDAOPessoa;
    function Excluir : iDaoPessoa;
    function Alterar : iDaoPessoa;
  end;
implementation

{ TDAOPessoa }

function TDAOPessoa.Alterar: iDaoPessoa;
begin

end;

constructor TDAOPessoa.Create(aParent: TModelPessoa);
begin

end;

function TDAOPessoa.Excluir: iDaoPessoa;
begin

end;

function TDAOPessoa.Inserir: iDAOPessoa;
begin

end;

class function TDAOPessoa.New(aParent: TModelPessoa): iDAOPessoa;
begin

end;

end.
