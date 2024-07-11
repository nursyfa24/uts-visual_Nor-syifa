object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 191
  Top = 152
  Height = 191
  Width = 261
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = 'penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'C:\Program Files (x86)\Borland\Delphi7\Folder Baru\libmysql.dll'
    Left = 48
    Top = 24
  end
  object ZQry1: TZQuery
    Connection = ZConnection1
    Active = True
    SQL.Strings = (
      'SELECT * FROM `satuan`')
    Params = <>
    Left = 120
    Top = 24
  end
  object ds1: TDataSource
    DataSet = ZQry1
    Left = 184
    Top = 24
  end
end
