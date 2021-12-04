object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Sistema WK'
  ClientHeight = 318
  ClientWidth = 683
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
  object SpeedButton1: TSpeedButton
    Left = 173
    Top = 16
    Width = 137
    Height = 41
    Hint = 'Comece um pedido por aqui'
    CustomHint = BalloonHint
    Caption = 'Pedido de vendas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = PedidodeVendas1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 504
    Top = 132
    Width = 64
    Height = 22
    Hint = 'Copia o endere'#231'o do manual para '#224'rea de transfer'#234'ncia'
    CustomHint = BalloonHint
    Caption = 'Copiar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000000000000000000000000000000000009F4040604040
      202020202020404040404040404040404040404040404040FFFFFF7070704040
      407070709F40405F2020DF3F3F7F2020404040404040707070B0B0B090909050
      5050404040404040404040404040808080404040BF3F3F5F0000BF0000BF6060
      A0A0A0B0B0B0C0C0C0B0B0B04040404040404040405050509090909090909090
      90808080BF00005F0000BF0000CF6F6FDFDFDFC0C0C0C0C0C0808080C0C0C0C0
      C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFCFCFCFCFCFBF00005F00005F00005F2020
      404040BFBFBFDFDFDFC0C0C0AFAFAF9F9F9FBFBFBFB0B0B0CFCFCFCFCFCFBFBF
      BFBFBFBF5F0000200000FFFFFFFFFFFFFFFFFF30AFAF707070BFBFBFBFBFBFDF
      DFDF7FBFBFBFBFBFBFBFBFDFDFDFBFFFFFBFFFFF404040004040FFFFFFFFFFFF
      FFFFFF30AFAF606060BFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFF
      FFBFFFFF404040004040FFFFFFFFFFFFFFFFFF30AFAF606060BFFFFFBFFFFFBF
      FFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFF404040004040FFFFFFFFFFFF
      FFFFFF30AFAF606060BFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFF
      FFBFFFFF404040004040FFFFFFFFFFFFFFFFFF30AFAF606060BFFFFFBFFFFFBF
      FFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFF404040004040FFFFFFFFFFFF
      FFFFFF30AFAF606060BFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFF
      FFBFFFFF404040004040FFFFFFFFFFFFFFFFFF30AFAF606060BFFFFFBFFFFFBF
      FFFFBFFFFFBFFFFFBFBFBFBFFFFFBFFFFFBFFFFF404040004040FFFFFFFFFFFF
      FFFFFF30AFAF606060BFFFFFBFFFFFBFFFFFBFFFFFBFFFFF7FBFBF3F7F7F9F9F
      9FBFFFFF404040004040FFFFFFFFFFFFFFFFFF30AFAF606060BFFFFFBFFFFFBF
      FFFFBFFFFFBFFFFF5F9F9F00007F303070BFFFFF404040004040FFFFFFFFFFFF
      FFFFFF30AFAF3030306060606060606060606060606060605050500000406060
      60606060303030004040FFFFFFFFFFFFFFFFFF30707030AFAF30AFAF30AFAF30
      AFAF30AFAF30AFAF30AFAF30AFAF30AFAF30AFAF30AFAF004040}
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton2Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 171
    Width = 683
    Height = 147
    Align = alBottom
    BevelOuter = bvNone
    Color = clNavy
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
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object BitBtn1: TBitBtn
    Left = 324
    Top = 16
    Width = 137
    Height = 41
    Hint = 'Manuten'#231#227'o de pedidos lan'#231'ados'
    CustomHint = BalloonHint
    Caption = 'Manuten'#231#227'o dos Pedidos'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ManutenodePedidos1Click
  end
  object EditURL: TEdit
    Left = 139
    Top = 133
    Width = 359
    Height = 21
    TabOrder = 2
    Text = 'https://github.com/fortesm/wk/blob/master/doc/Como_Usar.pdf'
  end
  object MainMenu: TMainMenu
    Left = 632
    Top = 32
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
  object BalloonHint: TBalloonHint
    Left = 632
    Top = 96
  end
end
