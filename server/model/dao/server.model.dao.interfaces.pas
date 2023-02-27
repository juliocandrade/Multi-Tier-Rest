unit server.model.dao.interfaces;

interface

uses
  server.model.entity.pessoa,
  server.model.entity.endereco,
  server.model.entity.endereco.integracao,
  System.Generics.Collections;
type
  iDAOGenericIterator<T> = interface
    ['{61625260-A81A-42FD-8C96-A985F189A63E}']
    function HasNext : boolean;
    function Next : T;
  end;

  iDAOPessoa = interface
    ['{1B2A6E29-0718-48A5-BBC5-61BD5CD04E34}']
    function ListarTodos : iDaoPessoa;
    function ListarPorID(ID : Int64) : iDAOPessoa;
    function Inserir : iDaoPessoa;
    function Excluir : iDaoPessoa;
    function Alterar : iDaoPessoa;
    function ListAsJSONArray : String;
    function EntityAsJSONObject : string;
    function IsEmpty : Boolean;
  end;

  iDAOPessoaLote = interface
    ['{4068650C-595F-4715-996F-E82CEFCE3430}']
    function Inserir : iDaoPessoaLote;
  end;

  iDAOEndereco = interface
    ['{A3BFA938-5529-4FDE-883C-2D9DFC5B2458}']
    function ListarNaoAtualizados : iDAOEndereco;
    function List : iDAOGenericIterator<TModelEndereco>;
  end;

  iDAOEnderecoIntegracao = interface
    ['{E5170CAD-75BF-44D4-9F74-56B626DE0973}']
    function Inserir : iDAOEnderecoIntegracao;
  end;

  iDAOFactory = interface
    ['{FB58FEB4-2A3B-433C-BEE6-79DBB164C19C}']
    function Pessoa(aPessoa : TModelPessoa) : iDAOPessoa;
    function PessoaLote(aList : TObjectList<TModelPessoa>) : iDAOPessoaLote;
    function Endereco(aEndereco : TModelEndereco) : iDAOEndereco;
    function EnderecoIntegracao(aEnderecoIntegracao : TModelEnderecoIntegracao) : iDAOEnderecoIntegracao;
  end;
implementation

end.
