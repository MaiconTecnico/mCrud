unit mCrud.resources.conexao;

interface

uses
  System.SysUtils,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  Data.DB,
  FireDAC.Comp.Client,
  mCrud.resources.interfaces;

type
  TConexao = class(TInterfacedObject, iConexao)
    private
      FConn : TFDConnection;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iConexao;
      function Connect : TCustomConnection;
  end;

implementation

{ TConexao }

function TConexao.Connect: TCustomConnection;
begin
  Result := FConn;
end;

constructor TConexao.Create;
begin
  if not DirectoryExists(ExtractFilePath(ParamStr(0))+'database\') then
  begin
    ForceDirectories(ExtractFilePath(ParamStr(0))+'database\');
  end;

  FConn := TFDConnection.Create(nil);
  FConn.Params.Clear;
  FConn.Params.Add('DriverID=SQLite');
  FConn.Params.Add('DataBase='+ExtractFilePath(ParamStr(0))+'database\Dados.db');
  FConn.Params.Add('LockingMode=Normal');
  FConn.Connected := True;
end;

destructor TConexao.Destroy;
begin
  FConn.Free;
  inherited;
end;

class function TConexao.New: iConexao;
begin
  Result := Self.Create;
end;

end.
