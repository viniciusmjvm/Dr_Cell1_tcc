unit u_unidades_herdado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u_cadastropadrao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Mask, Vcl.DBCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tf_unidades_herdado = class(Tf_cadastropadrao)
    q_dadosdescricao: TStringField;
    Label2: TLabel;
    edit_descricao: TDBEdit;
    q_dadoscod_unidade: TFDAutoIncField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure b_excluirClick(Sender: TObject);
    procedure edit_descricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure b_incluirClick(Sender: TObject);
    procedure b_alterarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

    private

    protected
            function Validar : boolean; override;
            // function pode_excluir: string; override;
             procedure controle_visual; override;
  end;

var
  f_unidades_herdado: Tf_unidades_herdado;

implementation

{$R *.dfm}

uses u_dm;
function Tf_unidades_herdado.validar;
begin
     if trim(edit_descricao.Text) = '' then
     begin
          ShowMessage('A Descri??o deve ser preenchida!');
          edit_descricao.SetFocus;
          exit;
     end;

     result:= true;

end;

procedure Tf_unidades_herdado.b_alterarClick(Sender: TObject);
begin
  inherited;
  edit_descricao.SetFocus;
end;

procedure Tf_unidades_herdado.b_excluirClick(Sender: TObject);
begin
    begin
     dm.q_geral.sql.Clear;
     dm.q_geral.sql.add(' select count(*) as total ' );
     dm.q_geral.sql.add(' from produtos ');
     dm.q_geral.sql.add(' where cod_unidade = ' + QuotedStr(q_dados.FieldByName('cod_unidade').AsString) );
     dm.q_geral.Open;
     if dm.Q_Geral.FieldByName('total').AsInteger > 0 then
     begin
          ShowMessage('N?o ? poss?vel excluir essa unidade porque h? PRODUTO(s) relacionado(s) !');
          exit;
     end;
    end;
    inherited;
end;

procedure Tf_unidades_herdado.b_incluirClick(Sender: TObject);
begin
  inherited;
  edit_descricao.SetFocus;
end;

procedure Tf_unidades_herdado.controle_visual;
begin
  inherited;

  edit_descricao.Enabled := q_dados.State in [dsEdit, dsInsert];
  //edit_descricao.Enabled := edit_descricao.Enabled;
end;

procedure Tf_unidades_herdado.edit_descricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
     begin
          b_gravar.OnClick(self);
     end;
end;

procedure Tf_unidades_herdado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:= caFree;
  f_unidades_herdado:= nil;
end;



end.
