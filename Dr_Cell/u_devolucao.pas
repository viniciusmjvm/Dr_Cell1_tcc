unit u_devolucao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.CheckLst,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls;

type
  Tf_devolucao = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    Button2: TButton;
    rad1: TRadioButton;
    DBGrid1: TDBGrid;
    q_dados: TFDQuery;
    ds_dados: TDataSource;
    edit_num: TEdit;
    q_dadoscod_venda: TFDAutoIncField;
    q_dadosnum_venda: TIntegerField;
    q_dadoscod_cliente: TIntegerField;
    q_dadosobservacao: TMemoField;
    q_dadosdata: TSQLTimeStampField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edit_numChange(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
      tabela, campo_chave, campo_pesquisa, cod_venda : string;

      procedure carregar_dados(p:string); virtual;
  end;

var
  f_devolucao: Tf_devolucao;

implementation

{$R *.dfm}

uses u_pesquisa, u_dm;

procedure Tf_devolucao.carregar_dados(p: string);
begin
     q_dados.SQL.Clear;
     q_dados.SQL.add('select  v.num_vendap.descricao,i.valor,i.quantidade');
     q_dados.SQL.add(' from vendas v');
     q_dados.SQL.add(' inner join itens_vendas i on (i.cod_venda = v.cod_venda)');
     q_dados.SQL.add(' inner join produtos p on (i.cod_produto = p.cod_produto)');
     q_dados.SQL.add(' where v.num_venda like '+'%' + QuotedStr(edit_num.Text)+'%');
     q_dados.SQL.add(' order by p.descricao' );
     q_dados.Open;
end;
procedure Tf_devolucao.edit_numChange(Sender: TObject);
begin
     carregar_dados(edit_num.Text);
end;
procedure Tf_devolucao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     f_devolucao:= nil;
end;

end.
