object f_pagamentos: Tf_pagamentos
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Pagamento:'
  ClientHeight = 325
  ClientWidth = 312
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
    Top = 0
    Width = 313
    Height = 276
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 313
    Height = 145
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 123
      Height = 16
      Caption = 'Venda de numero: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object l_pag: TLabel
      Left = 137
      Top = 10
      Width = 4
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 0
      Top = 24
      Width = 312
      Height = 16
      Caption = '_______________________________________'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 49
      Width = 77
      Height = 16
      Caption = 'SUB TOTAL: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 76
      Width = 74
      Height = 16
      Caption = 'DESCONTO: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 106
      Width = 108
      Height = 16
      Caption = 'TOTAL A PAGAR:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edit_sub_total: TDBEdit
      Left = 122
      Top = 48
      Width = 100
      Height = 24
      DataField = 'sub_total'
      DataSource = ds_dados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edit_desc: TDBEdit
      Left = 122
      Top = 75
      Width = 100
      Height = 24
      DataField = 'descr'
      DataSource = ds_dados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edit_total: TDBEdit
      Left = 122
      Top = 105
      Width = 100
      Height = 24
      DataField = 'total'
      DataSource = ds_dados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object b_ok: TBitBtn
    Left = 51
    Top = 282
    Width = 80
    Height = 35
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Kind = bkOK
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 1
    OnClick = b_okClick
  end
  object b_cancel: TBitBtn
    Left = 163
    Top = 282
    Width = 80
    Height = 35
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Kind = bkCancel
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 2
    OnClick = b_cancelClick
  end
  object rad: TDBRadioGroup
    Left = 0
    Top = 151
    Width = 185
    Height = 105
    Caption = 'Forma de Pagamento'
    DataField = 'forma_pagamento'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Items.Strings = (
      'DINHEIRO'
      'DEBITO'
      'CREDITO')
    ParentFont = False
    TabOrder = 3
  end
  object q_dados: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select  i.sub_total,'
      #9'i.descr,'
      #9'i.total, '
      '        p.forma_pagamento       '
      #9'from pagamentos p'
      
        #9'inner join itens_vendas i on (i.cod_itens_vendas = p.cod_itens_' +
        'vendas)')
    Left = 200
    Top = 168
    object q_dadossub_total: TFloatField
      FieldName = 'sub_total'
      Origin = 'sub_total'
    end
    object q_dadosdescr: TFloatField
      FieldName = 'descr'
      Origin = 'descr'
    end
    object q_dadostotal: TFloatField
      FieldName = 'total'
      Origin = 'total'
    end
    object q_dadosforma_pagamento: TStringField
      FieldName = 'forma_pagamento'
      Origin = 'forma_pagamento'
      FixedChar = True
      Size = 8
    end
  end
  object ds_dados: TDataSource
    DataSet = q_dados
    Left = 256
    Top = 176
  end
end
