unit u_itens_reparo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls;

type
  Tf_itens_reparo = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    l_itens_reparo: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    b_incluir: TButton;
    grid_dados: TDBGrid;
    b_excluir: TButton;
    edit_qtd: TDBEdit;
    PageControl1: TPageControl;
    Label15: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    b_produto: TSpeedButton;
    edit_sub_total: TEdit;
    edit_quantidade: TEdit;
    edit_valor: TEdit;
    edit_descricao_peca: TEdit;
    edit_cod_peca: TEdit;
    TabSheet2: TTabSheet;
    Label14: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    edit_desc_p: TEdit;
    edit_desc_r: TEdit;
    edit_total: TEdit;
    edit_valor_total: TDBEdit;
    q_dados: TFDQuery;
    ds_dados: TDataSource;
    pesq: TFDQuery;
    pesqtotal_itens: TIntegerField;
    pesqvalor_total: TFloatField;
    ds_pesq: TDataSource;
    q_dadoscod_itens_reparos: TFDAutoIncField;
    q_dadoscod_peca: TIntegerField;
    q_dadoscod_reparo: TIntegerField;
    q_dadosquantidade: TIntegerField;
    q_dadosvalor: TFloatField;
    q_dadossub_total: TFloatField;
    q_dadosdescr: TFloatField;
    q_dadostotal: TFloatField;
    procedure edit_cod_pecaChange(Sender: TObject);
    procedure b_produtoClick(Sender: TObject);
    procedure b_excluirClick(Sender: TObject);
    procedure b_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure b_fecharClick(Sender: TObject);
    procedure edit_cod_pecaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_quantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_quantidadeChange(Sender: TObject);
    procedure edit_desc_rChange(Sender: TObject);
    procedure edit_desc_pChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    cod_reparo : string;
    num_reparo : string;
    cod_itens_reparos : string;
    procedure load_query;
  end;

var
  f_itens_reparo: Tf_itens_reparo;

implementation
uses u_dm, u_reparo, funcoes, u_pesquisa;
{$R *.dfm}

procedure Tf_itens_reparo.b_excluirClick(Sender: TObject);
begin
          // verificando se h? informa??es na query
     if q_dados.isempty then
     begin
          MessageDlg('N?o h? um registro selecionado para excluir !',mtError,[mbOk],0);
          exit;
     end;

     pesq.Close;
     if MessageDlg('Deseja realmente excluir a Pe?a ' +
                   q_dados.fieldbyname('cod_peca').AsString +
                   ' deste item do Reparo ??',
         mtConfirmation,[mbYes,mbNo],0) = mrYes then
     begin
          dm.q_geral.sql.clear;
          dm.q_geral.sql.add(' delete from itens_reparos ');
          dm.q_geral.sql.add(' where ' +
                             ' cod_itens_reparos = ' +
                             q_dados.fieldbyname('cod_itens_reparos').AsString);

     end;
         dm.q_geral.ExecSql;
         edit_cod_peca.text:= '';
         edit_quantidade.text:= '';
         edit_valor.text:= '';
         edit_cod_peca.setfocus;
         pesq.Open;
         load_query;
end;

procedure Tf_itens_reparo.b_fecharClick(Sender: TObject);
begin
     close;
end;

procedure Tf_itens_reparo.b_incluirClick(Sender: TObject);
begin
     if edit_cod_peca.text = '' then
     begin
          MessageDlg('O ?C?d da Pe?a deve ser Informado !',mtWarning,[mbOk],0);
          edit_cod_peca.SetFocus;
          exit;
     end;

     if edit_descricao_peca.text = '' then
     begin
          MessageDlg('O C?d da Pe?a deve ser valido !',mtWarning,[mbOk],0);
          edit_cod_peca.SetFocus;
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
     dm.q_geral.sql.add(' select count(*) as total from itens_reparos ' +
                        ' where cod_peca = ' + QuotedStr(edit_cod_peca.text) +
                        '       and cod_reparo = ' + QuotedStr(cod_reparo) + ' ');
    //--------------------------------
     dm.q_geral.open;
     pesq.Close;
     if dm.q_geral.fieldbyname('total').AsInteger = 0 then
     begin
          dm.q_geral.sql.clear;
          dm.q_geral.sql.add(' insert into itens_reparos (cod_peca, cod_reparo, quantidade, valor, sub_total, descr, total ) ' +
                             ' values('  +QuotedStr(edit_cod_peca.text)+ ',' +
                                          QuotedStr(cod_reparo)+ ',' +
                                          RealUSA(edit_quantidade.text)     + ',' +
                                          RealUSA(edit_valor.text)          + ',' +
                                          RealUSA(edit_sub_total.text)      + ',' +
                                          RealUSA(edit_desc_r.text)         + ',' +
                                          RealUSA(edit_total.text)          +')');
     //============================================================================================================================
          dm.q_geral.sql.add(' update pecas set  ' +
                              'estoque_atual = estoque_atual -'+
                              RealUSA(edit_quantidade.text)+
                              'where cod_peca = '+QuotedStr(edit_cod_peca.text));
          dm.q_geral.ExecSql;
          edit_cod_peca.text:= '';
          edit_descricao_peca.text:= '';
          edit_quantidade.text:= '';
          edit_valor.text:= '';
          edit_sub_total.text:= '';
          edit_desc_r.text:= '';
          edit_desc_p.text:= '';
          edit_total.text:= '';
          pagecontrol1.TabIndex:= 0;
          edit_cod_peca.setfocus;
          load_query;
          pesq.Open;

     end // se o ingrediente n?o estiver cadastrado
     else begin
          pesq.Close;
          MessageDlg('Este produto j? est? nos itens da vendas !',mtWarning,[mbOk],0);
          pesq.Open;
     end;
end;

procedure Tf_itens_reparo.b_produtoClick(Sender: TObject);
begin
     f_pesquisa:= TF_Pesquisa.create(application);

      f_pesquisa.tabela:= 'pecas';
      f_pesquisa.codigo:= 'cod_peca';
      f_pesquisa.campo1:= 'descricao';
      f_pesquisa.campo2:= '';

      f_pesquisa.rotulo_codigo:= 'C?digo';
      f_pesquisa.rotulo_c1:= 'Pe?a';
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
          edit_cod_peca.text:= f_pesquisa.q_dados.fieldbyname('cod_peca').AsString;
        end;

      end; // if ok....

      f_pesquisa.free;
end;

procedure Tf_itens_reparo.edit_cod_pecaChange(Sender: TObject);
begin
     dm.q_geral.sql.clear;
     dm.q_geral.sql.add(' select descricao ' +
                           ' from pecas ' +
                           ' where cod_peca = ' + QuotedStr(edit_cod_peca.text) );
     dm.q_geral.open;

     // se o ingrediente foi encontrado
     if not dm.q_geral.isempty then
     begin
          edit_descricao_peca.text:= dm.q_geral.fieldbyname('descricao').AsString ;
     end
     else begin
          edit_descricao_peca.text:= '';
     end;
//====================================================================
     dm.q_geral.sql.clear;
     dm.q_geral.sql.add(' select valor ' +
                           ' from pecas ' +
                           ' where cod_peca = ' + QuotedStr(edit_cod_peca.text) );
     dm.q_geral.open;

     // se o ingrediente foi encontrado
     if not dm.q_geral.isempty then
     begin
          edit_valor.text:= dm.q_geral.fieldbyname('valor').AsString ;
     end
     else begin
          edit_valor.text:= '';
     end;
end;

procedure Tf_itens_reparo.edit_cod_pecaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = VK_RETURN then
     begin
          b_incluir.OnClick(self);
     end;
end;

procedure Tf_itens_reparo.edit_desc_pChange(Sender: TObject);
begin
     edit_desc_r.text := FloatToStr( StrToFloatDef( edit_desc_p.text,0  )
     / 100 * StrToFloatDef( edit_sub_total.text,0  ) );
end;

procedure Tf_itens_reparo.edit_desc_rChange(Sender: TObject);
begin
     edit_desc_p.text := FloatToStr((100 * StrToFloatDef( edit_desc_r.text,0  )
     / StrToFloatDef( edit_sub_total.text,0  )) );

     edit_total.text := FloatToStr( StrToFloatDef( edit_sub_total.text,0  )
     - StrToFloatDef( edit_desc_r.text,0  ) );
end;

procedure Tf_itens_reparo.edit_quantidadeChange(Sender: TObject);
begin
      edit_sub_total.text := FloatToStr( StrToFloatDef( edit_quantidade.text,0  )
     * StrToFloatDef( edit_valor.text,0  ) );
end;

procedure Tf_itens_reparo.edit_quantidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = VK_RETURN then
     begin
          b_incluir.OnClick(self);
     end;
end;

procedure Tf_itens_reparo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
     f_itens_reparo:= nil;
end;

procedure Tf_itens_reparo.FormCreate(Sender: TObject);
begin
     q_dados.Open;
     pesq.Open;
end;

procedure Tf_itens_reparo.load_query;
begin
     q_dados.sql.clear;
     q_dados.sql.add(' select	i.*, ');
     q_dados.sql.add(' p.descricao as pecas ');
     q_dados.sql.add(' from itens_reparos i ');
     q_dados.sql.add(' inner join pecas p on (i.cod_peca = p.cod_peca) ');
     q_dados.sql.add(' where i.cod_reparo = ' + QuotedStr(cod_reparo) + ' ');
     q_dados.sql.add(' order by pecas ');
     q_dados.open;
end;
end.
