object f_cadastropadrao: Tf_cadastropadrao
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro Padr'#227'o - NOVA'
  ClientHeight = 457
  ClientWidth = 664
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = -8
    Top = 0
    Width = 673
    Height = 173
  end
  object Label1: TLabel
    Left = 8
    Top = 220
    Width = 72
    Height = 19
    Caption = 'Pesquisa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object b_gravar: TButton
    Left = 8
    Top = 179
    Width = 75
    Height = 35
    Caption = 'Gravar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = b_gravarClick
  end
  object b_cancelar: TButton
    Left = 89
    Top = 179
    Width = 75
    Height = 35
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = b_cancelarClick
  end
  object edit_pesquisa: TEdit
    Left = 0
    Top = 245
    Width = 575
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnChange = edit_pesquisaChange
  end
  object b_incluir: TButton
    Left = 581
    Top = 287
    Width = 75
    Height = 34
    Caption = 'Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = b_incluirClick
  end
  object b_alterar: TButton
    Left = 581
    Top = 327
    Width = 75
    Height = 35
    Caption = 'Alterar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = b_alterarClick
  end
  object b_excluir: TButton
    Left = 581
    Top = 368
    Width = 75
    Height = 36
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = b_excluirClick
    OnKeyDown = b_excluirKeyDown
  end
  object b_fechar: TButton
    Left = 581
    Top = 410
    Width = 75
    Height = 33
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = b_fecharClick
  end
  object grid_dados: TDBGrid
    Left = 0
    Top = 277
    Width = 575
    Height = 180
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object q_dados: TFDQuery
    AfterOpen = q_dadosAfterOpen
    AfterClose = q_dadosAfterClose
    AfterInsert = q_dadosAfterInsert
    AfterEdit = q_dadosAfterEdit
    AfterPost = q_dadosAfterPost
    AfterCancel = q_dadosAfterCancel
    AfterDelete = q_dadosAfterDelete
    Connection = DM.FDConnection1
    Left = 328
    Top = 312
  end
  object ds_dados: TDataSource
    DataSet = q_dados
    Left = 200
    Top = 312
  end
end