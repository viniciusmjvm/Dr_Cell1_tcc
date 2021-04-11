inherited f_fornecedores_herdado: Tf_fornecedores_herdado
  Caption = 'Cadastro de fornecedor'
  ClientHeight = 485
  ClientWidth = 662
  OnCreate = FormCreate
  ExplicitTop = -60
  ExplicitWidth = 668
  ExplicitHeight = 514
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Left = -3
    Top = -4
    Width = 648
    Height = 197
    ExplicitLeft = -3
    ExplicitTop = -4
    ExplicitWidth = 648
    ExplicitHeight = 197
  end
  inherited Label1: TLabel
    Left = 0
    Top = 240
    ExplicitLeft = 0
    ExplicitTop = 240
  end
  inherited b_gravar: TButton
    Left = 0
    Top = 199
    ExplicitLeft = 0
    ExplicitTop = 199
  end
  inherited b_cancelar: TButton
    Left = 81
    Top = 199
    ExplicitLeft = 81
    ExplicitTop = 199
  end
  inherited edit_pesquisa: TEdit
    Top = 265
    ExplicitTop = 265
  end
  inherited b_incluir: TButton
    Top = 281
    ExplicitTop = 281
  end
  inherited b_alterar: TButton
    Top = 340
    ExplicitTop = 340
  end
  inherited b_excluir: TButton
    Top = 395
    ExplicitTop = 395
  end
  inherited b_fechar: TButton
    Top = 446
    ExplicitTop = 446
  end
  inherited grid_dados: TDBGrid
    Top = 297
    Columns = <
      item
        Expanded = False
        FieldName = 'cod_fornecedor'
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
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'celular'
        Title.Caption = 'Celular'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cod_cidade'
        Title.Caption = 'Cidade'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end>
  end
  object PageControl1: TPageControl [10]
    Left = -3
    Top = 0
    Width = 648
    Height = 193
    ActivePage = Contato
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    object TabSheet1: TTabSheet
      Caption = 'Dados'
      object Label2: TLabel
        Left = 3
        Top = 0
        Width = 35
        Height = 16
        Caption = 'nome'
        FocusControl = edit_nome
      end
      object Label3: TLabel
        Left = 3
        Top = 52
        Width = 27
        Height = 16
        Caption = 'cnpj'
        FocusControl = edit_cnpj
      end
      object Label4: TLabel
        Left = 3
        Top = 104
        Width = 73
        Height = 16
        Caption = 'cod_cidade'
      end
      object Label5: TLabel
        Left = 240
        Top = 104
        Width = 23
        Height = 16
        Caption = 'cep'
        FocusControl = edit_cep
      end
      object edit_nome: TDBEdit
        Left = 3
        Top = 22
        Width = 500
        Height = 24
        DataField = 'nome'
        DataSource = ds_dados
        TabOrder = 0
        OnKeyDown = edit_nomeKeyDown
      end
      object edit_cnpj: TDBEdit
        Left = 3
        Top = 74
        Width = 212
        Height = 24
        DataField = 'cnpj'
        DataSource = ds_dados
        TabOrder = 1
        OnKeyDown = edit_cnpjKeyDown
      end
      object edit_cep: TDBEdit
        Left = 240
        Top = 126
        Width = 108
        Height = 24
        DataField = 'cep'
        DataSource = ds_dados
        TabOrder = 3
        OnKeyDown = edit_cepKeyDown
      end
      object cb1: TDBLookupComboBox
        Left = 3
        Top = 126
        Width = 214
        Height = 24
        DataField = 'cod_cidade'
        DataSource = ds_dados
        KeyField = 'cod_cidade'
        ListField = 'nome'
        ListSource = ds_cidades
        TabOrder = 2
        OnKeyDown = cb1KeyDown
      end
    end
    object Contato: TTabSheet
      Caption = 'Contato'
      ImageIndex = 1
      object Label6: TLabel
        Left = 0
        Top = 3
        Width = 61
        Height = 16
        Caption = 'endereco'
        FocusControl = edit_endereco
      end
      object Label8: TLabel
        Left = 427
        Top = 3
        Width = 39
        Height = 16
        Caption = 'bairro'
        FocusControl = edit_bairro
      end
      object Label9: TLabel
        Left = 3
        Top = 55
        Width = 54
        Height = 16
        Caption = 'telefone'
        FocusControl = edit_telefone
      end
      object Label10: TLabel
        Left = 264
        Top = 55
        Width = 43
        Height = 16
        Caption = 'celular'
        FocusControl = edit_celular
      end
      object Label11: TLabel
        Left = 3
        Top = 107
        Width = 33
        Height = 16
        Caption = 'email'
        FocusControl = edit_email
      end
      object edit_endereco: TDBEdit
        Left = 0
        Top = 25
        Width = 409
        Height = 24
        DataField = 'endereco'
        DataSource = ds_dados
        TabOrder = 0
        OnKeyDown = edit_enderecoKeyDown
      end
      object edit_bairro: TDBEdit
        Left = 427
        Top = 25
        Width = 200
        Height = 24
        DataField = 'bairro'
        DataSource = ds_dados
        TabOrder = 1
        OnKeyDown = edit_bairroKeyDown
      end
      object edit_telefone: TDBEdit
        Left = 3
        Top = 77
        Width = 252
        Height = 24
        DataField = 'telefone'
        DataSource = ds_dados
        TabOrder = 2
        OnKeyDown = edit_telefoneKeyDown
      end
      object edit_celular: TDBEdit
        Left = 261
        Top = 77
        Width = 199
        Height = 24
        DataField = 'celular'
        DataSource = ds_dados
        TabOrder = 3
        OnKeyDown = edit_celularKeyDown
      end
      object edit_email: TDBEdit
        Left = 3
        Top = 129
        Width = 624
        Height = 24
        DataField = 'email'
        DataSource = ds_dados
        TabOrder = 4
        OnKeyDown = edit_emailKeyDown
      end
    end
  end
  inherited q_dados: TFDQuery
    SQL.Strings = (
      'SELECT f.*,'
      #9#9'ci.nome as cidade'
      'FROM fornecedores f'
      ''
      'INNER JOIN cidades ci ON f.cod_cidade = ci.cod_cidade'
      'ORDER BY f.nome')
    Left = 320
    Top = 332
    object q_dadoscod_fornecedor: TFDAutoIncField
      FieldName = 'cod_fornecedor'
      Origin = 'cod_fornecedor'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_dadosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 100
    end
    object q_dadoscnpj: TStringField
      FieldName = 'cnpj'
      Origin = 'cnpj'
      EditMask = '99.999.999/9999-99;0;_'
      FixedChar = True
      Size = 16
    end
    object q_dadosendereco: TStringField
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 100
    end
    object q_dadosbairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 100
    end
    object q_dadoscod_cidade: TIntegerField
      FieldName = 'cod_cidade'
      Origin = 'cod_cidade'
      Required = True
    end
    object q_dadoscep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      EditMask = '99.99999-999;0;_'
      FixedChar = True
      Size = 8
    end
    object q_dadostelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      EditMask = '(99)9999-9999;0;_'
      Size = 15
    end
    object q_dadoscelular: TStringField
      FieldName = 'celular'
      Origin = 'celular'
      Required = True
      EditMask = '(99)9 9999-9999;0;_'
      Size = 15
    end
    object q_dadosemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 150
    end
  end
  inherited ds_dados: TDataSource
    Left = 192
    Top = 332
  end
  object q_cidades: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select * from cidades'
      'order by nome')
    Left = 504
    Top = 104
  end
  object ds_cidades: TDataSource
    DataSet = q_cidades
    Left = 592
    Top = 104
  end
end
