unit u_itens_contas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u_dm, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  Tf_itens_contas = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    b_produto: TSpeedButton;
    l_itens_conta: TLabel;
    b_incluir: TButton;
    grid_dados: TDBGrid;
    b_fechar: TButton;
    b_excluir: TButton;
    edit_cod_produto: TEdit;
    edit_descricao_produto: TEdit;
    edit_valor: TEdit;
    edit_quantidade: TEdit;
    q_dados: TFDQuery;
    ds_dados: TDataSource;
    q_dadoscod_itens_contas: TFDAutoIncField;
    q_dadoscod_produto: TIntegerField;
    q_dadosquantidade: TIntegerField;
    q_dadosvalor: TFloatField;
    q_dadoscod_conta: TIntegerField;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edit_qtd: TDBEdit;
    edit_total: TDBEdit;
    q_dadosvalor_total: TFloatField;
    pesq: TFDQuery;
    ds_pesq: TDataSource;
    procedure edit_cod_produtoChange(Sender: TObject);
    procedure b_produtoClick(Sender: TObject);
    procedure b_incluirClick(Sender: TObject);
    procedure b_excluirClick(Sender: TObject);
    procedure b_fecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure b_incluirKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_cod_produtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_quantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_cod_produtoKeyPress(Sender: TObject; var Key: Char);
    procedure edit_quantidadeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    cod_conta : string;
    num_conta : string;
    cod_itens_contas : string;
    procedure load_query;
//    procedure sum_dados;
  end;

var
  f_itens_contas: Tf_itens_contas;

implementation

uses  u_contas_herdados, funcoes, u_pesquisa;
{$R *.dfm}

procedure Tf_itens_contas.load_query;
begin
     q_dados.sql.clear;
     q_dados.sql.add(' select	i.*, ');
     q_dados.sql.add(' p.descricao as produtos ');
     q_dados.sql.add(' from itens_contas i ');
     q_dados.sql.add('  ');
     q_dados.sql.add(' inner join produtos p on (i.cod_produto = p.cod_produto) ');
     q_dados.sql.add(' where i.cod_conta = ' + QuotedStr(cod_conta) + ' ');
     q_dados.sql.add(' order by produtos ');
     q_dados.open;

end;

procedure Tf_itens_contas.b_excluirClick(Sender: TObject);
begin
     // verificando se há informações na query
     if q_dados.isempty then
     begin
          MessageDlg('Não há um registro selecionado para excluir !',mtError,[mbOk],0);
          exit;
     end;

     pesq.Close;

     if MessageDlg('Deseja realmente excluir o produto ' +
                   q_dados.fieldbyname('cod_produto').AsString +
                   ' deste item da conta ??',
         mtConfirmation,[mbYes,mbNo],0) = mrYes then
     begin
          dm.q_geral.sql.clear;
          dm.q_geral.sql.add(' delete from itens_contas ');
          dm.q_geral.sql.add(' where ' +
                             //' cod_venda = '   + q_dados.fieldbyname('cod_venda').AsString + ' and ' +
                             ' cod_itens_contas = ' + q_dados.fieldbyname('cod_itens_contas').AsString);

     end;

         dm.q_geral.ExecSql;

          edit_cod_produto.text:= '';
          edit_quantidade.text:= '';
          edit_valor.text:= '';
          edit_cod_produto.setfocus;

          load_query;
          pesq.open;
end;

procedure Tf_itens_contas.b_fecharClick(Sender: TObject);
begin
     close;
end;

procedure Tf_itens_contas.b_incluirClick(Sender: TObject);
begin
     if edit_cod_produto.text = '' then
     begin
          MessageDlg('O Cód do produto deve ser informado !',mtWarning,[mbOk],0);
          edit_cod_produto.SetFocus;
          exit;
     end;
     if edit_descricao_produto.text = '' then
     begin
          MessageDlg('O Cód do produto deve ser valido !',mtWarning,[mbOk],0);
          edit_cod_produto.SetFocus;
          exit;
     end;
     if edit_quantidade.text = '' then
     begin
          MessageDlg('A quantidade deve ser preenchida !',mtWarning,[mbOk],0);
          edit_quantidade.SetFocus;
          exit;
     end;

     if not is_real(edit_quantidade.text) then
     begin
          MessageDlg('A quantidade deve ser um número válido !',mtWarning,[mbOk],0);
          edit_quantidade.SetFocus;
          exit;
     end;

     dm.q_geral.sql.clear;
     dm.q_geral.sql.add(' select count(*) as total from itens_contas ' +
                        ' where cod_produto = ' + QuotedStr(edit_cod_produto.text) +
                        '       and cod_conta = ' + QuotedStr(cod_conta) + ' ');
    //--------------------------------
     dm.q_geral.open;
     pesq.Close;
     if dm.q_geral.fieldbyname('total').AsInteger = 0 then
     begin
          dm.q_geral.sql.clear;
          dm.q_geral.sql.add(' insert into itens_contas (cod_produto, cod_conta, quantidade, valor ) ' +
                             ' values('  +QuotedStr(edit_cod_produto.text)+ ',' +
                                          QuotedStr(cod_conta)+ ',' +
                                          RealUSA(edit_quantidade.text)+ ',' +
                                          RealUSA(edit_valor.text) +')');
          dm.q_geral.ExecSql;
          edit_cod_produto.text:= '';
          edit_quantidade.text:= '';
          edit_valor.text:= '';
          edit_cod_produto.setfocus;
          load_query;
          pesq.open;
     end // se o ingrediente não estiver cadastrado
     else begin
     pesq.Close;
          MessageDlg('Este produto já está nos itens da vendas !',mtWarning,[mbOk],0);
     pesq.Open;
     end;
end;

procedure Tf_itens_contas.b_incluirKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = VK_RETURN then
     begin
          b_incluir.OnClick(self);
     end;
end;

procedure Tf_itens_contas.b_produtoClick(Sender: TObject);
begin
     f_pesquisa:= TF_Pesquisa.create(application);

      f_pesquisa.tabela:= 'produtos';
      f_pesquisa.codigo:= 'cod_produto';
      f_pesquisa.campo1:= 'descricao';
      f_pesquisa.campo2:= '';

      f_pesquisa.rotulo_codigo:= 'Código';
      f_pesquisa.rotulo_c1:= 'Produto';
      f_pesquisa.rotulo_c2:= '';

      f_pesquisa.largura_codigo:= 0.10; // 10% da largura do dbgrid
      f_pesquisa.largura_c1:= 0.80;
      f_pesquisa.largura_c2:= 0.0;

      // se o usuário clicou no enter
      if f_pesquisa.ShowModal = mrOk then
      begin
        // se a pesquisa não estiver vazia
        if not f_pesquisa.q_dados.isempty then
        begin
          edit_cod_produto.text:= f_pesquisa.q_dados.fieldbyname('cod_produto').AsString;
        end;

      end; // if ok....

      f_pesquisa.free;
end;

procedure Tf_itens_contas.edit_cod_produtoChange(Sender: TObject);
begin
     dm.q_geral.sql.clear;
     dm.q_geral.sql.add(' select descricao ' +
                           ' from produtos ' +
                           ' where cod_produto = ' + QuotedStr(edit_cod_produto.text) );
     dm.q_geral.open;

     // se o ingrediente foi encontrado
     if not dm.q_geral.isempty then
     begin
          edit_descricao_produto.text:= dm.q_geral.fieldbyname('descricao').AsString ;
     end
     else begin
          edit_descricao_produto.text:= '';
     end;
//====================================================================
     dm.q_geral.sql.clear;
     dm.q_geral.sql.add(' select preco_venda ' +
                           ' from produtos ' +
                           ' where cod_produto = ' + QuotedStr(edit_cod_produto.text) );
     dm.q_geral.open;

     // se o ingrediente foi encontrado
     if not dm.q_geral.isempty then
     begin
          edit_valor.text:= dm.q_geral.fieldbyname('preco_venda').AsString ;
     end
     else begin
          edit_valor.text:= '';
     end;
end;

procedure Tf_itens_contas.edit_cod_produtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if key = VK_RETURN then
     begin
          b_incluir.OnClick(self);
     end;
end;

procedure Tf_itens_contas.edit_cod_produtoKeyPress(Sender: TObject;
  var Key: Char);
begin
//     if not (key in ['1','2','3','4','5','6','7','8','9','0',',','x']) then
//     key :=#0;
end;

procedure Tf_itens_contas.edit_quantidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = VK_RETURN then
     begin
          b_incluir.OnClick(self);
     end;
end;

procedure Tf_itens_contas.edit_quantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
//     if not (key in ['1','2','3','4','5','6','7','8','9','0',',','x']) then
//     key :=#0;
end;

procedure Tf_itens_contas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     f_itens_contas:= nil;
end;

procedure Tf_itens_contas.FormCreate(Sender: TObject);
begin
     q_dados.Open;
     pesq.Open;
end;

end.
