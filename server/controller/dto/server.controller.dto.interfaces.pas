unit server.controller.dto.interfaces;

interface

uses
  server.model.dao.interfaces, System.JSON;
type
  iPessoa = interface
    ['{AB6D2D3D-A617-4A8E-B356-A94433B084BB}']
    function Services : iDAOPessoa;
    function JsonStringToObject(Value : String) : iPessoa;
  end;

  iPessoaLote = interface
    ['{8399D981-9245-43AF-B1DD-3C97474FB1ED}']
    function Services : iDAOPessoaLote;
    function JsonArrayStringToList(Value : String) : iPessoaLote;
  end;
implementation

end.
