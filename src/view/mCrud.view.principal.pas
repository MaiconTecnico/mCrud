unit mCrud.view.principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Menus, mCrud.view.clientes, mCrud.view.cadastroclientes;

type
  TFrmPrincipal = class(TForm)
    pButton: TPanel;
    LName: TLabel;
    MMPrincipal: TMainMenu;
    MNCadastro: TMenuItem;
    MNClientes: TMenuItem;
    Cadastrar1: TMenuItem;
    Listar1: TMenuItem;
    procedure Listar1Click(Sender: TObject);
    procedure Cadastrar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.Cadastrar1Click(Sender: TObject);
begin
  FrmCadastro := TFrmCadastro.Create(Self, Nil, False);
  try
    FrmCadastro.ShowModal;
  finally
    FreeAndNil(FrmCadastro);
  end;
end;

procedure TFrmPrincipal.Listar1Click(Sender: TObject);
begin
  if not Assigned(FrmClientes) then
  begin
    FrmClientes := TFrmClientes.Create(Self);
  end;
  FrmClientes.Show;
end;

end.
