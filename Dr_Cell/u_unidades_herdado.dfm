inherited f_unidades_herdado: Tf_unidades_herdado
  Caption = 'Cadastro de Unidades - Herdado'
  ClientHeight = 357
  ExplicitWidth = 670
  ExplicitHeight = 386
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Height = 73
    ExplicitHeight = 73
  end
  inherited Label1: TLabel
    Top = 120
    ExplicitTop = 120
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 8
    Width = 63
    Height = 16
    Caption = 'Descricao'
    FocusControl = edit_descricao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited b_gravar: TButton
    Top = 79
    ExplicitTop = 79
  end
  inherited b_cancelar: TButton
    Top = 79
    ExplicitTop = 79
  end
  inherited edit_pesquisa: TEdit
    Top = 145
    ExplicitTop = 145
  end
  inherited b_incluir: TButton
    Top = 141
    ExplicitTop = 141
  end
  inherited b_alterar: TButton
    Top = 196
    ExplicitTop = 196
  end
  inherited b_excluir: TButton
    Top = 251
    ExplicitTop = 251
  end
  inherited b_fechar: TButton
    Top = 302
    ExplicitTop = 302
  end
  inherited grid_dados: TDBGrid
    Top = 177
    Columns = <
      item
        Expanded = False
        FieldName = 'cod_unidade'
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
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 200
        Visible = True
      end>
  end
  object edit_descricao: TDBEdit [11]
    Left = 8
    Top = 30
    Width = 567
    Height = 24
    DataField = 'descricao'
    DataSource = ds_dados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnKeyDown = edit_descricaoKeyDown
  end
  inherited q_dados: TFDQuery
    SQL.Strings = (
      'select * from unidades'
      'order by descricao')
    Top = 212
    object q_dadosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 100
    end
    object q_dadoscod_unidade: TFDAutoIncField
      FieldName = 'cod_unidade'
      Origin = 'cod_unidade'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  inherited ds_dados: TDataSource
    Top = 212
  end
end
