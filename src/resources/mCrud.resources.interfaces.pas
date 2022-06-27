unit mCrud.resources.interfaces;

interface

uses
  Data.DB;

type
  iConexao = interface
    ['{5A61ABC4-8EF6-4580-AB1E-1EB1409441F9}']
    function Connect : TCustomConnection;
  end;

implementation

end.
