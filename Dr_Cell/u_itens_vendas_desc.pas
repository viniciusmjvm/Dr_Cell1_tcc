unit u_itens_vendas_desc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  Tf_itens_vendas_desc = class(TForm)
    q_dados: TFDQuery;
    ds_dados: TDataSource;
    Bevel1: TBevel;
    Label1: TLabel;
    edit_sub: TDBEdit;
    Label2: TLabel;
    edit_desc_r: TDBEdit;
    edit_desc_p: TDBEdit;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    b_salvar: TBitBtn;
    b_cancelar: TBitBtn;
    Label6: TLabel;
    l_itens_venda_desc: TLabel;
    Label7: TLabel;
    Bevel2: TBevel;
    pesq: TFDQuery;
    ds_pesq: TDataSource;
    pesqtotal_liquido: TFloatField;
    q_dadoscod_desconto: TFDAutoIncField;
    q_dadoscod_itens_vendas: TIntegerField;
    q_dadossub_total: TFloatField;
    q_dadosdescr: TFloatField;
    q_dadosdescp: TFloatField;
    edit_total: TDBEdit;
    q_dadostotal: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure b_salvarClick(Sender: TObject);
    procedure b_cancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cod_venda : string;
    num_venda : string;
    cod_itens_vendas : string;
     procedure load_query;
  end;

var
  f_itens_vendas_desc: Tf_itens_vendas_desc;

implementation
uses  u_dm, funcoes;
{$R *.dfm}

procedure Tf_itens_vendas_desc.b_cancelarClick(Sender: TObject);
begin
     close;
end;

procedure Tf_itens_vendas_desc.b_salvarClick(Sender: TObject);
begin
      //showmessage('erro');
     if edit_desc_r.text = '' then
     begin
          MessageDlg('O campo de desconto em R$ deve ser informado !',mtWarning,[mbOk],0);
          edit_desc_r.SetFocus;
          exit;
     end;
     // showmessage('erro1');
     if not is_real(edit_desc_r.text) then
     begin
          MessageDlg('O campo de desconto em R$ deve ser valido !',mtWarning,[mbOk],0);
          edit_desc_r.SetFocus;
          exit;
     end;
     //showmessage('erro2');
     if edit_desc_p.text = '' then
     begin
          MessageDlg('O campo de desconto em % deve ser informado !',mtWarning,[mbOk],0);
          edit_desc_r.SetFocus;
          exit;
     end;
      //showmessage('erro3');
     if not is_real(edit_desc_p.text) then
     begin
          MessageDlg('O campo de desconto em % deve ser um numero valido !',mtWarning,[mbOk],0);
          edit_desc_p.SetFocus;
          exit;
     end;
     //showmessage('erro4');



     dm.q_geral.sql.clear;
     dm.q_geral.sql.add(' select count(*) as total from descontos ' +
                        ' where cod_itens_vendas = ' +QuotedStr(cod_itens_vendas)+ ' ');

    //--------------------------------
     dm.q_geral.open;
     if dm.q_geral.fieldbyname('total').AsInteger = 0 then
     begin
          showmessage('erro5');
          dm.q_geral.sql.clear;
          dm.q_geral.sql.add(' insert into descontos (cod_itens_vendas, descr, descp, total ) ' +
                             ' values('  +QuotedStr(cod_itens_vendas)+ ',' +
                                          QuotedStr(edit_desc_r.text)+ ',' +
                                          RealUSA(edit_desc_p.text)+ ',' +
                                          RealUSA(edit_total.text) +')');


          showmessage('erro6');
          dm.q_geral.ExecSql;
          edit_desc_r.text:= '';
          edit_desc_p.text:= '';
          edit_desc_r.setfocus;
          load_query;
          pesq.Open;

          showmessage('erro6');

     end;
     //close;

end;

procedure Tf_itens_vendas_desc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
     f_itens_vendas_desc:= nil;
end;

procedure Tf_itens_vendas_desc.FormCreate(Sender: TObject);
begin
     q_dados.Open;
     pesq.Open();
end;


procedure Tf_itens_vendas_desc.load_query;
begin  {
//atualizar esse select da mesma forma que está dentro do grid od fdquery
     q_dados.sql.clear;
     q_dados.sql.add(' select	d.*, ');
     q_dados.sql.add(' i.cod_itens_vendas as itens ');
     q_dados.sql.add(' from descontos d ');
     q_dados.sql.add('  ');
     q_dados.sql.add(' inner join itens_bendas i on (d.cod_itens_vendas = i.cod_itens_vendas) ');
     //q_dados.sql.add(' where i.cod_venda = ' + QuotedStr(cod_venda) + ' ');
    // q_dados.sql.add(' order by produtos ');
     q_dados.open;
      }
end;

end.
