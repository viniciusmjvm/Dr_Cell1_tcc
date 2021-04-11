inherited f_categorias_herdado: Tf_categorias_herdado
  Caption = 'Cadastro de Categorias'
  ClientHeight = 371
  ClientWidth = 468
  ExplicitWidth = 474
  ExplicitHeight = 400
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Left = -3
    Width = 476
    Height = 73
    ExplicitLeft = -3
    ExplicitWidth = 476
    ExplicitHeight = 73
  end
  inherited Label1: TLabel
    Top = 120
    ExplicitTop = 120
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 8
    Width = 63
    Height = 16
    Caption = 'Descri'#231#227'o'
    FocusControl = edit_descricao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited b_gravar: TButton
    Top = 79
    ExplicitTop = 79
  end
  inherited b_cancelar: TButton
    Top = 79
    TabOrder = 6
    ExplicitTop = 79
  end
  inherited edit_pesquisa: TEdit
    Top = 145
    Width = 369
    TabOrder = 7
    ExplicitTop = 145
    ExplicitWidth = 369
  end
  inherited b_incluir: TButton
    Left = 381
    Top = 169
    TabOrder = 1
    ExplicitLeft = 381
    ExplicitTop = 169
  end
  inherited b_alterar: TButton
    Left = 381
    Top = 224
    TabOrder = 2
    ExplicitLeft = 381
    ExplicitTop = 224
  end
  inherited b_excluir: TButton
    Left = 381
    Top = 279
    TabOrder = 3
    ExplicitLeft = 381
    ExplicitTop = 279
  end
  inherited b_fechar: TButton
    Left = 381
    Top = 330
    TabOrder = 4
    ExplicitLeft = 381
    ExplicitTop = 330
  end
  inherited grid_dados: TDBGrid
    Top = 177
    Width = 369
    Height = 192
    TabOrder = 8
    Columns = <
      item
        Expanded = False
        FieldName = 'cod_categoria'
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
        Width = 280
        Visible = True
      end>
  end
  object edit_descricao: TDBEdit [11]
    Left = 6
    Top = 30
    Width = 363
    Height = 24
    DataField = 'descricao'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnKeyDown = edit_descricaoKeyDown
  end
  inherited q_dados: TFDQuery
    SQL.Strings = (
      'select * from categorias'
      'order by descricao')
    Top = 212
    object q_dadosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 100
    end
    object q_dadoscod_categoria: TFDAutoIncField
      Alignment = taLeftJustify
      FieldName = 'cod_categoria'
      Origin = 'cod_categoria'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  inherited ds_dados: TDataSource
    Top = 212
  end
end
