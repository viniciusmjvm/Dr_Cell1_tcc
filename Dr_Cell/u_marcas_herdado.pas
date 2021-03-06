unit u_marcas_herdado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u_cadastropadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Mask, Vcl.DBCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tf_marcas_herdado = class(Tf_cadastropadrao)
    q_dadosnome: TStringField;
    Label2: TLabel;
    edit_nome: TDBEdit;
    q_dadoscod_marca: TFDAutoIncField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure b_excluirClick(Sender: TObject);
    procedure edit_nomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure b_incluirClick(Sender: TObject);
    procedure b_alterarClick(Sender: TObject);
  private
    { Private declarations }

   protected
            function Validar : boolean; override;
            // function pode_excluir: string; override;
             procedure controle_visual; override;
  public
    { Public declarations }
  end;

var
  f_marcas_herdado: Tf_marcas_herdado;

implementation

uses u_dm;


procedure Tf_marcas_herdado.b_incluirClick(Sender: TObject);
begin
  inherited;
  edit_nome.SetFocus;
end;

procedure Tf_marcas_herdado.controle_visual;
begin
  inherited;

  edit_nome.Enabled := q_dados.State in [dsEdit, dsInsert];
  //edit_descricao.Enabled := edit_descricao.Enabled;
end;

procedure Tf_marcas_herdado.edit_nomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

{$R *.dfm}
procedure Tf_marcas_herdado.b_alterarClick(Sender: TObject);
begin
  inherited;
  edit_nome.SetFocus;
end;

procedure Tf_marcas_herdado.b_excluirClick(Sender: TObject);
begin
     dm.q_geral.sql.Clear;
     dm.q_geral.sql.add(' select count(*) as total ' );
     dm.q_geral.sql.add(' from produtos ');
     dm.q_geral.sql.add(' where cod_marca = ' + QuotedStr(q_dados.FieldByName('cod_marca').AsString) );
     dm.q_geral.Open;
     if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
     begin
          ShowMessage('N?o ? poss?vel excluir essa Marca porque h? PRODUTO(s) relacionado(s) !');
          exit;
     end;

     inherited;
end;

procedure Tf_marcas_herdado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     inherited;
     Action:= caFree;
     f_marcas_herdado:= nil;
end;

function Tf_marcas_herdado.validar;
begin
     if trim(edit_nome.Text) = '' then
     begin
          ShowMessage('O nome deve ser preenchido!');
          edit_nome.SetFocus;
          exit;
     end;

     result:= true;

end;

end.
