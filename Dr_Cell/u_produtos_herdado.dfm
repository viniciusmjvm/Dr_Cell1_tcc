inherited f_produtos_herdado: Tf_produtos_herdado
  Caption = 'Cadastro de Produtos'
  OnCreate = FormCreate
  ExplicitWidth = 670
  ExplicitHeight = 486
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Left = 0
    ExplicitLeft = 0
  end
  inherited grid_dados: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'cod_produto'
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
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preco_venda'
        Title.Caption = 'Pre'#231'o de Venda'
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
        FieldName = 'cod_marca'
        Title.Caption = 'Marca'
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
    Left = 0
    Top = 0
    Width = 665
    Height = 173
    ActivePage = Dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    object Dados: TTabSheet
      Caption = 'Dados'
      ExplicitLeft = -1
      ExplicitTop = 19
      object Label2: TLabel
        Left = 3
        Top = -3
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
      object Label3: TLabel
        Left = 467
        Top = 3
        Width = 67
        Height = 16
        Caption = 'COD / EAN'
        FocusControl = edit_ean
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 3
        Top = 43
        Width = 98
        Height = 16
        Caption = 'Pre'#231'o de Custo'
        FocusControl = edit_custo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 180
        Top = 43
        Width = 102
        Height = 16
        Caption = 'Pre'#231'o de Venda'
        FocusControl = edit_venda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 180
        Top = 89
        Width = 90
        Height = 16
        Caption = 'estoque atual'
        FocusControl = edit_atual
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 4
        Top = 92
        Width = 101
        Height = 16
        Caption = 'estoque minimo'
        FocusControl = edit_minimo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = -668
        Top = 16
        Width = 100
        Height = 24
        DataField = 'descricao'
        TabOrder = 4
      end
      object edit_descricao: TDBEdit
        Left = 3
        Top = 16
        Width = 446
        Height = 24
        DataField = 'descricao'
        DataSource = ds_dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnKeyDown = edit_descricaoKeyDown
      end
      object edit_ean: TDBEdit
        Left = 467
        Top = 16
        Width = 166
        Height = 24
        DataField = 'cod_EAN'
        DataSource = ds_dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnKeyDown = edit_eanKeyDown
      end
      object edit_custo: TDBEdit
        Left = 3
        Top = 62
        Width = 134
        Height = 24
        DataField = 'preco_custo'
        DataSource = ds_dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnKeyDown = edit_custoKeyDown
      end
      object edit_venda: TDBEdit
        Left = 180
        Top = 65
        Width = 134
        Height = 24
        DataField = 'preco_venda'
        DataSource = ds_dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnKeyDown = edit_vendaKeyDown
      end
      object edit_atual: TDBEdit
        Left = 180
        Top = 111
        Width = 134
        Height = 24
        DataField = 'estoque_atual'
        DataSource = ds_dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnKeyDown = edit_custoKeyDown
      end
      object edit_minimo: TDBEdit
        Left = 4
        Top = 111
        Width = 134
        Height = 24
        DataField = 'estoque_minimo'
        DataSource = ds_dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnKeyDown = edit_custoKeyDown
      end
    end
    object ds: TTabSheet
      Caption = 'ds'
      ImageIndex = 1
      object Label6: TLabel
        Left = 3
        Top = 3
        Width = 51
        Height = 16
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 0
        Top = 50
        Width = 63
        Height = 16
        Caption = 'Categoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 3
        Top = 94
        Width = 40
        Height = 16
        Caption = 'Marca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cb1: TDBLookupComboBox
        Left = 0
        Top = 20
        Width = 305
        Height = 24
        DataField = 'cod_unidade'
        DataSource = ds_dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        KeyField = 'cod_unidade'
        ListField = 'descricao'
        ListSource = ds_unidades
        ParentFont = False
        TabOrder = 0
        OnKeyDown = cb1KeyDown
      end
      object cb2: TDBLookupComboBox
        Left = 0
        Top = 64
        Width = 305
        Height = 24
        DataField = 'cod_categoria'
        DataSource = ds_dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        KeyField = 'cod_categoria'
        ListField = 'descricao'
        ListSource = ds_categoria
        ParentFont = False
        TabOrder = 1
        OnKeyDown = cb2KeyDown
      end
      object cb3: TDBLookupComboBox
        Left = 0
        Top = 115
        Width = 305
        Height = 24
        DataField = 'cod_marca'
        DataSource = ds_dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        KeyField = 'cod_marca'
        ListField = 'nome'
        ListSource = ds_marca
        ParentFont = False
        TabOrder = 2
        OnKeyDown = cb3KeyDown
      end
    end
  end
  inherited q_dados: TFDQuery
    SQL.Strings = (
      'SELECT p.*,'
      #9#9'u.descricao as unidade,'
      #9#9'c.descricao as categoria,'
      #9#9'm.nome as marca'
      'FROM produtos p'
      ''
      'INNER JOIN unidades u ON p.cod_unidade = u.cod_unidade'
      'INNER JOIN categorias c ON p.cod_unidade = c.cod_categoria'
      'INNER JOIN marcas m ON p.cod_marca = m.cod_marca'
      ''
      'ORDER BY p.descricao')
    object q_dadoscod_produto: TFDAutoIncField
      Alignment = taLeftJustify
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_dadosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 100
    end
    object q_dadoscod_EAN: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'cod_EAN'
      Origin = 'cod_EAN'
    end
    object q_dadospreco_custo: TFloatField
      Alignment = taLeftJustify
      FieldName = 'preco_custo'
      Origin = 'preco_custo'
      Required = True
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object q_dadospreco_venda: TFloatField
      Alignment = taLeftJustify
      FieldName = 'preco_venda'
      Origin = 'preco_venda'
      Required = True
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object q_dadoscod_unidade: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'cod_unidade'
      Origin = 'cod_unidade'
      Required = True
    end
    object q_dadoscod_categoria: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'cod_categoria'
      Origin = 'cod_categoria'
      Required = True
    end
    object q_dadoscod_marca: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'cod_marca'
      Origin = 'cod_marca'
      Required = True
    end
    object q_dadosestoque_atual: TIntegerField
      FieldName = 'estoque_atual'
      Origin = 'estoque_atual'
    end
    object q_dadosestoque_minimo: TIntegerField
      FieldName = 'estoque_minimo'
      Origin = 'estoque_minimo'
    end
  end
  object q_unidades: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select * from unidades'
      'order by descricao')
    Left = 496
    Top = 104
  end
  object ds_unidades: TDataSource
    DataSet = q_unidades
    Left = 576
    Top = 120
  end
  object ds_categoria: TDataSource
    DataSet = q_categoria
    Left = 568
    Top = 160
  end
  object q_categoria: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select * from categorias'
      'order by descricao')
    Left = 488
    Top = 160
  end
  object ds_marca: TDataSource
    DataSet = q_marca
    Left = 568
    Top = 216
  end
  object q_marca: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select * from marcas'
      'order by nome')
    Left = 488
    Top = 216
  end
end
