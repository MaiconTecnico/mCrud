unit mCrud.view.cadastroclientes;

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
  mCrud.controller.interfaces,
  mCrud.Controller,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.DBCtrls,
  Datasnap.DBClient, Vcl.Mask;

type
  TFrmCadastro = class(TFrmBase)
    PCadastro: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    DSCadastro: TDataSource;
    ECodigo: TEdit;
    ENome: TEdit;
    SBIncluir: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBConfirmar: TSpeedButton;
    SBCancelar: TSpeedButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox2: TGroupBox;
    DSEndereco: TDataSource;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DSTelefone: TDataSource;
    CDSEndereco: TClientDataSet;
    CDSTelefone: TClientDataSet;
    ECEP: TDBEdit;
    EEndereco: TDBEdit;
    EBairro: TDBEdit;
    ECidade: TDBEdit;
    EEstado: TDBEdit;
    CBEndPrincipal: TDBCheckBox;
    BSalvar: TBitBtn;
    BExcluir: TBitBtn;
    BEditar: TBitBtn;
    BIncluir: TBitBtn;
    BNext: TBitBtn;
    BPrior: TBitBtn;
    BCancel: TBitBtn;
    ETelefone: TDBEdit;
    EContato: TDBEdit;
    CBTelefone: TDBCheckBox;
    CBTipo: TDBComboBox;
    BTPrior: TBitBtn;
    BTNext: TBitBtn;
    BTIncluir: TBitBtn;
    BTEditar: TBitBtn;
    BTExcluir: TBitBtn;
    BTSalvar: TBitBtn;
    BTCancel: TBitBtn;
    SBVoltar: TSpeedButton;
    procedure DSEnderecoDataChange(Sender: TObject; Field: TField);
    procedure BPriorClick(Sender: TObject);
    procedure BNextClick(Sender: TObject);
    procedure BIncluirClick(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
    procedure BExcluirClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure BCancelClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure CDSTelefoneBeforePost(DataSet: TDataSet);
    procedure CDSTelefoneAfterInsert(DataSet: TDataSet);
    procedure BTPriorClick(Sender: TObject);
    procedure BTNextClick(Sender: TObject);
    procedure BTIncluirClick(Sender: TObject);
    procedure CDSEnderecoAfterInsert(DataSet: TDataSet);
    procedure CDSEnderecoBeforePost(DataSet: TDataSet);
    procedure BTEditarClick(Sender: TObject);
    procedure BTExcluirClick(Sender: TObject);
    procedure BTSalvarClick(Sender: TObject);
    procedure BTCancelClick(Sender: TObject);
    procedure DSTelefoneDataChange(Sender: TObject; Field: TField);
    procedure SBVoltarClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure CDSEnderecoNewRecord(DataSet: TDataSet);
    procedure CDSTelefoneNewRecord(DataSet: TDataSet);
    procedure SBIncluirClick(Sender: TObject);
  private
    FEditar : Boolean;
    FController : iController;
    procedure IncluirEndereco;
    procedure IncluirTelefone;
    procedure ControleBotao;
  public
    constructor Create(AOwner: TComponent; aDataSource: TDataSource; aEditar: Boolean = true);
  end;

var
  FrmCadastro: TFrmCadastro;

implementation

{$R *.dfm}

{ TFrmCadastro }

procedure TFrmCadastro.BCancelClick(Sender: TObject);
begin
  inherited;
  CDSEndereco.Cancel;
end;

procedure TFrmCadastro.BEditarClick(Sender: TObject);
begin
  inherited;
  ECEP.SetFocus;
  CDSEndereco.Edit;
end;

procedure TFrmCadastro.BExcluirClick(Sender: TObject);
begin
  inherited;
  CDSEndereco.Delete;
end;

procedure TFrmCadastro.BIncluirClick(Sender: TObject);
begin
  inherited;
  ECEP.SetFocus;
  CDSEndereco.Insert;
end;

procedure TFrmCadastro.BNextClick(Sender: TObject);
begin
  inherited;
  CDSEndereco.Next;
end;

procedure TFrmCadastro.BPriorClick(Sender: TObject);
begin
  inherited;
  CDSEndereco.Prior;
end;

procedure TFrmCadastro.BSalvarClick(Sender: TObject);
begin
  inherited;
  CDSEndereco.Post;
end;

procedure TFrmCadastro.BTCancelClick(Sender: TObject);
begin
  inherited;
  CDSEndereco.Cancel;
end;

procedure TFrmCadastro.BTEditarClick(Sender: TObject);
begin
  inherited;
  ETelefone.SetFocus;
  CDSTelefone.Edit;
end;

procedure TFrmCadastro.BTExcluirClick(Sender: TObject);
begin
  inherited;
  CDSTelefone.Delete;
end;

procedure TFrmCadastro.BTIncluirClick(Sender: TObject);
begin
  inherited;
  ETelefone.SetFocus;
  CDSTelefone.Insert;
end;

procedure TFrmCadastro.BTNextClick(Sender: TObject);
begin
  inherited;
  CDSTelefone.Next;
end;

procedure TFrmCadastro.BTPriorClick(Sender: TObject);
begin
  inherited;
  CDSTelefone.Prior;
end;

procedure TFrmCadastro.BTSalvarClick(Sender: TObject);
begin
  inherited;
  CDSTelefone.Post;
end;

procedure TFrmCadastro.CDSEnderecoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  CDSEndereco.FieldByName('IND_PRINCIPAL').AsString := 'N';
end;

procedure TFrmCadastro.CDSEnderecoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if CDSEndereco.FieldByName('CEP').AsString.IsEmpty then
  begin
    ShowMessage('CEP em branco. Verifique!');
    ECEP.SetFocus;
    Abort;
  end;
  if CDSEndereco.FieldByName('LOGRADOURO').AsString.IsEmpty then
  begin
    ShowMessage('Endere?o em branco. Verifique!');
    EEndereco.SetFocus;
    Abort;
  end;
  if CDSEndereco.FieldByName('BAIRRO').AsString.IsEmpty then
  begin
    ShowMessage('Bairro em branco. Verifique!');
    EBairro.SetFocus;
    Abort;
  end;
  if CDSEndereco.FieldByName('CIDADE').AsString.IsEmpty then
  begin
    ShowMessage('Cidade em branco. Verifique!');
    ECidade.SetFocus;
    Abort;
  end;
  if CDSEndereco.FieldByName('ESTADO').AsString.IsEmpty then
  begin
    ShowMessage('Estado em branco. Verifique!');
    EEstado.SetFocus;
    Abort;
  end;
end;

procedure TFrmCadastro.CDSEnderecoNewRecord(DataSet: TDataSet);
begin
  inherited;
  if ECodigo.Text = EmptyStr then
  begin
    ShowMessage('Nenhum registro selecionado. Verifique!');
    Abort;
  end;
end;

procedure TFrmCadastro.CDSTelefoneAfterInsert(DataSet: TDataSet);
begin
  inherited;
  CDSTelefone.FieldByName('IND_PRINCIPAL').AsString := 'N';
end;

procedure TFrmCadastro.CDSTelefoneBeforePost(DataSet: TDataSet);
begin
  inherited;
  if CDSTelefone.FieldByName('TELEFONE').AsString.IsEmpty then
  begin
    ShowMessage('Telefone em branco. Verifique!');
    ETelefone.SetFocus;
    Abort;
  end;
end;

procedure TFrmCadastro.CDSTelefoneNewRecord(DataSet: TDataSet);
begin
  inherited;
  if ECodigo.Text = EmptyStr then
  begin
    ShowMessage('Nenhum registro selecionado. Verifique!');
    Abort;
  end;
end;

procedure TFrmCadastro.ControleBotao;
begin
  if not SBConfirmar.Visible then
  begin
    SBConfirmar.Visible := True;
    SBCancelar.Visible  := True;
    SBIncluir.Visible   := False;
    SBAlterar.Visible   := False;
    SBExcluir.Visible   := False;
    SBVoltar.Visible    := False;
    GroupBox1.Enabled   := True;
    GroupBox2.Enabled   := True;
  end
  else
  begin
    SBConfirmar.Visible := False;
    SBCancelar.Visible  := False;
    SBIncluir.Visible   := True;
    SBAlterar.Visible   := True;
    SBExcluir.Visible   := True;
    SBVoltar.Visible    := True;
    GroupBox1.Enabled   := False;
    GroupBox2.Enabled   := False;
  end;

  SBConfirmar.Top := 0;
  SBCancelar.Top  := 100;
  SBIncluir.Top   := 200;
  SBAlterar.Top   := 300;
  SBExcluir.Top   := 400;
  SBVoltar.Top    := 500;
end;

constructor TFrmCadastro.Create(AOwner: TComponent; aDataSource: TDataSource; aEditar: Boolean);
var
  aId:Integer;
begin
  inherited Create(AOwner);
  FEditar    := aEditar;
  if aDataSource <> Nil then
  begin
    DSCadastro := aDataSource;

    if aEditar then
    begin
      ECodigo.Text := DSCadastro.DataSet.FieldByName('ID').AsString;
      ENome.Text   := DSCadastro.DataSet.FieldByName('NOME').AsString;
    end;
    aId := DSCadastro.DataSet.FieldByName('ID').AsInteger;

    GroupBox1.Enabled := True;
    GroupBox2.Enabled := True;
  end else
  begin
    aId := 0;
  end;

  FController := TController.New;

  CDSEndereco.BeforePost := Nil;
  CDSTelefone.BeforePost := Nil;

  FController.Endereco.Build.SetClientDataSet('ID_CLIENTE', aId, CDSEndereco);
  FController.Telefone.Build.SetClientDataSet('ID_CLIENTE', aId, CDSTelefone);

  CDSEndereco.BeforePost := CDSEnderecoBeforePost;
  CDSTelefone.BeforePost := CDSTelefoneBeforePost;
end;

procedure TFrmCadastro.DSEnderecoDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  BIncluir.Enabled := CDSEndereco.State in [dsBrowse];
  BEditar.Enabled  := (CDSEndereco.State in [dsBrowse]) and (not (CDSEndereco.IsEmpty));
  BExcluir.Enabled := (not (CDSEndereco.State in [dsInsert, dsEdit])) and (not (CDSEndereco.IsEmpty));
  BSalvar.Enabled  := (CDSEndereco.State in [dsInsert, dsEdit]);
  BCancel.Enabled  := (CDSEndereco.State in [dsInsert, dsEdit]);
  BNext.Enabled    := CDSEndereco.State in [dsBrowse];
  BPrior.Enabled   := CDSEndereco.State in [dsBrowse];
end;

procedure TFrmCadastro.DSTelefoneDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  BTIncluir.Enabled := CDSTelefone.State in [dsBrowse];
  BTEditar.Enabled  := (CDSTelefone.State in [dsBrowse]) and (not (CDSTelefone.IsEmpty));
  BTExcluir.Enabled := (not (CDSTelefone.State in [dsInsert, dsEdit])) and (not (CDSTelefone.IsEmpty));
  BTSalvar.Enabled  := (CDSTelefone.State in [dsInsert, dsEdit]);
  BTCancel.Enabled  := (CDSTelefone.State in [dsInsert, dsEdit]);
  BTNext.Enabled    := CDSTelefone.State in [dsBrowse];
  BTPrior.Enabled   := CDSTelefone.State in [dsBrowse];
end;

procedure TFrmCadastro.IncluirEndereco;
begin
  if ECodigo.Text <> EmptyStr then
  begin
    FController.Endereco.Build.ExecuteSQL('DELETE FROM CLIENTE_ENDERECO WHERE ID_CLIENTE = '+ECodigo.Text);
  end;
  CDSEndereco.First;
  while not CDSEndereco.Eof do
  begin

    FController.Endereco
               .IdCliente(FController.Cliente.Id)
               .Logradouro(CDSEndereco.FieldByName('LOGRADOURO').AsString)
               .Cep(CDSEndereco.FieldByName('CEP').AsString)
               .Bairro(CDSEndereco.FieldByName('BAIRRO').AsString)
               .Cidade(CDSEndereco.FieldByName('CIDADE').AsString)
               .Estado(CDSEndereco.FieldByName('ESTADO').AsString)
               .IndPrincipal(CDSEndereco.FieldByName('IND_PRINCIPAL').AsString)
    .Build.Inserir;

    CDSEndereco.Next;
  end;
end;

procedure TFrmCadastro.IncluirTelefone;
begin
  if ECodigo.Text <> EmptyStr then
  begin
    FController.Telefone.Build.ExecuteSQL('DELETE FROM CLIENTE_TELEFONE WHERE ID_CLIENTE = '+ECodigo.Text);
  end;
  CDSTelefone.First;
  while not CDSTelefone.Eof do
  begin

    FController.Telefone
               .IdCliente(FController.Cliente.Id)
               .Telefone(CDSTelefone.FieldByName('TELEFONE').AsString)
               .Tipo(CDSTelefone.FieldByName('TIPO').AsString)
               .Contato(CDSTelefone.FieldByName('CONTATO').AsString)
               .IndPrincipal(CDSTelefone.FieldByName('IND_PRINCIPAL').AsString)
    .Build.Inserir;

    CDSTelefone.Next;
  end;
end;

procedure TFrmCadastro.SBAlterarClick(Sender: TObject);
begin
  inherited;
  if ECodigo.Text = '' then
  begin
    ShowMessage('Nenhum registro para alterar. Verifique!');
    Abort;
  end;

  FEditar := True;

  DSCadastro.DataSet := FController.Cliente.Build.ListarPorId(StrToInt(ECodigo.Text));

  CDSEndereco.BeforePost := Nil;
  CDSTelefone.BeforePost := Nil;

  FController.Endereco.Build.SetClientDataSet('ID_CLIENTE', DSCadastro.DataSet.FieldByName('ID').AsInteger, CDSEndereco);
  FController.Telefone.Build.SetClientDataSet('ID_CLIENTE', DSCadastro.DataSet.FieldByName('ID').AsInteger, CDSTelefone);

  CDSEndereco.BeforePost := CDSEnderecoBeforePost;
  CDSTelefone.BeforePost := CDSTelefoneBeforePost;

  ControleBotao;
end;

procedure TFrmCadastro.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  if not FEditar then
  begin
    FController.Cliente
               .Nome(ENome.Text)
               .Build.Inserir;
  end
  else
  begin
    FController.Cliente
               .Id(StrToInt(ECodigo.Text))
               .Nome(ENome.Text)
               .Build.Atualizar;
  end;

  IncluirEndereco;
  IncluirTelefone;

  if ECodigo.Text = EmptyStr then
  begin
    ECodigo.Text := FController.Cliente.Build.AddSQL('SELECT MAX(ID) AS COUNT FROM CLIENTE').FieldByName('COUNT').AsInteger.ToString;
  end;
  ControleBotao;
end;

procedure TFrmCadastro.SBExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja mesmo deletar o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FController.Telefone.Build.ExecuteSQL('DELETE FROM CLIENTE_TELEFONE WHERE ID_CLIENTE = '+ECodigo.Text);
    FController.Endereco.Build.ExecuteSQL('DELETE FROM CLIENTE_ENDERECO WHERE ID_CLIENTE = '+ECodigo.Text);
    FController.Cliente.Build.Excluir;

    ECodigo.Text := '';
    ENome.Text   := '';
    CDSEndereco.EmptyDataSet;
    CDSTelefone.EmptyDataSet;
  end;
end;

procedure TFrmCadastro.SBIncluirClick(Sender: TObject);
begin
  inherited;
  FEditar := False;

  DSCadastro.DataSet := FController.Cliente.Build.ListarPorId(0);

  ECodigo.Text := '';
  ENome.Text   := '';
  CDSEndereco.EmptyDataSet;
  CDSTelefone.EmptyDataSet;

  CDSEndereco.BeforePost := Nil;
  CDSTelefone.BeforePost := Nil;

  FController.Endereco.Build.SetClientDataSet('ID_CLIENTE', 0, CDSEndereco);
  FController.Telefone.Build.SetClientDataSet('ID_CLIENTE', 0, CDSTelefone);

  CDSEndereco.BeforePost := CDSEnderecoBeforePost;
  CDSTelefone.BeforePost := CDSTelefoneBeforePost;

  ControleBotao;
end;

procedure TFrmCadastro.SBVoltarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
