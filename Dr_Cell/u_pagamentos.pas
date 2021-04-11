unit u_pagamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Mask, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tf_pagamentos = class(TForm)
    Bevel1: TBevel;
    Panel1: TPanel;
    Label1: TLabel;
    l_pag: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    b_ok: TBitBtn;
    b_cancel: TBitBtn;
    q_dados: TFDQuery;
    ds_dados: TDataSource;
    edit_sub_total: TDBEdit;
    edit_desc: TDBEdit;
    edit_total: TDBEdit;
    rad: TDBRadioGroup;
    q_dadossub_total: TFloatField;
    q_dadosdescr: TFloatField;
    q_dadostotal: TFloatField;
    q_dadosforma_pagamento: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure b_cancelClick(Sender: TObject);
    procedure b_okClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cod_itens_vendas : string;
    procedure load_query;
  end;

var
  f_pagamentos: Tf_pagamentos;

implementation

{$R *.dfm}

uses u_dm;

procedure Tf_pagamentos.b_cancelClick(Sender: TObject);
begin
     close;
end;

procedure Tf_pagamentos.b_okClick(Sender: TObject);
var
   sexo  : string;
begin
{
     if rad.itemIndex = q_dados then
     begin
          MessageDlg('A forma de pagamento deve ser informado !',mtWarning,[mbOk],0);
          rad.SetFocus;
          exit;
     end;
}    if rad.ItemIndex = 0 then sexo:= 'DINHEIRO';
     if rad.ItemIndex = 1 then sexo:= 'DEBITO';
     if rad.ItemIndex = 2 then sexo:= 'CREDITO';

     {
     dm.q_geral.sql.clear;
     dm.q_geral.sql.add(' select count(*) as total from pagamentos ' +
                        ' where cod_produto = ' + QuotedStr(edit_cod_produto.text) +
                        '       and cod_venda = ' + QuotedStr(cod_venda) + ' ');
    //--------------------------------
    }
     dm.q_geral.open;

     if dm.q_geral.fieldbyname('total').AsInteger = 0 then
     begin
          dm.q_geral.sql.clear;
          dm.q_geral.sql.add(' insert into pagamentos (cod_itens_vendas, forma_pagamento ) ' +
                             ' values('  +QuotedStr(cod_itens_vendas)+ ',' +
                                          QuotedStr(sexo)        +')');

          dm.q_geral.ExecSql;
          //rad:= '';
          //edit_cod_produto.setfocus;
          load_query;
          //q_pesq;

          //pesq.Open;
     end;
     ShowMessage('deseja imprimir a via do cliente? ');
end;

procedure Tf_pagamentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:= caFree;
      f_pagamentos:= nil;
end;

procedure Tf_pagamentos.FormCreate(Sender: TObject);
begin
     q_dados.Open;
end;

procedure Tf_pagamentos.load_query;
begin
     q_dados.sql.clear;
     q_dados.sql.add(' select  i.sub_total, i.descr, i.total, p.forma_pagamento');
     q_dados.sql.add(' from pagamentos p ');
     q_dados.sql.add(' inner join itens_vendas i on (i.cod_itens_vendas = p.cod_itens_vendas) ');
     q_dados.sql.add(' where i.cod_itens_vendas = ' + QuotedStr(cod_itens_vendas) + ' ');
     q_dados.open;








end;

end.
