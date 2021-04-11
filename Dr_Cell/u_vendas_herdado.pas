unit u_vendas_herdado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u_cadastropadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.Buttons;

type
  Tf_vendas_herdado = class(Tf_cadastropadrao)
    Label2: TLabel;
    edit_num: TDBEdit;
    Label4: TLabel;
    cb1: TDBLookupComboBox;
    Label5: TLabel;
    edit_data: TDBEdit;
    Label6: TLabel;
    edit_obs: TDBMemo;
    q_clientes: TFDQuery;
    ds_clientes: TDataSource;
    b_itens: TButton;
    b_reletorio: TButton;
    q_dadoscod_venda: TFDAutoIncField;
    q_dadosnum_venda: TIntegerField;
    q_dadoscod_cliente: TIntegerField;
    q_dadosobservacao: TMemoField;
    q_dadosdata: TSQLTimeStampField;
    b_pagar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure b_itensClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure b_reletorioClick(Sender: TObject);
    procedure edit_numKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edit_dataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_obsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure b_excluirClick(Sender: TObject);
    procedure b_incluirClick(Sender: TObject);
    procedure b_alterarClick(Sender: TObject);
    procedure b_pagarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    cod_itens_venda : string;

  protected
            function Validar : boolean; override;
            // function pode_excluir: string; override;
             procedure controle_visual; override;

  end;

var
  f_vendas_herdado: Tf_vendas_herdado;

implementation

uses funcoes, u_itens_venda, ur_vendas, u_dm, u_clientes_herdado, u_pagamentos;
{$R *.dfm}

procedure Tf_vendas_herdado.Button1Click(Sender: TObject);
begin
     inherited;
     r_vendas:=Tr_vendas.Create(application);
     r_vendas.QRP.Preview;
     r_vendas.Free;
end;

procedure Tf_vendas_herdado.b_alterarClick(Sender: TObject);
begin
  inherited;
  edit_num.SetFocus;
end;

procedure Tf_vendas_herdado.b_excluirClick(Sender: TObject);
begin
     dm.q_geral.sql.Clear;
     dm.q_geral.sql.add(' select count(*) as total ' );
     dm.q_geral.sql.add(' from itens_vendas ');
     dm.q_geral.sql.add(' where cod_venda = ' + QuotedStr(q_dados.FieldByName('cod_venda').AsString) );
     dm.q_geral.Open;
     if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
     begin
          ShowMessage('Não é possível excluir essa Venda, porque há Itens relacionados !');
          exit;
     end;
     inherited;

end;

procedure Tf_vendas_herdado.b_incluirClick(Sender: TObject);
begin
  inherited;
  edit_num.SetFocus;
end;

procedure Tf_vendas_herdado.b_itensClick(Sender: TObject);
begin
     inherited;
     // se a query pratos não conter dados
     if q_dados.IsEmpty then
     begin
          ShowMessage('Não há uma venda selecionada para incluir os itens!');
          exit;
     end;

     // se o formulário não estiver instanciado
     if not Assigned(f_itens_vendas) then
     begin
          f_itens_vendas:= Tf_itens_vendas.create(application);
          f_itens_vendas.cod_venda:= q_dados.FieldByName('cod_venda').AsString;
          f_itens_vendas.l_itens_venda.Caption:= q_dados.FieldByName('num_venda').AsString;
          f_itens_vendas.load_query;
     end
     else begin
          f_itens_vendas.Show;
     end;
end;

procedure Tf_vendas_herdado.b_pagarClick(Sender: TObject);
begin
     if q_dados.IsEmpty then
     begin
          ShowMessage('Não há uma venda selecionada para incluir os itens!');
          exit;
     end;

     if not Assigned(f_pagamentos) then
     begin
     //tentar colocar aqui de alguma o select do fdquery grid.
          // instanciando o formulário
          f_pagamentos:= Tf_pagamentos.create(application);
          f_pagamentos.cod_itens_vendas:= q_dados.FieldByName('cod_venda').AsString;
          f_pagamentos.l_pag.Caption:= q_dados.FieldByName('num_venda').AsString;
          //f_itens_vendas.edit_num:= q_dados.FieldByName('num_venda').AsString;
          //f_pagamentos.load_query;
     end
     else begin
          f_pagamentos.Show;
     end;
end;

procedure Tf_vendas_herdado.b_reletorioClick(Sender: TObject);
begin
     r_vendas:=Tr_vendas.Create(application);
     r_vendas.QRP.Preview;
     r_vendas.Free;
end;

procedure Tf_vendas_herdado.cb1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_vendas_herdado.controle_visual;
begin
     inherited;
     edit_num.Enabled   := q_dados.State in [dsEdit, dsInsert];
     edit_data.Enabled  := edit_num.Enabled;
     cb1.Enabled        := edit_num.Enabled;
     edit_obs.Enabled   := edit_num.Enabled;
     b_itens.Enabled    := not edit_num.Enabled;
     b_reletorio.Enabled:= not edit_num.Enabled;
end;

procedure Tf_vendas_herdado.edit_dataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_vendas_herdado.edit_numKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_vendas_herdado.edit_obsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_vendas_herdado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     inherited;
     Action:= caFree;
     f_vendas_herdado:= nil;
end;

procedure Tf_vendas_herdado.FormCreate(Sender: TObject);
begin
     inherited;
     q_clientes.Open;
end;

function Tf_vendas_herdado.validar;
begin
     if trim(edit_num.Text) = '' then
     begin
          ShowMessage('O nome deve ser preenchido!');
          edit_num.SetFocus;
          exit;
     end;

     if (cb1.KeyValue = null) OR (cb1.KeyValue = 0) then
     begin
          ShowMessage('O campo cliente deve ser preenchido !');
          cb1.SetFocus;
          exit;
     end;

     if not is_date(edit_data.Text) then
     begin
          ShowMessage('A data de nascimento deve ser preenchida ou é inválida !');
          edit_data.SetFocus;
          exit;
     end;

     result:= true;

end;

end.
