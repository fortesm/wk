object FrmManutPedidos: TFrmManutPedidos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Manuten'#231#227'o de Pedidos'
  ClientHeight = 432
  ClientWidth = 938
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object BtCarregarPedido: TSpeedButton
    Left = 32
    Top = 8
    Width = 137
    Height = 22
    Caption = 'Carregar Pedido'
    OnClick = BtCarregarPedidoClick
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 48
    Width = 777
    Height = 121
    DataSource = DSMas
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 32
    Top = 208
    Width = 777
    Height = 120
    DataSource = DSDet
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ButCancelarPed: TBitBtn
    Left = 584
    Top = 17
    Width = 177
    Height = 25
    Caption = 'Cancelar Pedido'
    TabOrder = 2
    OnClick = ButCancelarPedClick
  end
  object DSMas: TDataSource
    DataSet = DM.QryPedidoM
    Left = 616
    Top = 160
  end
  object DSDet: TDataSource
    DataSet = DM.QryPedidoD
    Left = 624
    Top = 344
  end
end