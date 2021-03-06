object f_itens_contas: Tf_itens_contas
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Itens da Conta'
  ClientHeight = 333
  ClientWidth = 554
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
    Left = 0
    Top = -6
    Width = 551
    Height = 97
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 101
    Height = 16
    Caption = 'Itens da Conta:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 45
    Width = 52
    Height = 16
    Caption = 'Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 319
    Top = 45
    Width = 74
    Height = 16
    Caption = 'Quantidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 216
    Top = 45
    Width = 88
    Height = 16
    Caption = 'Valor Unitario'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object b_produto: TSpeedButton
    Left = 55
    Top = 65
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
  object l_itens_conta: TLabel
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
    Left = 199
    Top = 287
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
    Left = 340
    Top = 287
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
    Left = 315
    Top = 293
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
    Left = 476
    Top = 119
    Width = 75
    Height = 35
    Caption = 'Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = b_incluirClick
    OnKeyDown = b_incluirKeyDown
  end
  object grid_dados: TDBGrid
    Left = 8
    Top = 97
    Width = 462
    Height = 178
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'cod_itens_contas'
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
        FieldName = 'cod_produto'
        Title.Caption = 'Produto'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'valor'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Title.Caption = 'Qtd.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 40
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'valor_total'
        Title.Caption = 'Total'
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
        Visible = True
      end>
  end
  object b_fechar: TButton
    Left = 476
    Top = 218
    Width = 75
    Height = 35
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = b_fecharClick
  end
  object b_excluir: TButton
    Left = 476
    Top = 169
    Width = 75
    Height = 35
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = b_excluirClick
  end
  object edit_cod_produto: TEdit
    Left = 8
    Top = 67
    Width = 41
    Height = 21
    TabOrder = 0
    OnChange = edit_cod_produtoChange
    OnKeyDown = edit_cod_produtoKeyDown
    OnKeyPress = edit_cod_produtoKeyPress
  end
  object edit_descricao_produto: TEdit
    Left = 84
    Top = 63
    Width = 109
    Height = 24
    Color = clMenu
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object edit_valor: TEdit
    Left = 216
    Top = 67
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
    TabOrder = 7
  end
  object edit_quantidade: TEdit
    Left = 327
    Top = 67
    Width = 66
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnKeyDown = edit_quantidadeKeyDown
    OnKeyPress = edit_quantidadeKeyPress
  end
  object edit_qtd: TDBEdit
    Left = 253
    Top = 284
    Width = 60
    Height = 37
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
    TabOrder = 8
  end
  object edit_total: TDBEdit
    Left = 401
    Top = 284
    Width = 104
    Height = 37
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
    TabOrder = 9
  end
  object q_dados: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select * from itens_contas'
      'order by cod_itens_contas'
      ''
      ''
      ''
      'select * from itens_contas'
      'where cod_conta = cod_conta'
      'order by cod_itens_contas')
    Left = 208
    Top = 168
    object q_dadoscod_itens_contas: TFDAutoIncField
      FieldName = 'cod_itens_contas'
      Origin = 'cod_itens_contas'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_dadoscod_produto: TIntegerField
      Alignment = taCenter
      FieldName = 'cod_produto'
      Origin = 'cod_produto'
      Required = True
    end
    object q_dadosquantidade: TIntegerField
      Alignment = taCenter
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Required = True
    end
    object q_dadosvalor: TFloatField
      Alignment = taLeftJustify
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object q_dadoscod_conta: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'cod_conta'
      Origin = 'cod_conta'
      Required = True
    end
    object q_dadosvalor_total: TFloatField
      FieldName = 'valor_total'
      Origin = 'valor_total'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object ds_dados: TDataSource
    DataSet = q_dados
    Left = 280
    Top = 176
  end
  object pesq: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select '
      ' sum(quantidade) as total_itens,'
      ' sum(valor_total) as valor_total'
      ' from itens_contas')
    Left = 16
    Top = 288
  end
  object ds_pesq: TDataSource
    DataSet = pesq
    Left = 72
    Top = 288
  end
end
