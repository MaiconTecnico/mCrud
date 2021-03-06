unit mCrud.controller.dto.telefone;

interface

uses
  mCrud.model.entity.telefone,
  mCrud.controller.dto.interfaces,
  mCrud.services.generic;

type
  TTelefoneDTO = class(TInterfacedObject, iTelefoneDTO)
    private
      FEntity : TTelefone;
      FService : iService<TTelefone>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iTelefoneDTO;
      function IdCliente(Value : Integer) : iTelefoneDTO; overload;
      function IdCliente : Integer; overload;
      function Telefone(Value : String) : iTelefoneDTO; overload;
      function Telefone : String; overload;
      function Tipo(Value : String) : iTelefoneDTO; overload;
      function Tipo : String; overload;
      function Contato(Value : String) : iTelefoneDTO; overload;
      function Contato : String; overload;
      function IndPrincipal(Value : String) : iTelefoneDTO; overload;
      function IndPrincipal : String; overload;
      function Build : iService<TTelefone>;
  end;

implementation

{ TEnderecoDTO }

function TTelefoneDTO.Build: iService<TTelefone>;
begin
  Result := FService;
end;

function TTelefoneDTO.Contato: String;
begin
  Result := FEntity.Contato;
end;

function TTelefoneDTO.Contato(Value: String): iTelefoneDTO;
begin
  Result := Self;
  FEntity.Contato := Value;
end;

constructor TTelefoneDTO.Create;
begin
  FEntity := TTelefone.Create;
  FService := TService<TTelefone>.New(FEntity);
end;

destructor TTelefoneDTO.Destroy;
begin
  FEntity.Free;
  inherited;
end;

function TTelefoneDTO.IdCliente: Integer;
begin
  Result := FEntity.IdCliente;
end;

function TTelefoneDTO.IdCliente(Value: Integer): iTelefoneDTO;
begin
  Result := Self;
  FEntity.IdCliente := Value;
end;

function TTelefoneDTO.IndPrincipal: String;
begin
  Result := FEntity.IndPrincipal;
end;

function TTelefoneDTO.IndPrincipal(Value: String): iTelefoneDTO;
begin
  Result := Self;
  FEntity.IndPrincipal := Value;
end;

class function TTelefoneDTO.New: iTelefoneDTO;
begin
  Result := Self.Create;
end;

function TTelefoneDTO.Telefone: String;
begin
  Result := FEntity.Telefone;
end;

function TTelefoneDTO.Telefone(Value: String): iTelefoneDTO;
begin
  Result := Self;
  FEntity.Telefone := Value;
end;

function TTelefoneDTO.Tipo(Value: String): iTelefoneDTO;
begin
  Result := Self;
  FEntity.Tipo := Value;
end;

function TTelefoneDTO.Tipo: String;
begin
  Result := FEntity.Tipo;
end;

end.
