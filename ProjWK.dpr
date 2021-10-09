﻿program ProjWK;

uses
  Vcl.Forms,
  View.Principal in 'View.Principal.pas' {FrmPrincipal},
  View.PedidoVendas in 'View.PedidoVendas.pas' {FrmPedidoVendas},
  Consultas in 'Model\Consultas.pas',
  UDMPrincipal in 'Model\UDMPrincipal.pas' {DM: TDataModule},
  View.SelCliente in 'View.SelCliente.pas' {FrmSelCliente},
  View.ManutPedidos in 'View.ManutPedidos.pas' {FrmManutPedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmPedidoVendas, FrmPedidoVendas);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmSelCliente, FrmSelCliente);
  Application.CreateForm(TFrmManutPedidos, FrmManutPedidos);
  Application.Run;
end.