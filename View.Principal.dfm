object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema WK'
  ClientHeight = 259
  ClientWidth = 560
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 112
    Width = 560
    Height = 147
    Align = alBottom
    BevelOuter = bvNone
    Color = clRed
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 56
      Top = 33
      Width = 211
      Height = 57
      Caption = 'WK Sistemas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -48
      Font.Name = 'Waverly'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 32
      Top = 96
      Width = 467
      Height = 19
      Caption = 'Teste do Candidato Marcelo Fortes - fortes.m@gmail.com'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object MainMenu: TMainMenu
    Left = 416
    Top = 152
    object Vendas1: TMenuItem
      Caption = 'Vendas'
      object PedidodeVendas1: TMenuItem
        Caption = 'Pedido de Ve&ndas'
        OnClick = PedidodeVendas1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object ManutenodePedidos1: TMenuItem
        Caption = 'Manuten'#231#227'o de Pedidos'
        OnClick = ManutenodePedidos1Click
      end
    end
  end
end
