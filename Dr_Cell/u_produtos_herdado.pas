unit u_produtos_herdado;

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
  Tf_produtos_herdado = class(Tf_cadastropadrao)
    PageControl1: TPageControl;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    edit_descricao: TDBEdit;
    Label3: TLabel;
    edit_ean: TDBEdit;
    Label4: TLabel;
    edit_custo: TDBEdit;
    Label5: TLabel;
    edit_venda: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cb1: TDBLookupComboBox;
    cb2: TDBLookupComboBox;
    cb3: TDBLookupComboBox;
    q_unidades: TFDQuery;
    ds_unidades: TDataSource;
    ds_categoria: TDataSource;
    q_categoria: TFDQuery;
    ds_marca: TDataSource;
    q_marca: TFDQuery;
    Dados: TTabSheet;
    ds: TTabSheet;
    q_dadoscod_produto: TFDAutoIncField;
    q_dadosdescricao: TStringField;
    q_dadoscod_EAN: TIntegerField;
    q_dadospreco_custo: TFloatField;
    q_dadospreco_venda: TFloatField;
    q_dadoscod_unidade: TIntegerField;
    q_dadoscod_categoria: TIntegerField;
    q_dadoscod_marca: TIntegerField;
    edit_atual: TDBEdit;
    Label9: TLabel;
    edit_minimo: TDBEdit;
    Label10: TLabel;
    q_dadosestoque_atual: TIntegerField;
    q_dadosestoque_minimo: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure b_excluirClick(Sender: TObject);
    procedure edit_descricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_eanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_custoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_vendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cb2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cb3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
  f_produtos_herdado: Tf_produtos_herdado;

implementation

uses u_dm;
{$R *.dfm}
procedure Tf_produtos_herdado.b_alterarClick(Sender: TObject);
begin
  inherited;
  pagecontrol1.TabIndex:= 0;
  edit_descricao.SetFocus;
end;

procedure Tf_produtos_herdado.b_excluirClick(Sender: TObject);
begin
     dm.q_geral.sql.Clear;
     dm.q_geral.sql.add(' select count(*) as total ' );
     dm.q_geral.sql.add(' from itens_contas ');
     dm.q_geral.sql.add(' where cod_produto = ' + QuotedStr(q_dados.FieldByName('cod_produto').AsString) );
     dm.q_geral.Open;
     if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
     begin
          ShowMessage('N?o ? poss?vel excluir esse Produto, porque h? Itens da Conta relacionadas !');
          exit;
     end;

     dm.q_geral.sql.Clear;
     dm.q_geral.sql.add(' select count(*) as total ' );
     dm.q_geral.sql.add(' from itens_vendas ');
     dm.q_geral.sql.add(' where cod_produto = ' + QuotedStr(q_dados.FieldByName('cod_produto').AsString) );
     dm.q_geral.Open;
     if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
     begin
          ShowMessage('N?o ? poss?vel excluir esse Produto, porque h? Itens da Venda relacionadas !');
          exit;
     end;

     inherited;

end;

procedure Tf_produtos_herdado.b_incluirClick(Sender: TObject);
begin
  inherited;
  pagecontrol1.TabIndex:= 0;
  edit_descricao.SetFocus;
end;

procedure Tf_produtos_herdado.controle_visual;
begin
     inherited;

     edit_descricao.Enabled := q_dados.State in [dsEdit, dsInsert];
     edit_ean.Enabled       := edit_descricao.Enabled;
     edit_custo.Enabled     := edit_descricao.Enabled;
     edit_venda.Enabled     := edit_descricao.Enabled;
     edit_minimo.Enabled    := edit_descricao.Enabled;
     edit_atual.Enabled     := edit_descricao.Enabled;
     cb1.Enabled            := edit_descricao.Enabled;
     cb2.Enabled            := edit_descricao.Enabled;
     cb3.Enabled            := edit_descricao.Enabled;

end;


function Tf_produtos_herdado.validar;
begin
     if trim(edit_descricao.Text) = '' then
     begin
          pagecontrol1.TabIndex:= 0;
          ShowMessage('A descric??o deve ser preenchido!');
          edit_descricao.SetFocus;
          exit;
     end;

     if trim(edit_custo.Text) = '' then
     begin
          pagecontrol1.TabIndex:= 0;
          ShowMessage('O Pre?o de custo deve ser preenchido!');
          edit_custo.SetFocus;
          exit;
     end;

     if trim(edit_venda.Text) = '' then
     begin
          pagecontrol1.TabIndex:= 0;
          ShowMessage('O Pre?o de venda deve ser preenchido!');
          edit_venda.SetFocus;
          exit;
     end;

     if trim(edit_minimo.Text) = '' then
     begin
          pagecontrol1.TabIndex:= 0;
          ShowMessage('O estoque minimo deve ser preenchido!');
          edit_minimo.SetFocus;
          exit;
     end;

     if trim(edit_atual.Text) = '' then
     begin
          pagecontrol1.TabIndex:= 0;
          ShowMessage('O estoque atual deve ser preenchido!');
          edit_atual.SetFocus;
          exit;
     end;

     if (cb1.KeyValue = null) OR (cb1.KeyValue = 0) then
     begin
          pagecontrol1.TabIndex:= 1;
          ShowMessage('A Unidade deve ser selecionada !');
          cb1.SetFocus;
          exit;
     end;

     if (cb2.KeyValue = null) OR (cb2.KeyValue = 0) then
     begin
          pagecontrol1.TabIndex:= 1;
          ShowMessage('A Categoria deve ser selecionada !');
          cb2.SetFocus;
          exit;
     end;

     if (cb3.KeyValue = null) OR (cb3.KeyValue = 0) then
     begin
          pagecontrol1.TabIndex:= 1;
          ShowMessage('A Marca deve ser selecionada !');
          cb3.SetFocus;
          exit;
     end;

     result:= true;

end;

procedure Tf_produtos_herdado.edit_custoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_produtos_herdado.edit_descricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_produtos_herdado.edit_eanKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_produtos_herdado.edit_vendaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_produtos_herdado.cb1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_produtos_herdado.cb2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_produtos_herdado.cb3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_produtos_herdado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     inherited;
     Action:= caFree;
     f_produtos_herdado:= nil;
end;

procedure Tf_produtos_herdado.FormCreate(Sender: TObject);
begin
     inherited;
     q_categoria.open;
     q_unidades.Open;
     q_marca.Open;
end;
end.
