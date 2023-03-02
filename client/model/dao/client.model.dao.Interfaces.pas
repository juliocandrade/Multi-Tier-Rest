unit client.model.dao.Interfaces;

interface

uses
  client.model.entity.pessoa,
  System.Generics.Collections;
type
  iDAOPessoa = interface
    ['{E4655AA5-C4B1-4B5B-B466-B5D538D81A81}']
    function Inserir : iDAOPessoa;
    function Excluir : iDaoPessoa;
    function Alterar : iDaoPessoa;
    function This : TModelPessoa;
  end;
  iDAOPessoaLote = interface
    ['{8C6EBDCA-A79D-48F6-B00A-E2966F61FCF5}']
    function Inserir : iDAOPessoaLote;
  end;

  iDAOFactory = interface
    ['{27E33AFD-BD5D-4AD7-87AC-98DCDFE857B9}']
    function Pessoa(aParent : TModelPessoa) : IDAOPessoa;
    function PessoaLote(aList : TObjectDictionary<integer,TModelPessoa>) : iDAOPessoaLote;
  end;
implementation

end.
