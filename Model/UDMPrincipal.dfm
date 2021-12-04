object DM: TDM
  OldCreateOrder = False
  Height = 254
  Width = 426
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
    Left = 72
    Top = 88
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 72
    Top = 136
  end
  object FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Projetos\Projeto WK\LibMySQL\libmysql.dll'
    Left = 72
    Top = 192
  end
  object QryPedidoM: TFDQuery
    Active = True
    Connection = FDConnection
    Transaction = FDTransaction
    UpdateTransaction = FDTransaction
    SQL.Strings = (
      'SELECT'
      '  P.NumPedido, '
      '  C.PKCodCli,'
      '  C.nome As Cliente,'
      '  P.DataEmisao As Emiss'#227'o,'
      '  P.ValorTotal As Total'
      'FROM '
      '  pedidosdadosgerais P'
      'INNER JOIN clientes C ON (P.FkCodCli = C.PKCodCli)'
      '-- WHERE P.NumPedido = :pNumPed')
    Left = 288
    Top = 32
  end
  object QryPedidoD: TFDQuery
    IndexFieldNames = 'FkNumeroPedido'
    MasterSource = DSMas
    MasterFields = 'NumPedido'
    DetailFields = 'FkNumeroPedido'
    Connection = FDConnection
    Transaction = FDTransaction
    UpdateTransaction = FDTransaction
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT '
      '   D.Autoincrem , '
      '   D.FkNumeroPedido,'
      '   D.FkCodProd As CodProduto,  '
      '   P.Descricao, '
      '  D.Qtd, '
      '  D.VlrUnitario, '
      '  D.VlrTotal As Total '
      'FROM '
      '  pedidosprodutos D'
      'INNER JOIN '
      '  produtos P ON (P.PkCodProd = D.FkCodProd)'
      'WHERE  '
      '  D.FkNumeroPedido  =  :NumPedido ')
    Left = 288
    Top = 96
    ParamData = <
      item
        Name = 'NUMPEDIDO'
        DataType = ftLargeint
        ParamType = ptInput
        Value = 3
      end>
  end
  object DSMas: TDataSource
    DataSet = QryPedidoM
    Left = 344
    Top = 32
  end
  object DSDet: TDataSource
    DataSet = QryPedidoD
    Left = 344
    Top = 96
  end
  object QryDelPedido: TFDQuery
    Connection = FDConnection
    Left = 280
    Top = 160
  end
end
