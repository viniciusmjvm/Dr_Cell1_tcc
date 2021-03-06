unit u_contas_herdados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u_cadastropadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ComCtrls;

type
  Tf_contas_herdados = class(Tf_cadastropadrao)
    ts1: TPageControl;
    ts: TTabSheet;
    Label4: TLabel;
    edit_vencimento: TDBEdit;
    Label6: TLabel;
    edit_pago: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    cb1: TDBLookupComboBox;
    cb2: TDBLookupComboBox;
    Label9: TLabel;
    edit_obs: TDBMemo;
    q_categoria: TFDQuery;
    ds_categoria: TDataSource;
    ds_fornecedores: TDataSource;
    q_fornecedor: TFDQuery;
    b_itens: TButton;
    q_dadoscod_conta: TFDAutoIncField;
    q_dadostipo: TStringField;
    q_dadosvencimento: TSQLTimeStampField;
    q_dadoscod_categoria: TIntegerField;
    q_dadoscod_fornecedor: TIntegerField;
    q_dadosobservacao: TMemoField;
    q_dadospago_em: TSQLTimeStampField;
    q_dadosnum_conta: TIntegerField;
    Label2: TLabel;
    edit_num: TDBEdit;
    rad: TDBRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure b_itensClick(Sender: TObject);
    procedure edit_numKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_pagoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_vencimentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure b_excluirClick(Sender: TObject);
    procedure cb1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cb2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edit_obsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure b_incluirClick(Sender: TObject);
    procedure b_alterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
            function Validar : boolean; override;
            // function pode_excluir: string; override;
             procedure controle_visual; override;
  end;

var
  f_contas_herdados: Tf_contas_herdados;

implementation

{$R *.dfm}

uses u_itens_contas, funcoes, u_dm;

procedure Tf_contas_herdados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     inherited;
     Action:=caFree;
     f_contas_herdados:= nil;
end;

procedure Tf_contas_herdados.FormCreate(Sender: TObject);
begin
     inherited;
     q_categoria.open;
     q_fornecedor.Open;
end;

function Tf_contas_herdados.validar;
begin
     if trim(edit_num.Text) = '' then
     begin
          ts1.TabIndex:= 0;
          ShowMessage('O Numero da conta deve ser preenchido!');
          edit_num.SetFocus;
          exit;
     end;
     {
     if trim(rad.Text) = '' then
     begin
          ShowMessage('O tipo da conta deve ser preenchido!');
          rad.SetFocus;
          exit;
     end;

     if trim(edit_vencimento.Text) = '' then
     begin
          ts1.TabIndex:= 0;
          ShowMessage('O vencimento da conta deve ser preenchida!');
          edit_vencimento.SetFocus;
          exit;
     end;
     }

     if not is_date(edit_vencimento.Text) then
     begin
          ts1.TabIndex:= 0;
          ShowMessage('O vencimento deve ser preenchido ou ? inv?lido !');
          edit_vencimento.SetFocus;
          exit;
     end;

     if (cb1.KeyValue = null) OR (cb1.KeyValue = 0) then
     begin
          ts1.TabIndex:= 1;
          ShowMessage('A categoria deve ser selecionada !');
          cb1.SetFocus;
          exit;
     end;

     if (cb2.KeyValue = null) OR (cb2.KeyValue = 0) then
     begin
          ts1.TabIndex:= 1;
          ShowMessage('O fornecedo deve ser selecionado !');
          cb2.SetFocus;
          exit;
     end;

     result:= true;

end;

procedure Tf_contas_herdados.b_alterarClick(Sender: TObject);
begin
  inherited;
    ts1.TabIndex:= 0;
    edit_num.SetFocus;
end;

procedure Tf_contas_herdados.b_excluirClick(Sender: TObject);
begin
     dm.q_geral.sql.Clear;
     dm.q_geral.sql.add(' select count(*) as total ' );
     dm.q_geral.sql.add(' from itens_contas ');
     dm.q_geral.sql.add(' where cod_conta = ' + QuotedStr(q_dados.FieldByName('cod_conta').AsString) );
     dm.q_geral.Open;
     if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
     begin
          ShowMessage('N?o ? poss?vel excluir essa Conta, porque h? Itens relacionados !');
          exit;
     end;

     inherited;

end;

procedure Tf_contas_herdados.b_incluirClick(Sender: TObject);
begin
  inherited;
    ts1.TabIndex:= 0;
    edit_num.SetFocus;
end;

procedure Tf_contas_herdados.b_itensClick(Sender: TObject);
begin
     inherited;
     // se a query pratos n?o conter dados
     if q_dados.IsEmpty then
     begin
          ShowMessage('N?o h? uma conta selecionada para incluir os itens!');
          exit;
     end;

     // se o formul?rio n?o estiver instanciado
     if not Assigned(f_itens_contas) then
     begin
          f_itens_contas:= Tf_itens_contas.create(application);
          f_itens_contas.cod_conta:= q_dados.FieldByName('cod_conta').AsString;
          f_itens_contas.l_itens_conta.Caption:= q_dados.FieldByName('num_conta').AsString;
          f_itens_contas.load_query;
     end
     else begin
          f_itens_contas.Show;
     end;
end;

procedure Tf_contas_herdados.cb1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_contas_herdados.cb2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_contas_herdados.controle_visual;
begin
     inherited;

     edit_vencimento.Enabled := q_dados.State in [dsEdit, dsInsert];
     rad.Enabled := edit_vencimento.Enabled;
     edit_num.Enabled := edit_vencimento.Enabled;
     edit_pago.Enabled := edit_vencimento.Enabled;
     cb1.Enabled := edit_vencimento.Enabled;
     cb2.Enabled := edit_vencimento.Enabled;
     edit_obs.Enabled := edit_vencimento.Enabled;
     b_itens.Enabled    := not edit_num.Enabled;
end;


procedure Tf_contas_herdados.edit_numKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_contas_herdados.edit_obsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_contas_herdados.edit_pagoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;



procedure Tf_contas_herdados.edit_vencimentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

end.
