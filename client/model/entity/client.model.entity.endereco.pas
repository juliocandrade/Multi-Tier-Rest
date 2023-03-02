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
  Result := FCEP;
end;

procedure TModelEndereco.SetCEP(const Value: string);
begin
  if Value.isEmpty then
    raise Exception.Create('CEP não informado');
  FCEP := Value;
end;

end.
