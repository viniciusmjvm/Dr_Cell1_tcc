object f_devolucao: Tf_devolucao
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'DEVOLU'#199#195'O'
  ClientHeight = 364
  ClientWidth = 514
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 13
    Width = 111
    Height = 18
    Caption = 'Num. da Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 0
    Top = 125
    Width = 500
    Height = 18
    Caption = '__________________________________________________'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button2: TButton
    Left = 216
    Top = 291
    Width = 97
    Height = 50
    Caption = 'Devolver'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object rad1: TRadioButton
    Left = 8
    Top = 11
    Width = 18
    Height = 17
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 149
    Width = 506
    Height = 120
    DataSource = ds_dados
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edit_num: TEdit
    Left = 160
    Top = 8
    Width = 177
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnChange = edit_numChange
  end
  object q_dados: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select  v.num_venda,p.descricao,i.valor,i.quantidade'
      ' from vendas v '
      #9'left outer join itens_vendas i on (i.cod_venda = v.cod_venda)'
      #9'inner join produtos p on (i.cod_produto = p.cod_produto)'
      ' order by p.descricao')
    Left = 40
    Top = 304
    object q_dadoscod_venda: TFDAutoIncField
      FieldName = 'cod_venda'
      Origin = 'cod_venda'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object q_dadosnum_venda: TIntegerField
      FieldName = 'num_venda'
      Origin = 'num_venda'
      Required = True
    end
    object q_dadoscod_cliente: TIntegerField
      FieldName = 'cod_cliente'
      Origin = 'cod_cliente'
      Required = True
    end
    object q_dadosobservacao: TMemoField
      FieldName = 'observacao'
      Origin = 'observacao'
      BlobType = ftMemo
    end
    object q_dadosdata: TSQLTimeStampField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
  end
  object ds_dados: TDataSource
    DataSet = q_dados
    Left = 104
    Top = 312
  end
end
