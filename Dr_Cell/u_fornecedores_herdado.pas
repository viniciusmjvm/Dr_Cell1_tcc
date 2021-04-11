unit u_fornecedores_herdado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u_cadastropadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tf_fornecedores_herdado = class(Tf_cadastropadrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Contato: TTabSheet;
    Label2: TLabel;
    edit_nome: TDBEdit;
    Label3: TLabel;
    edit_cnpj: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    edit_cep: TDBEdit;
    cb1: TDBLookupComboBox;
    Label6: TLabel;
    edit_endereco: TDBEdit;
    Label8: TLabel;
    edit_bairro: TDBEdit;
    Label9: TLabel;
    edit_telefone: TDBEdit;
    Label10: TLabel;
    edit_celular: TDBEdit;
    Label11: TLabel;
    edit_email: TDBEdit;
    q_cidades: TFDQuery;
    ds_cidades: TDataSource;
    q_dadoscod_fornecedor: TFDAutoIncField;
    q_dadosnome: TStringField;
    q_dadoscnpj: TStringField;
    q_dadosendereco: TStringField;
    q_dadosbairro: TStringField;
    q_dadoscod_cidade: TIntegerField;
    q_dadoscep: TStringField;
    q_dadostelefone: TStringField;
    q_dadoscelular: TStringField;
    q_dadosemail: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure b_excluirClick(Sender: TObject);
    procedure edit_nomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edit_celularKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_cnpjKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_cepKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_enderecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_bairroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_telefoneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_emailKeyDown(Sender: TObject; var Key: Word;
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
  f_fornecedores_herdado: Tf_fornecedores_herdado;

implementation

{$R *.dfm}

uses u_dm, funcoes;

procedure Tf_fornecedores_herdado.b_alterarClick(Sender: TObject);
begin
  inherited;
  pagecontrol1.TabIndex:= 0;
  edit_nome.SetFocus;
end;

procedure Tf_fornecedores_herdado.b_excluirClick(Sender: TObject);
begin
     dm.q_geral.sql.Clear;
     dm.q_geral.sql.add(' select count(*) as total ' );
     dm.q_geral.sql.add(' from contas ');
     dm.q_geral.sql.add(' where cod_fornecedor = ' + QuotedStr(q_dados.FieldByName('cod_fornecedor').AsString) );
     dm.q_geral.Open;
     if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
     begin
          ShowMessage('Não é possível excluir esse Fornecedor, porque há CONTAS relacionadas !');
          exit;
     end;

     inherited;

end;

procedure Tf_fornecedores_herdado.b_incluirClick(Sender: TObject);
begin
  inherited;
  pagecontrol1.TabIndex:= 0;
  edit_nome.SetFocus;
end;

procedure Tf_fornecedores_herdado.cb1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_fornecedores_herdado.controle_visual;
begin
     inherited;

     edit_nome.Enabled := q_dados.State in [dsEdit, dsInsert];
     edit_cnpj.Enabled := edit_nome.Enabled;
     edit_endereco.Enabled := edit_nome.Enabled;
     edit_bairro.Enabled := edit_nome.Enabled;
     cb1.Enabled := edit_nome.Enabled;
     edit_cep.Enabled := edit_nome.Enabled;
     edit_telefone.Enabled := edit_nome.Enabled;
     edit_email.Enabled := edit_nome.Enabled;
     edit_celular.Enabled := edit_nome.Enabled;
end;

procedure Tf_fornecedores_herdado.edit_bairroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_fornecedores_herdado.edit_celularKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_fornecedores_herdado.edit_cepKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_fornecedores_herdado.edit_cnpjKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_fornecedores_herdado.edit_emailKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_fornecedores_herdado.edit_enderecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_fornecedores_herdado.edit_nomeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     inherited;
     if key = VK_RETURN then
        begin
             b_gravar.OnClick(self);
        end;

end;

procedure Tf_fornecedores_herdado.edit_telefoneKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_fornecedores_herdado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     inherited;
     Action:= caFree;
     f_fornecedores_herdado:= nil;
end;

procedure Tf_fornecedores_herdado.FormCreate(Sender: TObject);
begin
     inherited;
     q_cidades.Open;
end;

function Tf_fornecedores_herdado.validar;
begin
     if trim(edit_nome.Text) = '' then
     begin
          pagecontrol1.TabIndex:= 0;
          ShowMessage('O nome deve ser preenchido!');
          edit_nome.SetFocus;
          exit;
     end;

     if trim(edit_cnpj.Text) = '' then
     begin
          pagecontrol1.TabIndex:= 0;
          ShowMessage('O CNPJ deve ser preenchido!');
          edit_cnpj.SetFocus;
          exit;
     end;

     if (cb1.KeyValue = null) OR (cb1.KeyValue = 0) then
     begin
          pagecontrol1.TabIndex:= 0;
          ShowMessage('O campo cidade deve ser preenchido !');
          cb1.SetFocus;
          exit;
     end;

     if trim(edit_celular.Text) = '' then
     begin
          pagecontrol1.TabIndex:= 1;
          MessageDlg('O campo celular deve ser preenchido !',mtError,[mbOk],0);
          edit_celular.SetFocus;
          exit;
     end;

     if not ValidarEMail(edit_email.Text) then
     begin
          pagecontrol1.TabIndex:= 1;
          MessageDlg('O E-mail deve ser um válido  !',mtError,[mbOk],0);
          edit_email.SetFocus;
          exit;
     end;

     result:= true;

end;


end.
