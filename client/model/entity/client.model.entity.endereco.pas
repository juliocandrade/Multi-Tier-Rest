unit client.model.entity.endereco;

interface
type
  TModelEndereco = class
  private
    FCEP : string;

    function GetCEP: string;
    procedure SetCEP(const Value: string);
  public
    property CEP : string read GetCEP write SetCEP;
  end;
implementation
uses
  System.SysUtils;

{ TModelEndereco }

function TModelEndereco.GetCEP: string;
begin
  if FCEP.isEmpty then
    raise Exception.Create('CEP n�o informado');
  Result := FCEP;
end;

procedure TModelEndereco.SetCEP(const Value: string);
begin
  FCEP := Value;
end;

end.
