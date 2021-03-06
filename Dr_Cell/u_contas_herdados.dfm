inherited f_contas_herdados: Tf_contas_herdados
  Caption = 'Cadastro de Contas'
  ClientHeight = 498
  OnCreate = FormCreate
  ExplicitHeight = 527
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Height = 217
    ExplicitHeight = 217
  end
  inherited Label1: TLabel
    Top = 264
    ExplicitTop = 264
  end
  inherited b_gravar: TButton
    Top = 223
    ExplicitTop = 223
  end
  inherited b_cancelar: TButton
    Top = 223
    ExplicitTop = 223
  end
  inherited edit_pesquisa: TEdit
    Top = 289
    ExplicitTop = 289
  end
  inherited b_incluir: TButton
    Top = 301
    ExplicitTop = 301
  end
  inherited b_alterar: TButton
    Top = 356
    ExplicitTop = 356
  end
  inherited b_excluir: TButton
    Top = 411
    ExplicitTop = 411
  end
  inherited b_fechar: TButton
    Top = 462
    ExplicitTop = 462
  end
  object ts1: TPageControl [9]
    Left = 0
    Top = 0
    Width = 656
    Height = 217
    ActivePage = ts
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    object ts: TTabSheet
      Caption = 'ts'
      object Label4: TLabel
        Left = 3
        Top = 91
        Width = 76
        Height = 16
        Caption = 'Vencimento'
        FocusControl = edit_vencimento
      end
      object Label6: TLabel
        Left = 3
        Top = 137
        Width = 55
        Height = 16
        Caption = 'Pago em'
        FocusControl = edit_pago
      end
      object Label2: TLabel
        Left = 3
        Top = 49
        Width = 73
        Height = 16
        Caption = 'Num. Conta'
        FocusControl = edit_num
      end
      object edit_vencimento: TDBEdit
        Left = 3
        Top = 113
        Width = 121
        Height = 24
        DataField = 'vencimento'
        DataSource = ds_dados
        TabOrder = 2
        OnKeyDown = edit_vencimentoKeyDown
      end
      object edit_pago: TDBEdit
        Left = 3
        Top = 159
        Width = 166
        Height = 24
        DataField = 'pago_em'
        DataSource = ds_dados
        TabOrder = 3
        OnKeyDown = edit_pagoKeyDown
      end
      object edit_num: TDBEdit
        Left = 3
        Top = 65
        Width = 134
        Height = 24
        DataField = 'num_conta'
        DataSource = ds_dados
        TabOrder = 1
        OnKeyDown = edit_numKeyDown
      end
      object rad: TDBRadioGroup
        Left = 3
        Top = 3
        Width = 222
        Height = 41
        Caption = 'Tipo'
        Columns = 2
        DataField = 'tipo'
        DataSource = ds_dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Items.Strings = (
          'P - Pagar'
          'R - Receber')
        ParentFont = False
        TabOrder = 0
      end
    end
    object TTabSheet
      ImageIndex = 1
      object Label7: TLabel
        Left = 0
        Top = 3
        Width = 63
        Height = 16
        Caption = 'Categoria'
      end
      object Label8: TLabel
        Left = 312
        Top = 3
        Width = 73
        Height = 16
        Caption = 'Fornecedor'
      end
      object Label9: TLabel
        Left = 3
        Top = 56
        Width = 77
        Height = 16
        Caption = 'Observa'#231#227'o'
        FocusControl = edit_obs
      end
      object cb1: TDBLookupComboBox
        Left = 0
        Top = 22
        Width = 281
        Height = 24
        DataField = 'cod_categoria'
        DataSource = ds_dados
        KeyField = 'cod_categoria'
        ListField = 'descricao'
        ListSource = ds_categoria
        TabOrder = 0
        OnKeyDown = cb1KeyDown
      end
      object cb2: TDBLookupComboBox
        Left = 312
        Top = 25
        Width = 313
        Height = 24
        DataField = 'cod_fornecedor'
        DataSource = ds_dados
        KeyField = 'cod_fornecedor'
        ListField = 'nome'
        ListSource = ds_fornecedores
        TabOrder = 1
        OnKeyDown = cb2KeyDown
      end
      object edit_obs: TDBMemo
        Left = 3
        Top = 75
        Width = 622
        Height = 102
        DataField = 'observacao'
        DataSource = ds_dados
        TabOrder = 2
        OnKeyDown = edit_obsKeyDown
      end
    end
  end
  object b_itens: TButton [10]
    Left = 193
    Top = 223
    Width = 75
    Height = 35
    Caption = 'Itens'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = b_itensClick
  end
  inherited grid_dados: TDBGrid
    Top = 289
    Height = 208
    TabOrder = 9
    Columns = <
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'cod_conta'
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
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'num_conta'
        Title.Caption = 'Num. Conta'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vencimento'
        Title.Caption = 'Vencimento'
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
        FieldName = 'tipo'
        Title.Caption = 'Tipo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'cod_fornecedor'
        Title.Caption = 'Fornecedor'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  inherited q_dados: TFDQuery
    SQL.Strings = (
      'SELECT C.*,'
      #9#9'fn.nome as fornecedor'
      'FROM contas C'
      'INNER JOIN categorias CT ON CT.cod_categoria = C.cod_categoria'
      
        'INNER JOIN fornecedores FN ON FN.cod_fornecedor = C.cod_forneced' +
        'or'
      'ORDER BY C.vencimento')
    Top = 356
    object q_dadoscod_conta: TFDAutoIncField
      FieldName = 'cod_conta'
      Origin = 'cod_conta'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_dadostipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object q_dadosvencimento: TSQLTimeStampField
      FieldName = 'vencimento'
      Origin = 'vencimento'
      EditMask = '99/99/9999;1;_'
    end
    object q_dadoscod_categoria: TIntegerField
      FieldName = 'cod_categoria'
      Origin = 'cod_categoria'
      Required = True
    end
    object q_dadoscod_fornecedor: TIntegerField
      FieldName = 'cod_fornecedor'
      Origin = 'cod_fornecedor'
      Required = True
    end
    object q_dadosobservacao: TMemoField
      FieldName = 'observacao'
      Origin = 'observacao'
      BlobType = ftMemo
    end
    object q_dadospago_em: TSQLTimeStampField
      FieldName = 'pago_em'
      Origin = 'pago_em'
      EditMask = '99/99/9999;1;_'
    end
    object q_dadosnum_conta: TIntegerField
      FieldName = 'num_conta'
      Origin = 'num_conta'
      Required = True
    end
  end
  inherited ds_dados: TDataSource
    Top = 356
  end
  object q_categoria: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select * from categorias'
      'order by descricao')
    Left = 320
    Top = 224
  end
  object ds_categoria: TDataSource
    DataSet = q_categoria
    Left = 368
    Top = 224
  end
  object ds_fornecedores: TDataSource
    DataSet = q_fornecedor
    Left = 536
    Top = 232
  end
  object q_fornecedor: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select * from fornecedores '
      'order by nome')
    Left = 456
    Top = 232
  end
end
