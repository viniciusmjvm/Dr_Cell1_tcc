unit u_pecas_herdados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u_cadastropadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  Tf_pecas_herdados = class(Tf_cadastropadrao)
    q_dadoscod_peca: TFDAutoIncField;
    q_dadosdescricao: TStringField;
    q_dadosvalor: TFloatField;
    q_dadosqntd: TIntegerField;
    Label2: TLabel;
    edit_descricao: TDBEdit;
    Label3: TLabel;
    edit_valor: TDBEdit;
    Label4: TLabel;
    edit_quantidade: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    q_dadosestoque_atual: TIntegerField;
    q_dadosestoque_minimo: TIntegerField;
    edit_atual: TDBEdit;
    edit_minimo: TDBEdit;
    procedure feKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edit_descricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_valorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_quantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure b_excluirClick(Sender: TObject);
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
  f_pecas_herdados: Tf_pecas_herdados;

implementation

{$R *.dfm}

uses u_dm;

procedure Tf_pecas_herdados.edit_descricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
    if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_pecas_herdados.edit_quantidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
    if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_pecas_herdados.edit_valorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_pecas_herdados.feKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     inherited;
     if key = 13 then edit_quantidade.setfocus;

     // se pressionou F4
     if key = vk_f4 then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_pecas_herdados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     inherited;
     Action:=caFree;
     f_pecas_herdados:= nil;
end;

procedure Tf_pecas_herdados.b_alterarClick(Sender: TObject);
begin
     inherited;
     edit_descricao.SetFocus;
end;

procedure Tf_pecas_herdados.b_excluirClick(Sender: TObject);
begin
     dm.q_geral.sql.Clear;
     dm.q_geral.sql.add(' select count(*) as total ' );
     dm.q_geral.sql.add(' from itens_reparos ');
     dm.q_geral.sql.add(' where cod_peca = ' + QuotedStr(q_dados.FieldByName('cod_peca').AsString) );
     dm.q_geral.Open;
     if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
     begin
          ShowMessage('N?o ? poss?vel excluir essa Pe?a, porque h? Itens do Reparo relacionados !');
          exit;
     end;
  inherited;

end;

procedure Tf_pecas_herdados.b_incluirClick(Sender: TObject);
begin
     inherited;
     edit_descricao.SetFocus;

end;

procedure Tf_pecas_herdados.controle_visual;
begin
     inherited;

     edit_descricao.Enabled := q_dados.State in [dsEdit, dsInsert];
     edit_valor.Enabled       := edit_descricao.Enabled;
     edit_quantidade.Enabled     := edit_descricao.Enabled;
     edit_atual.Enabled     := edit_descricao.Enabled;
     edit_minimo.Enabled     := edit_descricao.Enabled;
end;


function Tf_pecas_herdados.validar;
begin
     if trim(edit_descricao.Text) = '' then
     begin
          ShowMessage('A descric??o deve ser preenchido!');
          edit_descricao.SetFocus;
          exit;
     end;

     if trim(edit_valor.Text) = '' then
     begin
          ShowMessage('O valor deve ser preenchido!');
          edit_valor.SetFocus;
          exit;
     end;

     if trim(edit_quantidade.Text) = '' then
     begin
          ShowMessage('A quantidade deve ser preenchido!');
          edit_quantidade.SetFocus;
          exit;
     end;

     if trim(edit_atual.Text) = '' then
     begin
          ShowMessage('O estoque deve ser preenchido!');
          edit_atual.SetFocus;
          exit;
     end;

     result:= true;

end;

end.
