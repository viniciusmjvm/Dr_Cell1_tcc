unit u_cidades_herdado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u_cadastropadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Mask, Vcl.DBCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tf_cidades_herdado = class(Tf_cadastropadrao)
    q_dadosnome: TStringField;
    q_dadosuf: TStringField;
    q_dadoscep_padrao: TStringField;
    Label2: TLabel;
    edit_nome: TDBEdit;
    Label3: TLabel;
    edit_uf: TDBEdit;
    Label4: TLabel;
    edit_cep: TDBEdit;
    q_dadoscod_cidade: TFDAutoIncField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure b_excluirClick(Sender: TObject);
    procedure b_incluirClick(Sender: TObject);
    procedure b_alterarClick(Sender: TObject);
    procedure edit_nomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_ufKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_cepKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }

  protected
           procedure controle_visual; override;
           function validar : boolean; override;
  end;

var
  f_cidades_herdado: Tf_cidades_herdado;

implementation
uses u_dm;

procedure Tf_cidades_herdado.b_incluirClick(Sender: TObject);
begin
  inherited;
  edit_nome.SetFocus;
end;

procedure Tf_cidades_herdado.controle_visual;
begin
  inherited;

  edit_nome.Enabled := q_dados.State in [dsEdit, dsInsert];
   edit_cep.Enabled := edit_nome.Enabled;
   edit_uf.Enabled := edit_nome.Enabled;
end;

procedure Tf_cidades_herdado.edit_cepKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_cidades_herdado.edit_nomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_cidades_herdado.edit_ufKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

{$R *.dfm}

procedure Tf_cidades_herdado.b_alterarClick(Sender: TObject);
begin
  inherited;
  edit_nome.SetFocus;
end;

procedure Tf_cidades_herdado.b_excluirClick(Sender: TObject);
begin
     dm.q_geral.sql.Clear;
     dm.q_geral.sql.add(' select count(*) as total ' );
     dm.q_geral.sql.add(' from clientes ');
     dm.q_geral.sql.add(' where cod_cidade = ' + QuotedStr(q_dados.FieldByName('cod_cidade').AsString) );
     dm.q_geral.Open;
     if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
     begin
          ShowMessage('N?o ? poss?vel excluir esse cidade porque h? CLIENTES relacionado !');
          exit;
     end;

     dm.q_geral.sql.Clear;
     dm.q_geral.sql.add(' select count(*) as total ' );
     dm.q_geral.sql.add(' from fornecedores ');
     dm.q_geral.sql.add(' where cod_cidade = ' + QuotedStr(q_dados.FieldByName('cod_cidade').AsString) );
     dm.q_geral.Open;
     if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
     begin
          ShowMessage('N?o ? poss?vel excluir esse cidade porque h? FORNECEDOR relacionado !');
          exit;
     end;

    inherited;
end;

procedure Tf_cidades_herdado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:= caFree;
  f_cidades_herdado:= nil;
end;

function Tf_cidades_herdado.validar;
begin
  if trim(edit_nome.Text) = '' then
  begin
       ShowMessage('O Nome deve ser informada!');
       edit_nome.SetFocus;
       exit;
  end;

  if trim(edit_uf.Text) = '' then
  begin
       ShowMessage('A Unidade Federal deve ser informada!');
       edit_uf.SetFocus;
       exit;
  end;

  if trim(edit_cep.Text) = '' then
  begin
       ShowMessage('O CEP deve ser informada!');
       edit_cep.SetFocus;
       exit;
  end;

  result:= true;

end;


end.
