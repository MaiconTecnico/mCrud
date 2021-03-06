unit mCrud.model.entity.telefone;

interface

uses
  SimpleAttributes;

type
  [Tabela('CLIENTE_TELEFONE')]
  TTelefone = class
  private
    FTelefone: String;
    FTipo: String;
    FContato: String;
    FIdCliente: Integer;
    FId: Integer;
    FIndPrincipal: String;
    procedure SetId(const Value: Integer);
    procedure SetIdCliente(const Value: Integer);
    procedure SetIndPrincipal(const Value: String);
    procedure SetTelefone(const Value: String);
    procedure SetTipo(const Value: String);
    procedure SetContato(const Value: String);

    public
    [Campo('ID'), PK, AutoInc]
    property Id : Integer read FId write SetId;
    [Campo('ID_CLIENTE'), FK, NotNull]
    property IdCliente : Integer read FIdCliente write SetIdCliente;
    [Campo('TELEFONE')]
    property Telefone : String read FTelefone write SetTelefone;
    [Campo('TIPO')]
    property Tipo : String read FTipo write SetTipo;
    [Campo('CONTATO')]
    property Contato : String read FContato write SetContato;
    [Campo('IND_PRINCIPAL')]
    property IndPrincipal : String read FIndPrincipal write SetIndPrincipal;
  end;

implementation

{ TTelefone }

procedure TTelefone.SetContato(const Value: String);
begin
  FContato := Value;
end;

procedure TTelefone.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TTelefone.SetIdCliente(const Value: Integer);
begin
  FIdCliente := Value;
end;

procedure TTelefone.SetIndPrincipal(const Value: String);
begin
  FIndPrincipal := Value;
end;

procedure TTelefone.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

procedure TTelefone.SetTipo(const Value: String);
begin
  FTipo := Value;
end;

End.
