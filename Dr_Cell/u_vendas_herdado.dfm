inherited f_vendas_herdado: Tf_vendas_herdado
  Caption = 'Vendas'
  Font.Height = -15
  Font.Style = [fsBold]
  OnCreate = FormCreate
  ExplicitWidth = 670
  ExplicitHeight = 486
  PixelsPerInch = 96
  TextHeight = 18
  inherited Bevel1: TBevel
    Left = -17
    ExplicitLeft = -17
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 8
    Width = 113
    Height = 16
    Caption = 'Numero da venda'
    FocusControl = edit_num
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [3]
    Left = 8
    Top = 60
    Width = 44
    Height = 16
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel [4]
    Left = 8
    Top = 109
    Width = 31
    Height = 16
    Caption = 'Data'
    FocusControl = edit_data
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel [5]
    Left = 280
    Top = 8
    Width = 77
    Height = 16
    Caption = 'Observa'#231#227'o'
    FocusControl = edit_obs
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited b_incluir: TButton
    Top = 286
    Height = 35
    ExplicitTop = 286
    ExplicitHeight = 35
  end
  inherited b_excluir: TButton
    Height = 35
    ExplicitHeight = 35
  end
  inherited b_fechar: TButton
    Height = 35
    ExplicitHeight = 35
  end
  object edit_num: TDBEdit [13]
    Left = 8
    Top = 30
    Width = 241
    Height = 24
    DataField = 'num_venda'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnKeyDown = edit_numKeyDown
  end
  object cb1: TDBLookupComboBox [14]
    Left = 8
    Top = 79
    Width = 241
    Height = 24
    DataField = 'cod_cliente'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    KeyField = 'cod_cliente'
    ListField = 'nome'
    ListSource = ds_clientes
    ParentFont = False
    TabOrder = 8
    OnKeyDown = cb1KeyDown
  end
  object edit_data: TDBEdit [15]
    Left = 8
    Top = 131
    Width = 100
    Height = 24
    DataField = 'data'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnKeyDown = edit_dataKeyDown
  end
  object edit_obs: TDBMemo [16]
    Left = 280
    Top = 30
    Width = 376
    Height = 143
    DataField = 'observacao'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnKeyDown = edit_obsKeyDown
  end
  object b_itens: TButton [17]
    Left = 182
    Top = 179
    Width = 75
    Height = 35
    Caption = 'Itens'
    TabOrder = 11
    OnClick = b_itensClick
  end
  object b_reletorio: TButton [18]
    Left = 376
    Top = 192
    Width = 112
    Height = 35
    Caption = 'RELATORIOS'
    TabOrder = 12
    OnClick = b_reletorioClick
  end
  inherited grid_dados: TDBGrid
    TabOrder = 13
    Columns = <
      item
        Expanded = False
        FieldName = 'cod_venda'
        Title.Caption = 'C'#243'd.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'num_venda'
        Title.Caption = 'Num. Venda'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Title.Caption = 'Data'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cod_cliente'
        Title.Caption = 'Cliente'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object b_pagar: TBitBtn [20]
    Left = 568
    Top = 179
    Width = 88
    Height = 60
    Caption = 'Pagar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    TabOrder = 14
    OnClick = b_pagarClick
  end
  object q_clientes: TFDQuery [21]
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select * from clientes'
      'order by nome')
    Left = 352
    Top = 80
  end
  object ds_clientes: TDataSource [22]
    DataSet = q_clientes
    Left = 408
    Top = 80
  end
  inherited q_dados: TFDQuery
    SQL.Strings = (
      'SELECT v.*,'
      #9'c.nome as cliente'
      
        'FROM vendas as v left outer JOIN clientes as c ON (c.cod_cliente' +
        ' = v.cod_cliente)'
      'ORDER BY v.num_venda')
    object q_dadoscod_venda: TFDAutoIncField
      FieldName = 'cod_venda'
      Origin = 'cod_venda'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_dadosnum_venda: TIntegerField
      FieldName = 'num_venda'
      Origin = 'num_venda'
      Required = True
    end
    object q_dadoscod_cliente: TIntegerField
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
      Required = True
    end
    object q_dadosobservacao: TMemoField
      FieldName = 'observacao'
      Origin = 'observacao'
      BlobType = ftMemo
    end
    object q_dadosdata: TSQLTimeStampField
      FieldName = 'data'
      Origin = 'data'
      Required = True
      EditMask = '99/99/9999;1;_'
    end
  end
end
