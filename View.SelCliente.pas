unit View.SelCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrmSelCliente = class(TForm)
    LbNomeCliente: TLabel;
    GroupBox1: TGroupBox;
    EdCodCli: TLabeledEdit;
    BtBuscaCli: TBitBtn;
    BTFazerPedido: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BtBuscaCliClick(Sender: TObject);
    procedure BTFazerPedidoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    Achou : Boolean;
  public
    { Public declarations }
  end;

var
  FrmSelCliente: TFrmSelCliente;

implementation

{$R *.dfm}

uses View.PedidoVendas, ClassClientes;

procedure TFrmSelCliente.FormCreate(Sender: TObject);
begin Achou := False; end;

procedure TFrmSelCliente.BtBuscaCliClick(Sender: TObject);
var Cons : TClientes;
    Cliente : TStringList;
begin
  Cons := TClientes.Create;
  Cliente := TStringList.Create;
  try
    Cliente := Cons.SelectCliente(Trim(EdCodCli.Text));
    if Cliente.Count <> 0 then begin
       Achou := True;
       LbNomeCliente.Caption  := Cliente[1];
       EdCodCli.Enabled := False end
    else begin
       Achou  := False;
       EdCodCli.Clear;
       EdCodCli.SetFocus;
    end;
  finally
    FreeAndNil(Cons);
    FreeAndNil(Cliente);
  end;
end;

procedure TFrmSelCliente.BTFazerPedidoClick(Sender: TObject);
begin
   if Achou and (EdCodCli.Text <> '0') and (EdCodCli.Text <> '') and (LbNomeCliente.Caption <>'') then begin
      with FrmPedidoVendas do begin
           LbCodCli.Caption := Trim(EdCodCli.Text);
           LbCliente.Caption := LbNomeCliente.Caption;
           Modo := 'I';
           LimpaTela(FrmPedidoVendas.StringGrid);
           ShowModal;
      end;
   end;
end;

procedure TFrmSelCliente.BitBtn1Click(Sender: TObject);
begin
  if EdCodCli.Enabled = False then
  begin
     EdCodCli.Enabled := True;
     EdCodCli.Clear;
     LbNomeCliente.Caption := '';
     EdCodCli.SetFocus;
  end;
end;

end.
