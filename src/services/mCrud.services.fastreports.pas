unit mCrud.services.fastreports;

interface

uses
  System.SysUtils, System.Classes, frxDesgn, frxExportXLSX, frxExportXLS, frxExportCSV, frxClass, frxExportPDF, frxDBSet, Data.DB, Datasnap.DBClient;

type
  TDMFastReports = class(TDataModule)
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxCSVExport1: TfrxCSVExport;
    frxXLSExport1: TfrxXLSExport;
    frxXLSXExport1: TfrxXLSXExport;
    frxDesigner1: TfrxDesigner;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    frxDBDataset1: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMFastReports: TDMFastReports;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
