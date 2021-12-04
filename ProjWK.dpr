program ProjWK;

uses
  Vcl.Forms,
  View.Principal in 'View.Principal.pas' {FrmPrincipal},
  UDMPrincipal in 'Model\UDMPrincipal.pas' {DM: TDataModule},
  View.SelCliente in 'View.SelCliente.pas' {FrmSelCliente},
  View.ManutPedidos in 'View.ManutPedidos.pas' {FrmManutPedidos},
  ClassProdutos in 'Model\ClassProdutos.pas',
  ClassClientes in 'Model\ClassClientes.pas',
  View.PedidoVendas in 'View.PedidoVendas.pas' {FrmPedidoVendas},
  ClassPedidos in 'Model\ClassPedidos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmSelCliente, FrmSelCliente);
  Application.CreateForm(TFrmManutPedidos, FrmManutPedidos);
  Application.CreateForm(TFrmPedidoVendas, FrmPedidoVendas);
  Application.Run;
end.
