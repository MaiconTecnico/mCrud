unit mCrud.view.clientes;

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
  mCrud.util.form,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Buttons,
  Vcl.WinXPanels,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  mCrud.Controller,
  mCrud.controller.interfaces,
  mCrud.view.consultaclientes;

type
  TFrmClientes = class(TFrmBase)
    Panel1: TPanel;
    PToolBar: TPanel;
    LCaption: TLabel;
    CPClient: TCardPanel;
    CardVisualizar: TCard;
    PBottom: TPanel;
    PFiltro: TPanel;
    CardCadastro: TCard;
    DBGrid1: TDBGrid;
    dsCliente: TDataSource;
    LSelecao: TLabel;
    EdCodigo: TEdit;
    SBCancelar: TSpeedButton;
    SPSelecionar: TSpeedButton;
    SBPesquisar: TSpeedButton;
    Label2: TLabel;
    CBSelecao: TComboBox;
    lCodigo: TLabel;
    EdNome: TEdit;
    lNome: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SPSelecionarClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure SBPesquisarClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FController : iController;
    FCampo:String;
  public
    { Public declarations }
  end;

var
  FrmClientes: TFrmClientes;

implementation

{$R *.dfm}

procedure TFrmClientes.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 32 then
  begin
    dsCliente.DataSet.Edit;
    if dsCliente.DataSet.FieldByName('SEL').AsString.Equals('S') then
    begin
      dsCliente.DataSet.FieldByName('SEL').AsString := 'N';
    end
    else
    begin
      dsCliente.DataSet.FieldByName('SEL').AsString := 'S';
    end;
    dsCliente.DataSet.Post;
  end;
end;

procedure TFrmClientes.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  FCampo      := Column.FieldName;
end;

procedure TFrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmClientes := Nil;
  Action      := caFree;
end;

procedure TFrmClientes.FormCreate(Sender: TObject);
begin
  inherited;
  FController       := TController.New;
  dsCliente.DataSet := FController.Cliente.Build.ListarPorDTO;
end;

procedure TFrmClientes.SBCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmClientes.SBPesquisarClick(Sender: TObject);
var
  lFilter:String;
  procedure AddAnd;
  begin
    if not lFilter.IsEmpty then
    begin
      lFilter := lFilter + ' AND ';
    end;
  end;
begin
  inherited;
  FController.Cliente.Build.Listar;

  dsCliente.DataSet.Filtered := False;
  dsCliente.DataSet.Filter   := EmptyStr;
  try
    lFilter := EmptyStr;

    case CBSelecao.ItemIndex of
      0: lFilter := 'SEL = ''S'' ';
      1: lFilter := 'SEL = ''N'' ';
    end;

    if not String(EdCodigo.text).Trim.IsEmpty then
    begin
      AddAnd;
      lFilter := lFilter + ' ID = '+EdCodigo.Text;
    end;

    if not String(EdNome.text).Trim.IsEmpty then
    begin
      AddAnd;
      lFilter := lFilter + ' NOME LIKE '+QuotedStr(EdCodigo.Text+'%');
    end;

    dsCliente.DataSet.Filter   := lFilter;
  finally
    if not String(dsCliente.DataSet.Filter).Trim.IsEmpty then
    begin
      dsCliente.DataSet.Filtered := True;
    end;
  end;
end;

procedure TFrmClientes.SPSelecionarClick(Sender: TObject);
var
  aClient : Integer;
  aID:String;
  procedure CarregaIds;
  begin
    aID := '';
    dsCliente.DataSet.First;
    while not dsCliente.DataSet.Eof do
    begin
      if aID.Trim.IsEmpty then
      begin
        aID := dsCliente.DataSet.FieldByName('ID').AsString;
      end else
      begin
        aID := aID + ','+ dsCliente.DataSet.FieldByName('ID').AsString;
      end;
      dsCliente.DataSet.Next;
    end;
  end;
begin
  inherited;
  aClient := dsCliente.DataSet.FieldByName('ID').AsInteger;
  try
    dsCliente.DataSet.Filter   := 'SEL = ''S'' ';
    dsCliente.DataSet.Filtered := True;

    if dsCliente.DataSet.IsEmpty then
    begin
      ShowMessage('Nenhum Registro encontrado. Verifique!');
      Abort;
    end;

    FrmConsultaClientes := TFrmConsultaClientes.Create(Self);
    try
      CarregaIds;
      FrmConsultaClientes.Consultar(aID);
      FrmConsultaClientes.ShowModal;
    finally
      FreeAndNil(FrmConsultaClientes);
    end;
  finally
    SBPesquisar.Click;
    dsCliente.DataSet.Locate('ID', aClient, []);
  end;
end;

end.
