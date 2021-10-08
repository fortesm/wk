﻿unit View.ManutPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls;

type
  TFrmManutPedidos = class(TForm)
    BtCarregarPedido: TSpeedButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DSMas: TDataSource;
    DSDet: TDataSource;
    ButCancelarPed: TBitBtn;
    procedure BtCarregarPedidoClick(Sender: TObject);
    procedure ButCancelarPedClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManutPedidos: TFrmManutPedidos;

implementation

Uses UDMPrincipal;

{$R *.dfm}

procedure TFrmManutPedidos.BtCarregarPedidoClick(Sender: TObject);
var Str: TStringBuilder;
begin
  var InputStr := InputBox('Carregar Pedido', 'Digite o número do pedido','');

   Str := TStringBuilder.Create;
   Str.Clear;
   Str.Append('SELECT ');
   Str.Append('NumPedido, ');
   Str.Append('DataEmisao, ');
   Str.Append('FkCodCli, ');
   Str.Append('ValorTotal ');
   Str.Append('FROM ');
   Str.Append('pedidosdadosgerais WHERE NumPedido = :pNumPed');
   DM.QryPedidoM.SQL.Clear;
   DM.QryPedidoM.SQL.Add(Str.ToString);

   DM.QryPedidoM.ParamByName('pNumPed').AsInteger := StrToInt(Trim(InputStr));
   DM.QryPedidoM.Open;

   //=================================================================
     Str.Clear;
     Str.Append('SELECT ');
     Str.Append('Autoincrem, ');
     Str.Append('FkNumeroPedido, ');
     Str.Append('FkCodProd, ');
     Str.Append('Qtd, ');
     Str.Append('VlrUnitario, ');
     Str.Append('VlrTotal ');
     Str.Append('FROM ');
     Str.Append('pedidosprodutos WHERE  FkNumeroPedido  =  :NumPedido ');

     DM.QryPedidoD.SQL.Clear;
     DM.QryPedidoD.SQL.Add(Str.ToString);

     DM.QryPedidoD.ParamByName('NumPedido').AsInteger := StrToInt(Trim(InputStr));
     DM.QryPedidoD.Open;
end;

procedure TFrmManutPedidos.ButCancelarPedClick(Sender: TObject);
var Str: TStringBuilder;
begin
   var InputStr := InputBox('Cancelar Pedido', 'Digite o número do pedido','');

   DM.QryPedidoM.SQL.Clear;
   DM.QryPedidoM.SQL.Add( 'DELETE FROM  pedidosdadosgerais WHERE NumPedido = :pNumPedido');
   //=======================================================================================
   DM.QryPedidoM.ParamByName('pNumPedido').AsInteger := StrToInt(Trim(InputStr));
   DM.QryPedidoM.ExecSQL;

   DM.QryPedidoM.Close;
   DM.QryPedidoD.Close;
   ShowMessage('Pedido Cancelado com sucesso!');
end;

end.
