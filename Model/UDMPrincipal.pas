unit UDMPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Comp.Client, Data.DB, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageXML;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
    FDTransaction: TFDTransaction;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink;
    QryPedidoM: TFDQuery;
    QryPedidoD: TFDQuery;
    DSMas: TDataSource;
    DSDet: TDataSource;
    QryDelPedido: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses View.ManutPedidos;

end.
