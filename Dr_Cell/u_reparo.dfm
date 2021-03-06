inherited f_reparos_herdado: Tf_reparos_herdado
  Caption = 'REPAROS'
  ClientHeight = 493
  ClientWidth = 696
  OnCreate = FormCreate
  ExplicitWidth = 702
  ExplicitHeight = 522
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Left = -2
    Width = 714
    Height = 213
    ExplicitLeft = -2
    ExplicitWidth = 714
    ExplicitHeight = 213
  end
  inherited Label1: TLabel
    Top = 260
    ExplicitTop = 260
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 56
    Width = 53
    Height = 18
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [3]
    Left = 368
    Top = 5
    Width = 139
    Height = 18
    Caption = 'Problemas Citados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [4]
    Left = 513
    Top = 5
    Width = 175
    Height = 18
    Caption = 'Problemas Encontrados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel [5]
    Left = 8
    Top = 112
    Width = 108
    Height = 18
    Caption = 'Data Recebido'
    FocusControl = data_recebido
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel [6]
    Left = 8
    Top = 161
    Width = 97
    Height = 18
    Caption = 'Data Entrega'
    FocusControl = data_entrega
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel [7]
    Left = 8
    Top = 8
    Width = 97
    Height = 18
    Caption = 'Num. Reparo'
    FocusControl = edit_reparo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited b_gravar: TButton
    Top = 219
    ExplicitTop = 219
  end
  inherited b_cancelar: TButton
    Top = 219
    TabOrder = 7
    ExplicitTop = 219
  end
  inherited edit_pesquisa: TEdit
    Top = 285
    TabOrder = 8
    ExplicitTop = 285
  end
  inherited b_incluir: TButton
    Left = 598
    Top = 292
    TabOrder = 9
    ExplicitLeft = 598
    ExplicitTop = 292
  end
  inherited b_alterar: TButton
    Left = 598
    Top = 347
    TabOrder = 10
    ExplicitLeft = 598
    ExplicitTop = 347
  end
  inherited b_excluir: TButton
    Left = 598
    Top = 402
    TabOrder = 11
    ExplicitLeft = 598
    ExplicitTop = 402
  end
  inherited b_fechar: TButton
    Left = 598
    Top = 453
    TabOrder = 12
    ExplicitLeft = 598
    ExplicitTop = 453
  end
  inherited grid_dados: TDBGrid
    Top = 317
    TabOrder = 13
    Columns = <
      item
        Expanded = False
        FieldName = 'cod_reparo'
        Title.Caption = 'C'#243'd'
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
        FieldName = 'num_reparo'
        Title.Caption = 'Num. Reparo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 100
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
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_recebido'
        Title.Caption = 'Recebido'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status'
        Title.Caption = 'Status'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 50
        Visible = True
      end>
  end
  object cb1: TDBLookupComboBox [16]
    Left = 8
    Top = 78
    Width = 156
    Height = 26
    DataField = 'cod_cliente'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    KeyField = 'cod_cliente'
    ListField = 'nome'
    ListSource = ds_clientes
    ParentFont = False
    TabOrder = 2
    OnKeyDown = cb1KeyDown
  end
  object data_recebido: TDBEdit [17]
    Left = 8
    Top = 134
    Width = 156
    Height = 26
    DataField = 'data_recebido'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnKeyDown = data_recebidoKeyDown
  end
  object data_entrega: TDBEdit [18]
    Left = 8
    Top = 183
    Width = 156
    Height = 26
    DataField = 'data_entrega'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    OnKeyDown = data_entregaKeyDown
  end
  object citados: TDBMemo [19]
    Left = 362
    Top = 24
    Width = 133
    Height = 177
    DataField = 'prob_citados'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnKeyDown = citadosKeyDown
  end
  object encontrados: TDBMemo [20]
    Left = 513
    Top = 28
    Width = 160
    Height = 173
    DataField = 'prob_encontrados'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnKeyDown = encontradosKeyDown
  end
  object status: TDBRadioGroup [21]
    Left = 170
    Top = 12
    Width = 179
    Height = 189
    Caption = 'STATUS'
    DataField = 'status'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Items.Strings = (
      '1 - Diagnostico'
      '2 - Informando Cliente'
      '3 - Iniciado'
      '4 - Em Andamento'
      '5 - Finalizado'
      '6 - Informando Cliente'
      '7 - Entregue')
    ParentFont = False
    TabOrder = 4
  end
  object b_itens: TButton [22]
    Left = 214
    Top = 219
    Width = 75
    Height = 36
    Caption = 'Itens'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    OnClick = b_itensClick
  end
  object edit_reparo: TDBEdit [23]
    Left = 8
    Top = 27
    Width = 156
    Height = 26
    DataField = 'num_reparo'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnKeyDown = edit_reparoKeyDown
  end
  inherited q_dados: TFDQuery
    SQL.Strings = (
      'SELECT R.*,'
      #9#9'c.nome as cliente'
      'FROM REPAROS r'
      ''
      'INNER JOIN clientes c ON r.cod_cliente = c.cod_cliente'
      'ORDER BY r.data_recebido')
    Top = 352
    object q_dadoscod_reparo: TFDAutoIncField
      Alignment = taLeftJustify
      FieldName = 'cod_reparo'
      Origin = 'cod_reparo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_dadoscod_cliente: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
      Required = True
    end
    object q_dadosprob_citados: TMemoField
      FieldName = 'prob_citados'
      Origin = 'prob_citados'
      BlobType = ftMemo
    end
    object q_dadosprob_encontrados: TMemoField
      FieldName = 'prob_encontrados'
      Origin = 'prob_encontrados'
      BlobType = ftMemo
    end
    object q_dadosdata_recebido: TSQLTimeStampField
      FieldName = 'data_recebido'
      Origin = 'data_recebido'
      Required = True
      EditMask = '99/99/9999;1;_'
    end
    object q_dadosdata_entrega: TSQLTimeStampField
      FieldName = 'data_entrega'
      Origin = 'data_entrega'
      EditMask = '99/99/9999;1;_'
    end
    object q_dadosstatus: TStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      FixedChar = True
      Size = 1
    end
    object q_dadosnum_reparo: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'num_reparo'
      Origin = 'num_reparo'
      Required = True
    end
  end
  inherited ds_dados: TDataSource
    Top = 352
  end
  object q_clientes: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select * from clientes'
      'order by nome')
    Left = 368
    Top = 232
  end
  object ds_clientes: TDataSource
    DataSet = q_clientes
    Left = 432
    Top = 232
  end
end
