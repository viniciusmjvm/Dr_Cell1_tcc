object f_itens_reparo: Tf_itens_reparo
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Itens do Reparo'
  ClientHeight = 421
  ClientWidth = 700
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = -2
    Top = -4
    Width = 606
    Height = 145
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 103
    Height = 16
    Caption = 'Itens da venda:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object l_itens_reparo: TLabel
    Left = 117
    Top = 8
    Width = 4
    Height = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 227
    Top = 374
    Width = 48
    Height = 23
    Caption = 'Qtd :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 438
    Top = 374
    Width = 56
    Height = 23
    Caption = 'Total:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 343
    Top = 380
    Width = 19
    Height = 16
    Caption = '(x)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object b_incluir: TButton
    Left = 610
    Top = 186
    Width = 75
    Height = 35
    Caption = 'Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = b_incluirClick
  end
  object grid_dados: TDBGrid
    Left = 4
    Top = 145
    Width = 600
    Height = 218
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'cod_itens_reparos'
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
        FieldName = 'cod_peca'
        Title.Caption = 'Pe'#231'a'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 112
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'valor'
        Title.Caption = 'Valor'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 50
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'quantidade'
        Title.Caption = 'Qde.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 62
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'sub_total'
        Title.Caption = 'Sub Total'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 81
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'descr'
        Title.Caption = 'Desconto'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 79
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'total'
        Title.Caption = 'Total'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 60
        Visible = True
      end>
  end
  object b_excluir: TButton
    Left = 610
    Top = 240
    Width = 75
    Height = 35
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = b_excluirClick
  end
  object edit_qtd: TDBEdit
    Left = 281
    Top = 371
    Width = 60
    Height = 36
    Color = clWhite
    DataField = 'total_itens'
    DataSource = ds_pesq
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'Engravers MT'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    Font.Quality = fqProof
    ParentFont = False
    TabOrder = 3
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 30
    Width = 601
    Height = 113
    TabOrder = 4
    object TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label15: TLabel
        Left = 446
        Top = 24
        Width = 70
        Height = 18
        Caption = 'Sub Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 369
        Top = 24
        Width = 41
        Height = 18
        Caption = 'Qntd.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 275
        Top = 24
        Width = 80
        Height = 18
        Caption = 'Valor Unit.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 130
        Top = 24
        Width = 74
        Height = 18
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 16
        Top = 19
        Width = 36
        Height = 18
        Caption = 'Pe'#231'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 3
        Top = 3
        Width = 73
        Height = 18
        Caption = 'Codigo do'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object b_produto: TSpeedButton
        Left = 82
        Top = 48
        Width = 23
        Height = 22
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = b_produtoClick
      end
      object edit_sub_total: TEdit
        Left = 446
        Top = 48
        Width = 73
        Height = 24
        Color = clMenu
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object edit_quantidade: TEdit
        Left = 369
        Top = 48
        Width = 47
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnChange = edit_quantidadeChange
      end
      object edit_valor: TEdit
        Left = 281
        Top = 48
        Width = 53
        Height = 24
        Color = clMenu
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object edit_descricao_peca: TEdit
        Left = 111
        Top = 48
        Width = 158
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object edit_cod_peca: TEdit
        Left = 16
        Top = 43
        Width = 52
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnChange = edit_cod_pecaChange
      end
    end
    object TabSheet2: TTabSheet
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label14: TLabel
        Left = 123
        Top = 33
        Width = 14
        Height = 16
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 3
        Top = 33
        Width = 17
        Height = 16
        Caption = 'R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 86
        Top = 3
        Width = 69
        Height = 18
        Caption = 'Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 278
        Top = 3
        Width = 38
        Height = 18
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edit_desc_p: TEdit
        Left = 143
        Top = 27
        Width = 87
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = edit_desc_pChange
      end
      object edit_desc_r: TEdit
        Left = 30
        Top = 27
        Width = 87
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnChange = edit_desc_rChange
      end
      object edit_total: TEdit
        Left = 260
        Top = 27
        Width = 87
        Height = 24
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object edit_valor_total: TDBEdit
    Left = 500
    Top = 371
    Width = 104
    Height = 36
    Color = clWhite
    DataField = 'valor_total'
    DataSource = ds_pesq
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'Engravers MT'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    Font.Quality = fqProof
    ParentFont = False
    TabOrder = 5
  end
  object q_dados: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select * from itens_reparos'
      'where cod_reparo = cod_reparo '
      'order by cod_itens_reparos')
    Left = 176
    Top = 224
    object q_dadoscod_itens_reparos: TFDAutoIncField
      FieldName = 'cod_itens_reparos'
      Origin = 'cod_itens_reparos'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_dadoscod_peca: TIntegerField
      FieldName = 'cod_peca'
      Origin = 'cod_peca'
    end
    object q_dadoscod_reparo: TIntegerField
      FieldName = 'cod_reparo'
      Origin = 'cod_reparo'
    end
    object q_dadosquantidade: TIntegerField
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object q_dadosvalor: TFloatField
      FieldName = 'valor'
      Origin = 'valor'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object q_dadossub_total: TFloatField
      FieldName = 'sub_total'
      Origin = 'sub_total'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object q_dadosdescr: TFloatField
      FieldName = 'descr'
      Origin = 'descr'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object q_dadostotal: TFloatField
      FieldName = 'total'
      Origin = 'total'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object ds_dados: TDataSource
    DataSet = q_dados
    Left = 248
    Top = 224
  end
  object pesq: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select '
      ' sum(quantidade) as total_itens,'
      ' sum(total) as valor_total'
      ' '
      ' from itens_reparos')
    Left = 144
    Top = 312
    object pesqtotal_itens: TIntegerField
      Alignment = taCenter
      FieldName = 'total_itens'
      Origin = 'total_itens'
      ReadOnly = True
    end
    object pesqvalor_total: TFloatField
      Alignment = taCenter
      FieldName = 'valor_total'
      Origin = 'valor_total'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object ds_pesq: TDataSource
    DataSet = pesq
    Left = 192
    Top = 312
  end
end
