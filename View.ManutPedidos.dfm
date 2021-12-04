object FrmManutPedidos: TFrmManutPedidos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Manuten'#231#227'o de Pedidos'
  ClientHeight = 495
  ClientWidth = 955
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 82
    Height = 23
    Caption = 'Pedidos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 214
    Width = 158
    Height = 23
    Caption = 'Itens do Pedido:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 41
    Width = 777
    Height = 167
    DataSource = DM.DSMas
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NumPedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Emiss'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 243
    Width = 777
    Height = 226
    DataSource = DM.DSDet
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CodProduto'
        Title.Caption = 'Cod do Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VlrUnitario'
        Title.Caption = 'Valor Unitario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        Visible = True
      end>
  end
  object ButDeletarPed: TBitBtn
    Left = 791
    Top = 119
    Width = 145
    Height = 25
    Caption = 'Deletar Pedido'
    TabOrder = 2
    OnClick = ButDeletarPedClick
  end
  object BtEditarPedido: TBitBtn
    Left = 791
    Top = 41
    Width = 145
    Height = 25
    Caption = 'Editar Itens do Pedido'
    TabOrder = 3
    OnClick = BtEditarPedidoClick
  end
end
