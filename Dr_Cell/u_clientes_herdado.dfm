inherited f_clientes_herdado: Tf_clientes_herdado
  Caption = 'Cadastro de Clientes'
  ClientHeight = 583
  OnCreate = FormCreate
  ExplicitHeight = 612
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Height = 272
    ExplicitHeight = 272
  end
  inherited Label1: TLabel
    Top = 317
    ExplicitTop = 317
  end
  inherited b_gravar: TButton
    Top = 278
    ExplicitTop = 278
  end
  inherited b_cancelar: TButton
    Top = 278
    TabOrder = 5
    ExplicitTop = 278
  end
  inherited edit_pesquisa: TEdit
    Top = 342
    TabOrder = 6
    ExplicitTop = 342
  end
  inherited b_incluir: TButton
    Top = 374
    TabOrder = 1
    ExplicitTop = 374
  end
  inherited b_alterar: TButton
    Top = 429
    TabOrder = 2
    ExplicitTop = 429
  end
  inherited b_excluir: TButton
    Top = 484
    TabOrder = 3
    ExplicitTop = 484
  end
  inherited b_fechar: TButton
    Top = 535
    TabOrder = 4
    ExplicitTop = 535
  end
  inherited grid_dados: TDBGrid
    Top = 374
    Height = 201
    Columns = <
      item
        Expanded = False
        FieldName = 'cod_cliente'
        Title.Caption = 'C'#243'd.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
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
        FieldName = 'cpf'
        Title.Caption = 'CPF'
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
        Width = 152
        Visible = True
      end>
  end
  object PageControl1: TPageControl [10]
    Left = 0
    Top = 0
    Width = 593
    Height = 272
    ActivePage = TabSheet2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    object TabSheet1: TTabSheet
      Caption = 'Dados'
      object Label2: TLabel
        Left = 3
        Top = -5
        Width = 43
        Height = 18
        Caption = 'Nome'
        FocusControl = edit_nome
      end
      object Label3: TLabel
        Left = 3
        Top = 46
        Width = 29
        Height = 18
        Caption = 'CPF'
        FocusControl = edit_cpf
      end
      object Label4: TLabel
        Left = 200
        Top = 46
        Width = 22
        Height = 18
        Caption = 'RG'
        FocusControl = edit_rg
      end
      object Label5: TLabel
        Left = 3
        Top = 102
        Width = 149
        Height = 18
        Caption = 'Data de Nascimento'
        FocusControl = edit_data
      end
      object edit_nome: TDBEdit
        Left = 3
        Top = 19
        Width = 500
        Height = 26
        DataField = 'nome'
        DataSource = ds_dados
        TabOrder = 0
        OnKeyDown = edit_nomeKeyDown
      end
      object edit_cpf: TDBEdit
        Left = 3
        Top = 70
        Width = 147
        Height = 26
        DataField = 'cpf'
        DataSource = ds_dados
        TabOrder = 1
        OnKeyDown = edit_cpfKeyDown
      end
      object edit_rg: TDBEdit
        Left = 200
        Top = 70
        Width = 238
        Height = 26
        DataField = 'rg'
        DataSource = ds_dados
        TabOrder = 2
        OnKeyPress = edit_rgKeyPress
      end
      object edit_data: TDBEdit
        Left = 3
        Top = 126
        Width = 446
        Height = 26
        DataField = 'data_nascimento'
        DataSource = ds_dados
        TabOrder = 3
        OnKeyDown = edit_dataKeyDown
      end
      object sexo: TDBRadioGroup
        Left = 3
        Top = 168
        Width = 206
        Height = 55
        Caption = 'SEXO'
        Columns = 2
        DataField = 'sexo'
        DataSource = ds_dados
        Items.Strings = (
          'Masculino'
          'Feminino')
        TabOrder = 4
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Contato'
      ImageIndex = 1
      object Label6: TLabel
        Left = 3
        Top = 3
        Width = 60
        Height = 16
        Caption = 'Endere'#231'o'
        FocusControl = edit_endereco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 3
        Top = 49
        Width = 39
        Height = 16
        Caption = 'Bairro'
        FocusControl = edit_bairro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 283
        Top = 95
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
      object Label9: TLabel
        Left = 3
        Top = 141
        Width = 55
        Height = 16
        Caption = 'Telefone'
        FocusControl = edit_telefone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 283
        Top = 143
        Width = 44
        Height = 16
        Caption = 'Celular'
        FocusControl = edit_celular
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 3
        Top = 187
        Width = 38
        Height = 16
        Caption = 'E-mail'
        FocusControl = edit_email
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 3
        Top = 95
        Width = 43
        Height = 16
        Caption = 'Cidade'
        FocusControl = edit_cep
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edit_endereco: TDBEdit
        Left = 3
        Top = 22
        Width = 500
        Height = 24
        DataField = 'endereco'
        DataSource = ds_dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object edit_bairro: TDBEdit
        Left = 3
        Top = 68
        Width = 500
        Height = 24
        DataField = 'bairro'
        DataSource = ds_dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object edit_cep: TDBEdit
        Left = 283
        Top = 113
        Width = 108
        Height = 24
        DataField = 'cep'
        DataSource = ds_dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object edit_telefone: TDBEdit
        Left = 3
        Top = 157
        Width = 262
        Height = 24
        DataField = 'telefone'
        DataSource = ds_dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object edit_celular: TDBEdit
        Left = 283
        Top = 162
        Width = 220
        Height = 24
        DataField = 'celular'
        DataSource = ds_dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnKeyDown = edit_celularKeyDown
      end
      object edit_email: TDBEdit
        Left = 3
        Top = 209
        Width = 500
        Height = 24
        DataField = 'email'
        DataSource = ds_dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnKeyDown = edit_emailKeyDown
      end
      object cb1: TDBLookupComboBox
        Left = 3
        Top = 111
        Width = 262
        Height = 24
        DataField = 'cod_cidade'
        DataSource = ds_dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        KeyField = 'cod_cidade'
        ListField = 'nome'
        ListSource = ds_cidades
        ParentFont = False
        TabOrder = 2
        OnKeyDown = cb1KeyDown
      end
    end
  end
  inherited q_dados: TFDQuery
    SQL.Strings = (
      'SELECT c.*,'
      #9#9'ci.nome as cidade'
      'FROM clientes c'
      ''
      'INNER JOIN cidades ci ON c.cod_cidade = ci.cod_cidade'
      'ORDER BY c.nome')
    Left = 344
    Top = 387
    object q_dadoscod_cliente: TFDAutoIncField
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_dadosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 100
    end
    object q_dadoscpf: TStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      Required = True
      EditMask = '999.999.999-99;0;_'
      FixedChar = True
      Size = 11
    end
    object q_dadosrg: TStringField
      FieldName = 'rg'
      Origin = 'rg'
      Size = 18
    end
    object q_dadosdata_nascimento: TSQLTimeStampField
      FieldName = 'data_nascimento'
      Origin = 'data_nascimento'
      Required = True
      EditMask = '99/99/9999;1;_'
    end
    object q_dadossexo: TStringField
      FieldName = 'sexo'
      Origin = 'sexo'
      FixedChar = True
      Size = 1
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
      EditMask = '99.999-999;0;_'
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
    Left = 224
    Top = 387
  end
  object q_cidades: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select * from cidades'
      'order by nome')
    Left = 416
    Top = 128
  end
  object ds_cidades: TDataSource
    DataSet = q_cidades
    Left = 488
    Top = 136
  end
end
