unit u_reparo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u_cadastropadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.CheckLst,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.Mask;

type
  Tf_reparos_herdado = class(Tf_cadastropadrao)
    q_clientes: TFDQuery;
    ds_clientes: TDataSource;
    Label2: TLabel;
    cb1: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    data_recebido: TDBEdit;
    Label7: TLabel;
    data_entrega: TDBEdit;
    citados: TDBMemo;
    encontrados: TDBMemo;
    q_dadoscod_reparo: TFDAutoIncField;
    q_dadoscod_cliente: TIntegerField;
    q_dadosprob_citados: TMemoField;
    q_dadosprob_encontrados: TMemoField;
    q_dadosdata_recebido: TSQLTimeStampField;
    q_dadosdata_entrega: TSQLTimeStampField;
    q_dadosstatus: TStringField;
    status: TDBRadioGroup;
    b_itens: TButton;
    q_dadosnum_reparo: TIntegerField;
    Label5: TLabel;
    edit_reparo: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cb1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure data_recebidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure data_entregaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure citadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure encontradosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure b_itensClick(Sender: TObject);
    procedure edit_reparoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure b_excluirClick(Sender: TObject);
    procedure b_incluirClick(Sender: TObject);
    procedure b_alterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cod_reparo : string;

  function Validar : boolean; override;
            // function pode_excluir: string; override;
             procedure controle_visual; override;
  end;

var
  f_reparos_herdado: Tf_reparos_herdado;

implementation
uses funcoes, u_dm, u_itens_reparo;
{$R *.dfm}

  procedure Tf_reparos_herdado.b_alterarClick(Sender: TObject);
  begin
    inherited;
    edit_reparo.SetFocus;
  end;

  procedure Tf_reparos_herdado.b_excluirClick(Sender: TObject);
  begin
       dm.q_geral.sql.Clear;
       dm.q_geral.sql.add(' select count(*) as total ' );
       dm.q_geral.sql.add(' from itens_reparos ');
       dm.q_geral.sql.add(' where cod_reparo = ' + QuotedStr(q_dados.FieldByName('cod_reparo').AsString) );
       dm.q_geral.Open;
       if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
       begin
            ShowMessage('N?o ? poss?vel excluir esse reparo porque h? ITENS relacionado !');
            exit;
       end;

       inherited;
  end;

  procedure Tf_reparos_herdado.b_incluirClick(Sender: TObject);
  begin
    inherited;
    edit_reparo.SetFocus;
  end;

  procedure Tf_reparos_herdado.b_itensClick(Sender: TObject);
  begin
    inherited;
    // se a query pratos n?o conter dados
       if q_dados.IsEmpty then
       begin
            ShowMessage('N?o h? um reparo selecionado para incluir os itens!');
            exit;
       end;

       // se o formul?rio n?o estiver instanciado
       if not Assigned(f_itens_reparo) then
       begin
            // instanciando o formul?rio
            f_itens_reparo:= Tf_itens_reparo.create(application);
            f_itens_reparo.cod_reparo:= q_dados.FieldByName('cod_reparo').AsString;
            f_itens_reparo.l_itens_reparo.Caption:= q_dados.FieldByName('num_reparo').AsString;
            f_itens_reparo.load_query;
       end
       else begin
            f_itens_reparo.Show;
       end;
  end;

  procedure Tf_reparos_herdado.cb1KeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
  begin
    inherited;
    if key = VK_RETURN then
       begin
            b_gravar.OnClick(self);
       end;
  end;

  procedure Tf_reparos_herdado.citadosKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
  begin
    inherited;
    if key = VK_RETURN then
       begin
            b_gravar.OnClick(self);
       end;
  end;

  procedure Tf_reparos_herdado.controle_visual;
  begin
       inherited;
       edit_reparo.Enabled := q_dados.State in [dsEdit, dsInsert];
       citados.Enabled := edit_reparo.Enabled;
       data_entrega.Enabled := edit_reparo.Enabled;
       encontrados.Enabled := edit_reparo.Enabled;
       status.Enabled := edit_reparo.Enabled;
       cb1.Enabled := edit_reparo.Enabled;
       data_recebido.Enabled := edit_reparo.Enabled;
       b_itens.Enabled:= not edit_reparo.Enabled;
  end;



  procedure Tf_reparos_herdado.data_entregaKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
  begin
    inherited;
    if key = VK_RETURN then
       begin
            b_gravar.OnClick(self);
       end;
  end;

  procedure Tf_reparos_herdado.data_recebidoKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
  begin
    inherited;
    if key = VK_RETURN then
       begin
            b_gravar.OnClick(self);
       end;
  end;

  procedure Tf_reparos_herdado.edit_reparoKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
  begin
    inherited;
      if key = VK_RETURN then
       begin
            b_gravar.OnClick(self);
       end;
  end;

  procedure Tf_reparos_herdado.encontradosKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
  begin
    inherited;
    if key = VK_RETURN then
       begin
            b_gravar.OnClick(self);
       end;
  end;

  procedure Tf_reparos_herdado.FormClose(Sender: TObject;
    var Action: TCloseAction);
  begin
       inherited;
       Action:= caFree;
       f_reparos_herdado:= nil;
  end;

  procedure Tf_reparos_herdado.FormCreate(Sender: TObject);
  begin
       inherited;
       q_clientes.Open;
end;

  function Tf_reparos_herdado.validar;
  begin
       if trim(edit_reparo.Text) = '' then
         begin
              ShowMessage('O numero do reparo deve ser preenchido!');
              edit_reparo.SetFocus;
              exit;
         end;

       if (cb1.KeyValue = null) OR (cb1.KeyValue = 0) then
       begin
            ShowMessage('O campo cliente deve ser preenchido !');
            cb1.SetFocus;
            exit;
       end;

       if trim(data_recebido.Text) = '' then
         begin
              ShowMessage('A data do recebimento deve ser preenchida!');
              data_recebido.SetFocus;
              exit;
         end;

       if not is_date(data_recebido.Text) then
          begin
               ShowMessage('A data do recebimento ? inv?lida !');
               data_recebido.SetFocus;
               exit;
          end;
       result:= true;

end;

end.
