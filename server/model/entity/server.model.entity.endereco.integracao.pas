unit server.model.entity.endereco.integracao;

interface
type
  TModelEnderecoIntegracao = class
  private
    FIDEndereco : int64;
    FUF : String;
    FCidade : string;
    FBairro : String;
    FLogradouro : String;
    FComplemento : String;
    function GetBairro: String;
    function GetCidade: string;
    function GetComplemento: String;
    function GetIDEndereco: int64;
    function GetLogradouro: String;
    function GetUF: String;
    procedure SetBairro(const Value: String);
    procedure SetCidade(const Value: string);
    procedure SetComplemento(const Value: String);
    procedure SetIDEndereco(const Value: int64);
    procedure SetLogradouro(const Value: String);
    procedure SetUF(const Value: String);
  public
    property IDEndereco : int64 read GetIDEndereco write SetIDEndereco;
    property UF : String read GetUF write SetUF;
    property Cidade : string read GetCidade write SetCidade;
    property Bairro : String read GetBairro write SetBairro;
    property Logradouro : String read GetLogradouro write SetLogradouro;
    property Complemento : String read GetComplemento write SetComplemento;

  end;

implementation

{ TModelEnderecoIntegracao }

function TModelEnderecoIntegracao.GetBairro: String;
begin
  Result := FBairro;
end;

function TModelEnderecoIntegracao.GetCidade: string;
begin
  Result := FCidade;
end;

function TModelEnderecoIntegracao.GetComplemento: String;
begin
  Result := FComplemento;
end;

function TModelEnderecoIntegracao.GetIDEndereco: int64;
begin
  Result := FIDEndereco;
end;

function TModelEnderecoIntegracao.GetLogradouro: String;
begin
  Result := FLogradouro;
end;

function TModelEnderecoIntegracao.GetUF: String;
begin
  Result := FUF;
end;

procedure TModelEnderecoIntegracao.SetBairro(const Value: String);
begin
  FBairro := Value;
end;

procedure TModelEnderecoIntegracao.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TModelEnderecoIntegracao.SetComplemento(const Value: String);
begin
  FComplemento := Value;
end;

procedure TModelEnderecoIntegracao.SetIDEndereco(const Value: int64);
begin
  FIDEndereco := Value;
end;

procedure TModelEnderecoIntegracao.SetLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TModelEnderecoIntegracao.SetUF(const Value: String);
begin
  FUF := Value;
end;

end.
