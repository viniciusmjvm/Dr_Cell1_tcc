inherited f_pecas_herdados: Tf_pecas_herdados
  Caption = 'Cadastro de Pe'#231'as'
  ClientHeight = 461
  ClientWidth = 490
  ExplicitWidth = 496
  ExplicitHeight = 490
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 489
    Height = 161
    ExplicitWidth = 489
    ExplicitHeight = 161
  end
  inherited Label1: TLabel
    Top = 208
    ExplicitTop = 208
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 8
    Width = 74
    Height = 18
    Caption = 'Descri'#231#227'o'
    FocusControl = edit_descricao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 59
    Width = 40
    Height = 18
    Caption = 'Valor'
    FocusControl = edit_valor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [4]
    Left = 133
    Top = 59
    Width = 86
    Height = 18
    Caption = 'Quantidade'
    FocusControl = edit_quantidade
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel [5]
    Left = 8
    Top = 111
    Width = 102
    Height = 18
    Caption = 'Estoque Atual'
    FocusControl = edit_valor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel [6]
    Left = 133
    Top = 110
    Width = 117
    Height = 18
    Caption = 'Estoque Minimo'
    FocusControl = edit_valor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited b_gravar: TButton
    Top = 167
    ExplicitTop = 167
  end
  inherited b_cancelar: TButton
    Top = 167
    ExplicitTop = 167
  end
  inherited edit_pesquisa: TEdit
    Top = 233
    Width = 393
    ExplicitTop = 233
    ExplicitWidth = 393
  end
  inherited b_incluir: TButton
    Left = 399
    Top = 284
    ExplicitLeft = 399
    ExplicitTop = 284
  end
  inherited b_alterar: TButton
    Left = 399
    Top = 324
    ExplicitLeft = 399
    ExplicitTop = 324
  end
  inherited b_excluir: TButton
    Left = 399
    Top = 365
    ExplicitLeft = 399
    ExplicitTop = 365
  end
  inherited b_fechar: TButton
    Left = 399
    Top = 407
    ExplicitLeft = 399
    ExplicitTop = 407
  end
  inherited grid_dados: TDBGrid
    Top = 265
    Width = 393
    Columns = <
      item
        Expanded = False
        FieldName = 'cod_peca'
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
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Title.Caption = 'Valor'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qntd'
        Title.Caption = 'Qntd.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estoque_atual'
        Title.Caption = 'Estoque Atual'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object edit_descricao: TDBEdit [15]
    Left = 8
    Top = 27
    Width = 385
    Height = 26
    DataField = 'descricao'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnKeyDown = edit_descricaoKeyDown
  end
  object edit_valor: TDBEdit [16]
    Left = 8
    Top = 79
    Width = 75
    Height = 26
    DataField = 'valor'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnKeyDown = edit_valorKeyDown
  end
  object edit_quantidade: TDBEdit [17]
    Left = 116
    Top = 78
    Width = 134
    Height = 26
    DataField = 'qntd'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnKeyDown = edit_quantidadeKeyDown
  end
  object edit_atual: TDBEdit [18]
    Left = 8
    Top = 134
    Width = 75
    Height = 24
    DataField = 'estoque_atual'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
  end
  object edit_minimo: TDBEdit [19]
    Left = 133
    Top = 134
    Width = 108
    Height = 24
    DataField = 'estoque_minimo'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
  end
  inherited q_dados: TFDQuery
    SQL.Strings = (
      'select * from pecas'
      'order by descricao')
    Left = 264
    Top = 308
    object q_dadoscod_peca: TFDAutoIncField
      Alignment = taLeftJustify
      FieldName = 'cod_peca'
      Origin = 'cod_peca'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_dadosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 50
    end
    object q_dadosvalor: TFloatField
      Alignment = taLeftJustify
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object q_dadosqntd: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'qntd'
      Origin = 'qntd'
      Required = True
    end
    object q_dadosestoque_atual: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'estoque_atual'
      Origin = 'estoque_atual'
    end
    object q_dadosestoque_minimo: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'estoque_minimo'
      Origin = 'estoque_minimo'
    end
  end
  inherited ds_dados: TDataSource
    Left = 160
    Top = 300
  end
end
