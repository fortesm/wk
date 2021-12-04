unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, System.Actions, Vcl.ActnList;

type
  TFrmPrincipal = class(TForm)
    MainMenu: TMainMenu;
    Vendas1: TMenuItem;
    PedidodeVendas1: TMenuItem;
    N1: TMenuItem;
    ManutenodePedidos1: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    BalloonHint: TBalloonHint;
    EditURL: TEdit;
    SpeedButton2: TSpeedButton;
    procedure PedidodeVendas1Click(Sender: TObject);
    procedure ManutenodePedidos1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

Uses View.PedidoVendas, View.SelCliente, View.ManutPedidos;

{$R *.dfm}

procedure TFrmPrincipal.PedidodeVendas1Click(Sender: TObject);
begin
  FrmSelCliente.ShowModal;
end;

procedure TFrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  EditURL.CopyToClipboard;
end;

procedure TFrmPrincipal.ManutenodePedidos1Click(Sender: TObject);
begin
    FrmManutPedidos.ShowModal;
end;

end.
