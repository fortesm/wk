unit View.ManutPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Data.DB, FireDAC.Stan.Param,
  Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmManutPedidos = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    ButDeletarPed: TBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    BtEditarPedido: TBitBtn;
    procedure ButDeletarPedClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtEditarPedidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //procedure LoadCodCli;
  end;

var
  FrmManutPedidos: TFrmManutPedidos;

implementation

Uses UDMPrincipal, View.PedidoVendas, ClassPedidos;

{$R *.dfm}

procedure TFrmManutPedidos.ButDeletarPedClick(Sender: TObject);
begin
   var InputStr := InputBox('Cancelar Pedido', 'Digite o número do pedido','');
   try
      DM.FDConnection.StartTransaction;
      DM.QryDelPedido.SQL.Clear;
      DM.QryDelPedido.SQL.Add( 'DELETE FROM  pedidosdadosgerais WHERE NumPedido = :pNumPedido');
      DM.QryDelPedido.ParamByName('pNumPedido').AsInteger := StrToInt(Trim(InputStr));
      DM.QryDelPedido.ExecSQL;
      DM.QryDelPedido.Close;
      DM.FDConnection.Commit;

      ShowMessage('Pedido Cancelado com sucesso!');
      DM.QryPedidoM.Close;
      DM.QryPedidoM.Close;
      DM.QryPedidoM.Open;
      DM.QryPedidoM.Open;
   except on E: Exception do
      DM.FDConnection.Rollback;
   end;
end;

procedure TFrmManutPedidos.FormShow(Sender: TObject);   //Abre os detalhes do pedido
begin
   DM.QryPedidoM.Close;
   DM.QryPedidoD.Close;
   DM.QryPedidoM.Open;
   DM.QryPedidoD.Open;
end;

procedure TFrmManutPedidos.BtEditarPedidoClick(Sender: TObject); // Edita um pedido
var i : Integer;
    Ped : TPedido;
begin
    Ped := TPedido.Create;
    I := 1;
    try
      with DBGrid2.DataSource.DataSet do
      begin
         While not EoF do
         Begin
            FrmPedidoVendas.StringGrid.RowCount := I + 1;

            Ped.NumPedido := FieldByName('FkNumeroPedido').AsString;
            Ped.CodProduto := FieldByName('CodProduto').AsString;
            Ped.Descricao := FieldByName('Descricao').AsString;
            Ped.VlrUnitario := FieldByName('VlrUnitario').AsString;
            Ped.Qtd := FieldByName('Qtd').AsString;
            Ped.Total :=  FieldByName('Total').AsString;     // As Total

            FrmPedidoVendas.StringGrid.Cells[0,I] := Ped.CodProduto;
            FrmPedidoVendas.StringGrid.Cells[1,I] := Ped.Descricao;
            FrmPedidoVendas.StringGrid.Cells[2,I] := Ped.VlrUnitario;
            FrmPedidoVendas.StringGrid.Cells[3,I] := Ped.Qtd;
            FrmPedidoVendas.StringGrid.Cells[4,I] := Ped.Total;

            I := I + 1;

            Next;
         End;
         FrmPedidoVendas.LbCodCli.Caption := DBGrid1.DataSource.DataSet.FieldByName('PKCodCli').AsString;
         FrmPedidoVendas.LbCliente.Caption := DBGrid1.DataSource.DataSet.FieldByName('Cliente').AsString;

         FrmPedidoVendas.Modo := 'U';
         FrmPedidoVendas.CodPed :=  DBGrid1.DataSource.DataSet.FieldByName('NumPedido').AsString;
         FrmPedidoVendas.ShowModal;
      end;
    finally
      FreeAndNil(Ped);
    end;
end;



end.
