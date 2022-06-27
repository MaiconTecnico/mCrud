unit mCrud.model.entity.cliente;

interface

uses
  SimpleAttributes;

type
  [Tabela('CLIENTE')]
  TCliente = class
  private
    FId: Integer;
    FNome: String;
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: String);
  public
    [Campo('ID'), PK, AutoInc]
    property Id : Integer read FId write SetId;
    [Campo('NOME')]
    property Nome : String read FNome write SetNome;
  end;

implementation

{ TCliente }

procedure TCliente.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TCliente.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
