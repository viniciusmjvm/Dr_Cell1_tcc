unit u_clientes_herdado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u_cadastropadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.DBCtrls, Vcl.Mask, FireDAC.Comp.DataSet,
  Vcl.ComCtrls, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  Tf_clientes_herdado = class(Tf_cadastropadrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    edit_nome: TDBEdit;
    Label3: TLabel;
    edit_cpf: TDBEdit;
    Label4: TLabel;
    edit_rg: TDBEdit;
    Label5: TLabel;
    edit_data: TDBEdit;
    Label6: TLabel;
    edit_endereco: TDBEdit;
    Label7: TLabel;
    edit_bairro: TDBEdit;
    Label8: TLabel;
    edit_cep: TDBEdit;
    Label9: TLabel;
    edit_telefone: TDBEdit;
    Label10: TLabel;
    edit_celular: TDBEdit;
    Label11: TLabel;
    edit_email: TDBEdit;
    Label12: TLabel;
    cb1: TDBLookupComboBox;
    q_cidades: TFDQuery;
    ds_cidades: TDataSource;
    q_dadoscod_cliente: TFDAutoIncField;
    q_dadosnome: TStringField;
    q_dadoscpf: TStringField;
    q_dadosrg: TStringField;
    q_dadosdata_nascimento: TSQLTimeStampField;
    q_dadossexo: TStringField;
    q_dadosendereco: TStringField;
    q_dadosbairro: TStringField;
    q_dadoscod_cidade: TIntegerField;
    q_dadoscep: TStringField;
    q_dadostelefone: TStringField;
    q_dadoscelular: TStringField;
    q_dadosemail: TStringField;
    sexo: TDBRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edit_rgKeyPress(Sender: TObject; var Key: Char);
    procedure b_excluirClick(Sender: TObject);
    procedure edit_nomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_cpfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_dataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edit_celularKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure b_incluirClick(Sender: TObject);
    procedure b_alterarClick(Sender: TObject);
    procedure edit_emailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

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
  f_clientes_herdado: Tf_clientes_herdado;

implementation

uses funcoes, u_dm;
{$R *.dfm}

procedure Tf_clientes_herdado.b_alterarClick(Sender: TObject);
begin
  inherited;
  pagecontrol1.TabIndex:= 0;
  edit_nome.SetFocus;
end;

procedure Tf_clientes_herdado.b_excluirClick(Sender: TObject);
begin
     dm.q_geral.sql.Clear;
     dm.q_geral.sql.add(' select count(*) as total ' );
     dm.q_geral.sql.add(' from vendas ');
     dm.q_geral.sql.add(' where cod_cliente = ' + QuotedStr(q_dados.FieldByName('cod_cliente').AsString) );
     dm.q_geral.Open;
     if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
     begin
          ShowMessage('N?o ? poss?vel excluir esse Cliente porque h? VENDA(s) relacionado !');
          exit;
     end;

     dm.q_geral.sql.Clear;
     dm.q_geral.sql.add(' select count(*) as total ' );
     dm.q_geral.sql.add(' from reparos ');
     dm.q_geral.sql.add(' where cod_cliente = ' + QuotedStr(q_dados.FieldByName('cod_cliente').AsString) );
     dm.q_geral.Open;
     if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
     begin
          ShowMessage('N?o ? poss?vel excluir esse Cliente porque h? REPARO(s) relacionado !');
          exit;
     end;

     dm.q_geral.sql.Clear;
     dm.q_geral.sql.add(' select count(*) as total ' );
     dm.q_geral.sql.add(' from reparos ');
     dm.q_geral.sql.add(' where cod_cliente = ' + QuotedStr(q_dados.FieldByName('cod_cliente').AsString) );
     dm.q_geral.Open;
     if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
     begin
          ShowMessage('N?o ? poss?vel excluir esse Cliente porque h? Reparos relacionado !');
          exit;
     end;

     inherited;
end;

procedure Tf_clientes_herdado.b_incluirClick(Sender: TObject);
begin
  inherited;
  pagecontrol1.TabIndex:= 0;
  edit_nome.SetFocus;
end;

procedure Tf_clientes_herdado.cb1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_clientes_herdado.controle_visual;
begin
     inherited;

     edit_nome.Enabled := q_dados.State in [dsEdit, dsInsert];
     edit_cpf.Enabled := edit_nome.Enabled;
     edit_rg.Enabled := edit_nome.Enabled;
     edit_data.Enabled := edit_nome.Enabled;
     sexo.Enabled := edit_nome.Enabled;
     edit_endereco.Enabled := edit_nome.Enabled;
     edit_bairro.Enabled := edit_nome.Enabled;
     cb1.Enabled := edit_nome.Enabled;
     edit_cep.Enabled := edit_nome.Enabled;
     edit_telefone.Enabled := edit_nome.Enabled;
     edit_email.Enabled := edit_nome.Enabled;
     edit_celular.Enabled := edit_nome.Enabled;
end;

procedure Tf_clientes_herdado.edit_celularKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_clientes_herdado.edit_cpfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_clientes_herdado.edit_dataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_clientes_herdado.edit_emailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_clientes_herdado.edit_nomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_clientes_herdado.edit_rgKeyPress(Sender: TObject; var Key: Char);
begin
     //inherited;
//     if not (key in ['1','2','3','4','5','6','7','8','9','0',',','x']) then
    // key :=#0;
end;

procedure Tf_clientes_herdado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     inherited;
     Action:= caFree;
     f_clientes_herdado:= nil;
end;

procedure Tf_clientes_herdado.FormCreate(Sender: TObject);
begin
     inherited;
     q_cidades.Open;
end;

function Tf_clientes_herdado.validar;
begin
     if trim(edit_nome.Text) = '' then
     begin
          pagecontrol1.TabIndex:= 0;
          ShowMessage('O nome deve ser preenchido!');
          edit_nome.SetFocus;
          exit;
     end;

     if trim(edit_cpf.Text) = '' then
     begin
          pagecontrol1.TabIndex:= 0;
          ShowMessage('O CPF deve ser preenchido!');
          edit_cpf.SetFocus;
          exit;
     end;

     if not valida_cpf(edit_cpf.Text) then
     begin
          pagecontrol1.TabIndex:= 0; // mudando a aba do pagecontrol
          ShowMessage('O CPF informado ? inv?lido !');
          edit_cpf.SetFocus;
          exit;
     end;
     {
      if trim(edit_data.Text) = '' then
        Default(edit_data.Text) / Assigned(edit_data.Text)
        lenght(query.FieldByName(?campo?),AsString)
        ShowMessage('verificando o entra na variavel' + edit_data.Text);

     if trim(edit_data.Text) = '' then
     begin
          pagecontrol1.TabIndex:= 0;
          ShowMessage('A data deve ser preenchido!');
          edit_data.SetFocus;
          exit;

     end;
      }
     if not is_date(edit_data.Text) then
     begin
          pagecontrol1.TabIndex:= 0;
          ShowMessage('A data de nascimento deve ser preenchida ou ? inv?lida !');
          edit_data.SetFocus;
          exit;
     end;

    // if sexo.ItemIndex = 0 then sexo:= 'M';
     //if sexo.ItemIndex = 1 then sexo:= 'F';

     if (cb1.KeyValue = null) OR (cb1.KeyValue = 0) then
     begin
          pagecontrol1.TabIndex:= 1;
          ShowMessage('O campo cidade deve ser preenchido !');
          cb1.SetFocus;
          exit;
     end;
     {
     if trim(edit_celular.Text) = '' then
     begin
          ShowMessage('O numero do celular deve ser informado!');
          result:=false;
          exit;
     end;
      }
     if not is_real(edit_celular.Text) then
     begin
          pagecontrol1.TabIndex:= 1;
          MessageDlg('O numero do celular deve ser um n?mero v?lido  !',mtError,[mbOk],0);
          edit_celular.SetFocus;
          exit;
     end;

      if not ValidarEMail(edit_email.Text) then
     begin
          pagecontrol1.TabIndex:= 1;
          MessageDlg('O E-mail deve ser um v?lido  !',mtError,[mbOk],0);
          edit_email.SetFocus;
          exit;
     end;

     result:= true;

end;

end.
