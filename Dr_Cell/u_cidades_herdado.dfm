inherited f_cidades_herdado: Tf_cidades_herdado
  Caption = 'Cadastro de Cidades - Herdado'
  ClientHeight = 396
  ClientWidth = 533
  ExplicitWidth = 539
  ExplicitHeight = 425
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Left = 0
    Width = 530
    Height = 121
    ExplicitLeft = 0
    ExplicitWidth = 530
    ExplicitHeight = 121
  end
  inherited Label1: TLabel
    Top = 168
    ExplicitTop = 168
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 8
    Width = 35
    Height = 16
    Caption = 'Nome'
    FocusControl = edit_nome
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [3]
    Left = 419
    Top = 8
    Width = 14
    Height = 16
    Caption = 'UF'
    FocusControl = edit_uf
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [4]
    Left = 8
    Top = 54
    Width = 23
    Height = 16
    Caption = 'CEP'
    FocusControl = edit_cep
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited b_gravar: TButton
    Top = 127
    ExplicitTop = 127
  end
  inherited b_cancelar: TButton
    Top = 127
    TabOrder = 8
    ExplicitTop = 127
  end
  inherited edit_pesquisa: TEdit
    Top = 193
    Width = 449
    TabOrder = 9
    ExplicitTop = 193
    ExplicitWidth = 449
  end
  inherited b_incluir: TButton
    Left = 455
    Top = 189
    TabOrder = 1
    ExplicitLeft = 455
    ExplicitTop = 189
  end
  inherited b_alterar: TButton
    Left = 455
    Top = 244
    TabOrder = 2
    ExplicitLeft = 455
    ExplicitTop = 244
  end
  inherited b_excluir: TButton
    Left = 455
    Top = 299
    TabOrder = 3
    ExplicitLeft = 455
    ExplicitTop = 299
  end
  inherited b_fechar: TButton
    Left = 455
    Top = 350
    TabOrder = 4
    ExplicitLeft = 455
    ExplicitTop = 350
  end
  inherited grid_dados: TDBGrid
    Top = 225
    Width = 449
    Height = 176
    TabOrder = 10
    Columns = <
      item
        Expanded = False
        FieldName = 'cod_cidade'
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
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'uf'
        Title.Caption = 'UF'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cep_padrao'
        Title.Caption = 'CEP'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end>
  end
  object edit_nome: TDBEdit [13]
    Left = 8
    Top = 27
    Width = 393
    Height = 24
    DataField = 'nome'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnKeyDown = edit_nomeKeyDown
  end
  object edit_uf: TDBEdit [14]
    Left = 419
    Top = 27
    Width = 46
    Height = 24
    DataField = 'uf'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnKeyDown = edit_ufKeyDown
  end
  object edit_cep: TDBEdit [15]
    Left = 8
    Top = 76
    Width = 138
    Height = 24
    DataField = 'cep_padrao'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnKeyDown = edit_cepKeyDown
  end
  inherited q_dados: TFDQuery
    SQL.Strings = (
      'select * from cidades'
      'order by nome')
    Top = 260
    object q_dadosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 100
    end
    object q_dadosuf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Required = True
      FixedChar = True
      Size = 2
    end
    object q_dadoscep_padrao: TStringField
      FieldName = 'cep_padrao'
      Origin = 'cep_padrao'
      EditMask = '99.999-999;0;_'
      FixedChar = True
      Size = 8
    end
    object q_dadoscod_cidade: TFDAutoIncField
      Alignment = taLeftJustify
      FieldName = 'cod_cidade'
      Origin = 'cod_cidade'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  inherited ds_dados: TDataSource
    Top = 260
  end
end
