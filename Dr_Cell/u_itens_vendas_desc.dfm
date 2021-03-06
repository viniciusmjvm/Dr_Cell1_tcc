object f_itens_vendas_desc: Tf_itens_vendas_desc
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Desconto:'
  ClientHeight = 277
  ClientWidth = 294
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
    Left = -6
    Top = 0
    Width = 296
    Height = 281
  end
  object Label1: TLabel
    Left = 8
    Top = 64
    Width = 70
    Height = 18
    Caption = 'Sub Total'
    FocusControl = edit_sub
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 112
    Width = 74
    Height = 18
    Caption = 'Desconto:'
    FocusControl = edit_desc_r
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 160
    Width = 43
    Height = 18
    Caption = 'Total:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 88
    Top = 112
    Width = 21
    Height = 18
    Caption = 'R$'
    FocusControl = edit_desc_r
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 184
    Top = 112
    Width = 18
    Height = 18
    Caption = '%'
    FocusControl = edit_desc_r
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 24
    Width = 51
    Height = 18
    Caption = 'Venda:'
    FocusControl = edit_sub
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object l_itens_venda_desc: TLabel
    Left = 65
    Top = 24
    Width = 5
    Height = 18
    FocusControl = edit_sub
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 0
    Top = 32
    Width = 290
    Height = 18
    Caption = '_____________________________'
    FocusControl = edit_sub
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = -6
    Top = 4
    Width = 296
    Height = 281
  end
  object edit_sub: TDBEdit
    Left = 85
    Top = 64
    Width = 92
    Height = 26
    Color = clMenu
    DataField = 'total_liquido'
    DataSource = ds_pesq
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object edit_desc_r: TDBEdit
    Left = 115
    Top = 109
    Width = 54
    Height = 26
    DataField = 'descr'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object edit_desc_p: TDBEdit
    Left = 207
    Top = 109
    Width = 65
    Height = 26
    DataField = 'descp'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object b_salvar: TBitBtn
    Left = 40
    Top = 216
    Width = 90
    Height = 40
    Caption = 'Salvar'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 3
    OnClick = b_salvarClick
  end
  object b_cancelar: TBitBtn
    Left = 136
    Top = 216
    Width = 90
    Height = 40
    Caption = 'Cancelar'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 4
    OnClick = b_cancelarClick
  end
  object edit_total: TDBEdit
    Left = 57
    Top = 161
    Width = 134
    Height = 21
    DataField = 'total'
    DataSource = ds_dados
    TabOrder = 5
  end
  object q_dados: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'SELECT d.*,'
      #9#9'i.sub_total'
      #9
      'FROM descontos d'
      
        'INNER JOIN itens_vendas i ON i.cod_itens_vendas = d.cod_itens_ve' +
        'ndas '
      '')
    Left = 248
    Top = 176
    object q_dadoscod_desconto: TFDAutoIncField
      FieldName = 'cod_desconto'
      Origin = 'cod_desconto'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_dadoscod_itens_vendas: TIntegerField
      FieldName = 'cod_itens_vendas'
      Origin = 'cod_itens_vendas'
    end
    object q_dadossub_total: TFloatField
      FieldName = 'sub_total'
      Origin = 'sub_total'
      ReadOnly = True
    end
    object q_dadosdescr: TFloatField
      FieldName = 'descr'
      Origin = 'descr'
    end
    object q_dadosdescp: TFloatField
      FieldName = 'descp'
      Origin = 'descp'
    end
    object q_dadostotal: TFloatField
      FieldName = 'total'
      Origin = 'total'
      ReadOnly = True
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
      'select sum(sub_total) as total_liquido'
      'from itens_vendas')
    Left = 192
    Top = 16
    object pesqtotal_liquido: TFloatField
      FieldName = 'total_liquido'
      Origin = 'total_liquido'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object ds_pesq: TDataSource
    DataSet = pesq
    Left = 248
    Top = 24
  end
end
