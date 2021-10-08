object DM: TDM
  OldCreateOrder = False
  Height = 212
  Width = 352
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=wksistemas'
      'User_Name=root'
      'Password=wksistemas'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 72
    Top = 40
  end
  object FDTransaction: TFDTransaction
    Connection = FDConnection
    Left = 112
    Top = 136
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 32
    Top = 128
  end
  object FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Projetos\Projeto WK\LibMySQL\libmysql.dll'
    Left = 216
    Top = 144
  end
  object QryPedidoM: TFDQuery
    Connection = FDConnection
    Transaction = FDTransaction
    UpdateTransaction = FDTransaction
    Left = 272
    Top = 32
    object QryPedidoMNumPedido: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'NumPedido'
      Origin = 'NumPedido'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QryPedidoMDataEmisao: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DataEmisao'
      Origin = 'DataEmisao'
    end
    object QryPedidoMFkCodCli: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'FkCodCli'
      Origin = 'FkCodCli'
    end
    object QryPedidoMValorTotal: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ValorTotal'
      Origin = 'ValorTotal'
      Precision = 15
      Size = 2
    end
  end
  object QryPedidoD: TFDQuery
    MasterSource = FrmManutPedidos.DSMas
    MasterFields = 'NumPedido'
    Connection = FDConnection
    Transaction = FDTransaction
    UpdateTransaction = FDTransaction
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      '')
    Left = 288
    Top = 96
    object QryPedidoDAutoincrem: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'Autoincrem'
      Origin = 'Autoincrem'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object QryPedidoDFkNumeroPedido: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'FkNumeroPedido'
      Origin = 'FkNumeroPedido'
    end
    object QryPedidoDFkCodProd: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'FkCodProd'
      Origin = 'FkCodProd'
    end
    object QryPedidoDQtd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Qtd'
      Origin = 'Qtd'
    end
    object QryPedidoDVlrUnitario: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VlrUnitario'
      Origin = 'VlrUnitario'
      Precision = 15
      Size = 2
    end
    object QryPedidoDVlrTotal: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VlrTotal'
      Origin = 'VlrTotal'
      Precision = 15
      Size = 2
    end
  end
end
