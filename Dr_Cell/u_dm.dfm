object DM: TDM
  OldCreateOrder = False
  Height = 352
  Width = 467
  object FDConnection1: TFDConnection
    ConnectionName = 'MINHA_CONEXAO'
    Params.Strings = (
      'Server=VINICIUS-PC\SQLEXPRESS'
      'Database=Dr_Cell'
      'User_Name=VINICIUS-PC\VINIC'
      'OSAuthent=Yes'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 48
    Top = 40
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 120
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 48
    Top = 200
  end
  object Q_Geral: TFDQuery
    Connection = FDConnection1
    Left = 152
    Top = 32
  end
end
