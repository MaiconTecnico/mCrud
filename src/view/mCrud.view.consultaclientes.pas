unit mCrud.view.consultaclientes;

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
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  mCrud.controller.interfaces,
  mCrud.Controller,
  Vcl.Buttons, mCrud.view.cadastroclientes, mCrud.services.fastreports;

type
  TFrmConsultaClientes = class(TFrmBase)
    Panel1: TPanel;
    PToolBar: TPanel;
    LCaption: TLabel;
    PButton: TPanel;
    SBIncluir: TSpeedButton;
    SBExcel: TSpeedButton;
    SBDeletar: TSpeedButton;
    SBPesquisar: TSpeedButton;
    DBGrid1: TDBGrid;
    dsConsulta: TDataSource;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBPesquisarClick(Sender: TObject);
    procedure SBExcelClick(Sender: TObject);
    procedure SBDeletarClick(Sender: TObject);
  private
    { Private declarations }
    FController : iController;
    FaID:String;
    function SQLConsulta:String;
  public
    { Public declarations }
    procedure Consultar(Aid:String);
  end;

var
  FrmConsultaClientes: TFrmConsultaClientes;

implementation

{$R *.dfm}

{ TFrmConsultaClientes }

procedure TFrmConsultaClientes.Consultar(Aid:String);
var
  aSQL:String;
begin
  if Aid <> '' then
  begin
    FaID := Aid;
  end;

  aSQL := ' WHERE C.ID IN ('+FaID+')';

  dsConsulta.DataSet := FController.Cliente.Build.AddSQL(SQLConsulta + aSQL);
end;

procedure TFrmConsultaClientes.FormCreate(Sender: TObject);
begin
  inherited;
  FController  := TController.New;
end;

procedure TFrmConsultaClientes.SBDeletarClick(Sender: TObject);
begin
  inherited;
  DMFastReports := TDMFastReports.Create(Self);
  try
    DMFastReports.frxDBDataset1.DataSource.DataSet := dsConsulta.DataSet;
    DMFastReports.frxReport1.ShowReport;
  finally
    FreeAndNil(DMFastReports);
  end;
end;

procedure TFrmConsultaClientes.SBExcelClick(Sender: TObject);
var
  aExcel:TStringList;
  aColunas,
  aDelimited:String;
  I:Integer;
begin
  inherited;

  aDelimited := '|';
  aColunas   := '';
  aExcel := TStringList.Create;
  try
    for I := 0 to dsConsulta.DataSet.FieldCount-1 do
    begin
      aColunas := aColunas + dsConsulta.DataSet.Fields[I].FieldName + aDelimited;
    end;

    aExcel.Add(aColunas);

    aColunas := '';
    dsConsulta.DataSet.First;
    while not dsConsulta.DataSet.Eof do
    begin
      for I := 0 to dsConsulta.DataSet.FieldCount-1 do
      begin
        aColunas := aColunas + dsConsulta.DataSet.Fields[I].AsString + aDelimited;
      end;
      aExcel.Add(aColunas);
      aColunas := '';
      dsConsulta.DataSet.Next;
    end;

    if SaveDialog1.Execute then
    begin
      aExcel.SaveToFile(SaveDialog1.FileName);
    end;
  finally
    aExcel.Free;
  end;
end;

procedure TFrmConsultaClientes.SBIncluirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmConsultaClientes.SBPesquisarClick(Sender: TObject);
begin
  inherited;
  FrmCadastro := TFrmCadastro.Create(Self, dsConsulta, True);
  try
    FrmCadastro.ShowModal;
  finally
    Consultar('');
    FreeAndNil(FrmCadastro);
  end;
end;

function TFrmConsultaClientes.SQLConsulta: String;
begin
  Result := 'SELECT ' +
            ' C.ID, ' +
            ' C.NOME, ' +
            ' CE.CEP, ' +
            ' CE.LOGRADOURO, ' +
            ' CE.BAIRRO, ' +
            ' CE.CIDADE, ' +
            ' CE.ESTADO, ' +
            ' CT.TELEFONE, ' +
            ' CT.CONTATO ' +
            ' FROM CLIENTE C ' +
            ' LEFT JOIN CLIENTE_ENDERECO CE ' +
            '   ON CE.ID_CLIENTE = C.ID ' +
            '  AND CE.IND_PRINCIPAL = ''S'' ' +
            ' LEFT JOIN CLIENTE_TELEFONE CT ' +
            '   ON CT.ID_CLIENTE = C.ID ' +
            '  AND CT.IND_PRINCIPAL = ''S'' ';
end;

end.
