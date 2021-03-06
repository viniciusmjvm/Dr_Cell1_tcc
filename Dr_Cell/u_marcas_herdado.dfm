inherited f_marcas_herdado: Tf_marcas_herdado
  Caption = 'Cadastro de Marcas'
  ClientHeight = 367
  ClientWidth = 430
  ExplicitWidth = 436
  ExplicitHeight = 396
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Left = 0
    Width = 433
    Height = 73
    ExplicitLeft = 0
    ExplicitWidth = 433
    ExplicitHeight = 73
  end
  inherited Label1: TLabel
    Top = 120
    ExplicitTop = 120
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 16
    Width = 35
    Height = 16
    Caption = 'Nome'
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
    ExplicitTop = 79
  end
  inherited edit_pesquisa: TEdit
    Top = 145
    Width = 341
    ExplicitTop = 145
    ExplicitWidth = 341
  end
  inherited b_incluir: TButton
    Left = 347
    Top = 203
    ExplicitLeft = 347
    ExplicitTop = 203
  end
  inherited b_alterar: TButton
    Left = 347
    Top = 243
    ExplicitLeft = 347
    ExplicitTop = 243
  end
  inherited b_excluir: TButton
    Left = 347
    Top = 284
    ExplicitLeft = 347
    ExplicitTop = 284
  end
  inherited b_fechar: TButton
    Left = 347
    Top = 326
    ExplicitLeft = 347
    ExplicitTop = 326
  end
  inherited grid_dados: TDBGrid
    Top = 177
    Width = 341
    Height = 192
    Columns = <
      item
        Expanded = False
        FieldName = 'cod_marca'
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
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 250
        Visible = True
      end>
  end
  object edit_nome: TDBEdit [11]
    Left = 8
    Top = 35
    Width = 333
    Height = 24
    DataField = 'nome'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnKeyDown = edit_nomeKeyDown
  end
  inherited q_dados: TFDQuery
    SQL.Strings = (
      'select * from marcas'
      'order by nome')
    Left = 248
    Top = 224
    object q_dadosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 100
    end
    object q_dadoscod_marca: TFDAutoIncField
      FieldName = 'cod_marca'
      Origin = 'cod_marca'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  inherited ds_dados: TDataSource
    Left = 176
    Top = 224
  end
end
