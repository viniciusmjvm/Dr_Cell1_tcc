unit u_cadastropadrao;

interface

uses
  u_dm,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  Tf_cadastropadrao = class(TForm)
    Bevel1: TBevel;
    b_gravar: TButton;
    b_cancelar: TButton;
    Label1: TLabel;
    edit_pesquisa: TEdit;
    b_incluir: TButton;
    b_alterar: TButton;
    b_excluir: TButton;
    b_fechar: TButton;
    q_dados: TFDQuery;
    ds_dados: TDataSource;
    grid_dados: TDBGrid;
    procedure edit_pesquisaChange(Sender: TObject);
    procedure q_dadosAfterCancel(DataSet: TDataSet);
    procedure q_dadosAfterClose(DataSet: TDataSet);
    procedure q_dadosAfterDelete(DataSet: TDataSet);
    procedure q_dadosAfterEdit(DataSet: TDataSet);
    procedure q_dadosAfterOpen(DataSet: TDataSet);
    procedure q_dadosAfterInsert(DataSet: TDataSet);
    procedure q_dadosAfterPost(DataSet: TDataSet);
    procedure b_incluirClick(Sender: TObject);
    procedure b_alterarClick(Sender: TObject);
    procedure b_excluirClick(Sender: TObject);
    procedure b_fecharClick(Sender: TObject);
    procedure b_gravarClick(Sender: TObject);
    procedure b_cancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure b_excluirKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public

        tabela, campo_chave, campo_pesquisa : string;

        procedure carregar_dados(p:string); virtual;

    { Public declarations }

  protected

           procedure controle_visual; virtual;
           function pode_excluir : string; virtual;
           function validar : boolean; virtual;
  end;

var
  f_cadastropadrao: Tf_cadastropadrao;

implementation

{$R *.dfm}

procedure Tf_cadastropadrao.b_alterarClick(Sender: TObject);
begin
     if q_dados.IsEmpty then
     begin
          ShowMessage('Não há um registro selecionado para alterar!');
          exit
     end;

     q_dados.Edit;
end;

procedure Tf_cadastropadrao.b_cancelarClick(Sender: TObject);
begin
     q_dados.Cancel;
end;

procedure Tf_cadastropadrao.b_excluirClick(Sender: TObject);
var
   erro : string;
begin
     if q_dados.IsEmpty then
     begin
          ShowMessage('Não há um registro selecionado para excluir!');
          exit;
     end;

     erro:= pode_excluir;

     if erro = ' ' then
     begin
          if MessageDlg('Deseja realmente excluir esse registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
          begin
            q_dados.Delete;
            carregar_dados('');
          end;
     end
     else begin
          ShowMessage( erro );
     end;
end;

procedure Tf_cadastropadrao.b_excluirKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = VK_DELETE then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_cadastropadrao.b_fecharClick(Sender: TObject);
begin
     close;
end;

procedure Tf_cadastropadrao.b_gravarClick(Sender: TObject);
begin
     if validar then
     begin
          q_dados.Post;
     end;
end;

procedure Tf_cadastropadrao.b_incluirClick(Sender: TObject);
begin
     q_dados.Insert;
end;

procedure Tf_cadastropadrao.carregar_dados(p: string);
begin
     q_dados.SQL.Clear;
     q_dados.SQL.add(' select * ');
     q_dados.SQL.add(' from ' + tabela+ ' ');
     q_dados.SQL.add(' where ' + campo_pesquisa + ' like ' + QuotedStr('%'+p+'%') + ' ');
     q_dados.SQL.add(' order by ' + campo_pesquisa + ' ');
     q_dados.Open;
end;

procedure Tf_cadastropadrao.controle_visual;
begin
     b_gravar.Enabled:= q_dados.State in [dsEdit, dsInsert];
     b_cancelar.Enabled:= b_gravar.Enabled;
     grid_dados.Enabled:= not b_gravar.Enabled;
     b_incluir.Enabled:= not b_gravar.Enabled;
     b_alterar.Enabled:= not b_gravar.Enabled;
     b_excluir.Enabled:= not b_gravar.Enabled;
     b_fechar.Enabled:= not b_gravar.Enabled;
     edit_pesquisa.Enabled:= not b_gravar.Enabled;
     if edit_pesquisa.Enabled then
     begin
          edit_pesquisa.Color:= clWhite;
     end
     else begin
          edit_pesquisa.Color:= clSilver;
     end;

end;

procedure Tf_cadastropadrao.edit_pesquisaChange(Sender: TObject);
begin
     carregar_dados(edit_pesquisa.Text);
end;

procedure Tf_cadastropadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:= caFree;
     f_cadastropadrao:= nil;
end;

procedure Tf_cadastropadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = VK_RETURN  then
     begin
          b_incluir.OnClick(self);
     end;

     if key = VK_ESCAPE then
     begin
          close;
     end;
end;

function Tf_cadastropadrao.validar;
begin
     result:= true;
end;

function Tf_cadastropadrao.pode_excluir;
begin
     result:= ' ';
end;



procedure Tf_cadastropadrao.q_dadosAfterCancel(DataSet: TDataSet);
begin
     controle_visual;
end;

procedure Tf_cadastropadrao.q_dadosAfterClose(DataSet: TDataSet);
begin
     controle_visual;
end;

procedure Tf_cadastropadrao.q_dadosAfterDelete(DataSet: TDataSet);
begin
     controle_visual;
end;

procedure Tf_cadastropadrao.q_dadosAfterEdit(DataSet: TDataSet);
begin
     controle_visual;
end;

procedure Tf_cadastropadrao.q_dadosAfterInsert(DataSet: TDataSet);
begin
     controle_visual;
end;

procedure Tf_cadastropadrao.q_dadosAfterOpen(DataSet: TDataSet);
begin
     controle_visual;
end;

procedure Tf_cadastropadrao.q_dadosAfterPost(DataSet: TDataSet);
begin
     controle_visual;
end;

end.
