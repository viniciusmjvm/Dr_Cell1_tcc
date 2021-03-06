unit u_itens_venda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, QuickRpt,
  QRCtrls, Vcl.ComCtrls;

type
  Tf_itens_vendas = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    b_incluir: TButton;
    grid_dados: TDBGrid;
    q_dados: TFDQuery;
    ds_dados: TDataSource;
    b_excluir: TButton;
    l_itens_venda: TLabel;
    q_dadoscod_itens_vendas: TFDAutoIncField;
    q_dadoscod_produto: TIntegerField;
    q_dadosquantidade: TIntegerField;
    q_dadosvalor: TFloatField;
    q_dadoscod_venda: TIntegerField;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    pesq: TFDQuery;
    pesqtotal_itens: TIntegerField;
    pesqvalor_total: TFloatField;
    edit_qtd: TDBEdit;
    ds_pesq: TDataSource;
    PageControl1: TPageControl;
    Label15: TLabel;
    edit_sub_total: TEdit;
    edit_quantidade: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edit_valor: TEdit;
    edit_descricao_produto: TEdit;
    Label6: TLabel;
    edit_cod_produto: TEdit;
    Label11: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    edit_ean: TEdit;
    b_produto: TSpeedButton;
    TabSheet2: TTabSheet;
    edit_desc_p: TEdit;
    Label14: TLabel;
    Label13: TLabel;
    edit_desc_r: TEdit;
    Label12: TLabel;
    Label16: TLabel;
    edit_total: TEdit;
    q_dadossub_total: TFloatField;
    q_dadosdescr: TFloatField;
    q_dadostotal: TFloatField;
    edit_valor_total: TDBEdit;
    b_pagar: TButton;
    procedure b_incluirClick(Sender: TObject);
    procedure b_excluirClick(Sender: TObject);
     procedure edit_cod_produtoChange(Sender: TObject);
    procedure edit_cod_produtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure b_produtoClick(Sender: TObject);
    procedure b_fecharClick(Sender: TObject);
//    procedure b_alterarClick(Sender: TObject);
   procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edit_quantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure b_incluirKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_eanChange(Sender: TObject);
    procedure edit_descricao_produtoChange(Sender: TObject);
    procedure edit_quantidadeChange(Sender: TObject);
    procedure edit_desc_rChange(Sender: TObject);
    procedure edit_desc_pChange(Sender: TObject);
    procedure b_pagarClick(Sender: TObject);


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
  f_itens_vendas: Tf_itens_vendas;
implementation
{$R *.dfm}
uses u_dm, u_vendas_herdado, funcoes, u_pesquisa, u_itens_vendas_desc,
  u_pagamentos;

procedure Tf_itens_vendas.b_pagarClick(Sender: TObject);
begin
     if q_dados.IsEmpty then
     begin
          ShowMessage('N?o h? uma venda selecionada para incluir os itens!');
          exit;
     end;

     if not Assigned(f_pagamentos) then
     begin

          // instanciando o formul?rio
          f_pagamentos:= Tf_pagamentos.create(application);
          f_pagamentos.cod_itens_vendas:= q_dados.FieldByName('cod_itens_vendas').AsString;
          f_pagamentos.l_pag.Caption:= q_dados.FieldByName('cod_itens_vendas').AsString;
          //f_itens_vendas.edit_num:= q_dados.FieldByName('num_venda').AsString;
          //f_pagamentos.load_query;
     end
     else begin
          f_pagamentos.Show;
     end;
end;

procedure Tf_itens_vendas.b_excluirClick(Sender: TObject);
begin
     // verificando se h? informa??es na query
     if q_dados.isempty then
     begin
          MessageDlg('N?o h? um registro selecionado para excluir !',mtError,[mbOk],0);
          exit;
     end;

     pesq.Close;

     if MessageDlg('Deseja realmente excluir o produto ' +
                   q_dados.fieldbyname('cod_produto').AsString +
                   ' deste item da venda ??',
         mtConfirmation,[mbYes,mbNo],0) = mrYes then
     begin
          dm.q_geral.sql.clear;
          dm.q_geral.sql.add(' delete from itens_vendas ');
          dm.q_geral.sql.add(' where ' +
                             //' cod_venda = '   + q_dados.fieldbyname('cod_venda').AsString + ' and ' +
                             ' cod_itens_vendas = ' + q_dados.fieldbyname('cod_itens_vendas').AsString);

     end;
         dm.q_geral.ExecSql;
         edit_ean.text:= '';
          edit_cod_produto.text:= '';
          edit_quantidade.text:= '';
          edit_valor.text:= '';
          edit_cod_produto.setfocus;
          load_query;
          pesq.Open;
end;
procedure Tf_itens_vendas.b_fecharClick(Sender: TObject);
begin
     close;
end;

procedure Tf_itens_vendas.b_incluirClick(Sender: TObject);
begin
     if edit_cod_produto.text = '' then
     begin
          MessageDlg('O C?d do produto deve ser informado !',mtWarning,[mbOk],0);
          edit_cod_produto.SetFocus;
          exit;
     end;
     if edit_descricao_produto.text = '' then
     begin
          MessageDlg('O C?d do Produto deve ser valido !',mtWarning,[mbOk],0);
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
          MessageDlg('A quantidade deve ser um n?mero v?lido !',mtWarning,[mbOk],0);
          edit_quantidade.SetFocus;
          exit;
     end;
     dm.q_geral.sql.clear;
     dm.q_geral.sql.add(' select count(*) as total from itens_vendas ' +
                        ' where cod_produto = ' + QuotedStr(edit_cod_produto.text) +
                        '       and cod_venda = ' + QuotedStr(cod_venda) + ' ');
    //--------------------------------
     dm.q_geral.open;
     pesq.Close;
     ShowMessage(' antes de entrar no if:  ');
     if dm.q_geral.fieldbyname('total').AsInteger = 0 then
     begin
          ShowMessage(' entrou no if:  ');
         { ShowMessage(' valor '+edit_valor.Text);
          ShowMessage(' sub total '+edit_sub_total.Text);
          ShowMessage(' desconto real '+edit_desc_r.Text);
          ShowMessage(' total '+edit_total.Text);   }
          dm.q_geral.sql.clear;
          dm.q_geral.sql.add(' insert into itens_vendas (cod_produto, cod_venda, quantidade, valor, sub_total, descr, total ) ' +
                             ' values('  +QuotedStr(edit_cod_produto.text)  + ',' +
                                          QuotedStr(cod_venda)              + ',' +
                                          RealUSA(edit_quantidade.text)     + ',' +
                                          RealUSA(edit_valor.text)          + ',' +
                                          RealUSA(edit_sub_total.text)      + ',' +
                                          RealUSA(edit_desc_r.text)         + ',' +
                                          RealUSA(edit_total.text)          +')');
     //==============================================================================================
          ShowMessage(' apos o insert e antes update:  ');

          dm.q_geral.sql.add(' update produtos set  ' +
                              'estoque_atual = estoque_atual -'+
                              RealUSA(edit_quantidade.text)+
                              'where cod_produto = '+QuotedStr(edit_cod_produto.text));
          ShowMessage(' apos o insert e apos update:  ');

          dm.q_geral.ExecSql;
          ShowMessage(' apos o execsql:  ');
          edit_ean.text:= '';
          edit_cod_produto.text:= '';
          edit_quantidade.text:= '';
          edit_valor.text:= '';
          edit_sub_total.text:= '';
          edit_desc_r.text:= '';
          edit_desc_p.text:= '';
          edit_total.text:= '';
          pagecontrol1.TabIndex:= 0;
          edit_cod_produto.setfocus;
          load_query;
          ShowMessage(' apos o load_query:');
          pesq.Open;

     end // se o ingrediente n?o estiver cadastrado
     else begin
     pesq.Close;
          MessageDlg('Este produto j? est? nos itens da vendas !',mtWarning,[mbOk],0);
     pesq.Open;
     end;
end;
procedure Tf_itens_vendas.b_incluirKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = VK_RETURN then
     begin
          b_incluir.OnClick(self);
     end;
end;
procedure Tf_itens_vendas.b_produtoClick(Sender: TObject);
begin
      f_pesquisa:= TF_Pesquisa.create(application);
      f_pesquisa.tabela:= 'produtos';
      f_pesquisa.codigo:= 'cod_produto';
      f_pesquisa.campo1:= 'descricao';
      f_pesquisa.campo2:= '';
      f_pesquisa.rotulo_codigo:= 'C?digo';
      f_pesquisa.rotulo_c1:= 'Produto';
      f_pesquisa.rotulo_c2:= '';
      f_pesquisa.largura_codigo:= 0.10; // 10% da largura do dbgrid
      f_pesquisa.largura_c1:= 0.80;
      f_pesquisa.largura_c2:= 0.0;
      // se o usu?rio clicou no enter
      if f_pesquisa.ShowModal = mrOk then
      begin
        // se a pesquisa n?o estiver vazia
        if not f_pesquisa.q_dados.isempty then
        begin
          edit_cod_produto.text:= f_pesquisa.q_dados.fieldbyname('cod_produto').AsString;
        end;
      end; // if ok....
      f_pesquisa.free;
end;

procedure Tf_itens_vendas.edit_desc_pChange(Sender: TObject);
begin
     edit_desc_r.text := FloatToStr( StrToFloatDef( edit_desc_p.text,0  )
     / 100 * StrToFloatDef( edit_sub_total.text,0  ) );
end;

procedure Tf_itens_vendas.edit_desc_rChange(Sender: TObject);
var
   x, n : string;
begin
     edit_desc_p.text := FloatToStr((100 * StrToFloatDef( edit_desc_r.text,0  )
     / StrToFloatDef( edit_sub_total.text,0  )) );

     edit_total.text := FloatToStr( StrToFloatDef( edit_sub_total.text,0  )
     - StrToFloatDef( edit_desc_r.text,0  ) );
end;

procedure Tf_itens_vendas.edit_cod_produtoChange(Sender: TObject);
begin
     dm.q_geral.sql.clear;
     dm.q_geral.sql.add(' select cod_EAN ' +
                           ' from produtos ' +
                           ' where cod_produto = ' + QuotedStr(edit_cod_produto.text) );
     dm.q_geral.open;
     // se o ingrediente foi encontrado
     if not dm.q_geral.isempty then
     begin
          edit_ean.text:= dm.q_geral.fieldbyname('cod_EAN').AsString ;
     end
     else begin
          edit_ean.text:= '';
     end;

end;

procedure Tf_itens_vendas.edit_cod_produtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if key = VK_RETURN then
     begin
          b_incluir.OnClick(self);
     end;
end;

procedure Tf_itens_vendas.edit_descricao_produtoChange(Sender: TObject);
begin
     dm.q_geral.sql.clear;
     dm.q_geral.sql.add(' select cod_produto ' +
                           ' from produtos ' +
                           ' where descricao = ' + QuotedStr(edit_descricao_produto.text) );
     dm.q_geral.open;

     // se o ingrediente foi encontrado
     if not dm.q_geral.isempty then
     begin
          edit_cod_produto.text:= dm.q_geral.fieldbyname('cod_produto').AsString ;
     end
     else begin
          edit_cod_produto.text:= '';
     end;
end;

procedure Tf_itens_vendas.edit_eanChange(Sender: TObject);
begin
     dm.q_geral.sql.clear;
     dm.q_geral.sql.add(' select descricao ' +
                           ' from produtos ' +
                           ' where cod_EAN = ' + QuotedStr(edit_ean.text) );
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
                           ' where cod_EAN = ' + QuotedStr(edit_ean.text) );
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

procedure Tf_itens_vendas.edit_quantidadeChange(Sender: TObject);
begin
     edit_sub_total.text := FloatToStr( StrToFloatDef( edit_quantidade.text,0  )
     * StrToFloatDef( edit_valor.text,0  ) );
end;

procedure Tf_itens_vendas.edit_quantidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = VK_RETURN then
     begin
          b_incluir.OnClick(self);
     end;
end;

procedure Tf_itens_vendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     f_itens_vendas:= nil;
end;
procedure Tf_itens_vendas.FormCreate(Sender: TObject);
begin
     q_dados.Open;
     pesq.Open;
end;
procedure Tf_itens_vendas.load_query;
begin
     q_dados.sql.clear;
     q_dados.sql.add(' select	i.*, ');
     q_dados.sql.add(' p.descricao as produtos ');
     q_dados.sql.add(' from itens_vendas i ');
     q_dados.sql.add('  ');
     q_dados.sql.add(' inner join produtos p on (i.cod_produto = p.cod_produto) ');
     q_dados.sql.add(' where i.cod_venda = ' + QuotedStr(cod_venda) + ' ');
     q_dados.sql.add(' order by produtos ');
     q_dados.open;

end;

end.
