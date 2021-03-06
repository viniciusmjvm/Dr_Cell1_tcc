unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.CheckLst;

type
  TF_Principal = class(TForm)
    MainMenu1: TMainMenu;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    CadastrosHerdados1: TMenuItem;
    Cidades2: TMenuItem;
    Unidades1: TMenuItem;
    Cadastro1: TMenuItem;
    Marcas1: TMenuItem;
    Categorias1: TMenuItem;
    Clientes1: TMenuItem;
    Fornecedores1: TMenuItem;
    Sair1: TMenuItem;
    Movimentos1: TMenuItem;
    Produtos1: TMenuItem;
    Vendas1: TMenuItem;
    Contas1: TMenuItem;
    Relatorios1: TMenuItem;
    Vendas2: TMenuItem;
    Image1: TImage;
    Cidade1: TMenuItem;
    Manuteno1: TMenuItem;
    REPAROS1: TMenuItem;
    PEAS1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Unidades1Click(Sender: TObject);
    procedure Marcas1Click(Sender: TObject);
    procedure Categorias1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Contas1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Vendas2Click(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure Cidades2Click(Sender: TObject);
    procedure REPAROS1Click(Sender: TObject);
    procedure PEAS1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Principal: TF_Principal;

implementation

{$R *.dfm}

uses u_cidades_herdado, u_unidades_herdado, u_marcas_herdado,
  u_categorias_herdado, u_clientes_herdado, u_fornecedores_herdado,
  u_produtos_herdado, u_contas_herdados, u_vendas_herdado, ur_cidades,
  ur_vendas, u_reparo, u_pecas_herdados, u_devolucao;

// OnCreate do Formulário F_principal

procedure TF_Principal.Categorias1Click(Sender: TObject);
begin
     if not Assigned(f_categorias_herdado) then
     begin
            f_categorias_herdado:=Tf_categorias_herdado.Create(application);
            f_categorias_herdado.tabela:='categorias';
            f_categorias_herdado.campo_chave:='cod_categoria';
            f_categorias_herdado.campo_pesquisa:='descricao';
            f_categorias_herdado.carregar_dados('');
     end
     else begin
           f_categorias_herdado.Show;
     end;
end;

procedure TF_Principal.Cidades2Click(Sender: TObject);
begin
     r_cidades:=Tr_cidades.Create(application);
     r_cidades.QRP.Preview;
     r_cidades.Free;
end;

procedure TF_Principal.Cidades1Click(Sender: TObject);
begin
     if not Assigned(f_cidades_herdado) then
     begin
            f_cidades_herdado:=Tf_cidades_herdado.Create(application);
            f_cidades_herdado.tabela:='cidades';
            f_cidades_herdado.campo_chave:='cod_cidade';
            f_cidades_herdado.campo_pesquisa:='nome';
            f_cidades_herdado.carregar_dados('');
     end
     else begin
           f_cidades_herdado.Show;
     end;
end;

procedure TF_Principal.Clientes1Click(Sender: TObject);
begin
     if not Assigned(f_clientes_herdado) then
     begin
            f_clientes_herdado:=Tf_clientes_herdado.Create(application);
            f_clientes_herdado.tabela:='clientes';
            f_clientes_herdado.campo_chave:='cod_cliente';
            f_clientes_herdado.campo_pesquisa:='nome';
            f_clientes_herdado.carregar_dados('');
     end
     else begin
           f_clientes_herdado.Show;
     end;
end;

procedure TF_Principal.Contas1Click(Sender: TObject);
begin
     if not Assigned(f_contas_herdados) then
     begin
          f_contas_herdados:=Tf_contas_herdados.Create(application);
          f_contas_herdados.tabela:='contas';
          f_contas_herdados.campo_chave:='cod_contas';
          f_contas_herdados.campo_pesquisa:='vencimento';
          f_contas_herdados.carregar_dados('');
     end
     else begin
          f_contas_herdados.Show;
     end;
end;

procedure TF_Principal.FormCreate(Sender: TObject);
begin
     StatusBar1.Panels[0].Text:= DateTimeToStr(now);
     StatusBar1.Panels[1].Text:= 'Usuário: Vinícius';
end;

procedure TF_Principal.Fornecedores1Click(Sender: TObject);
begin
     if not Assigned(f_fornecedores_herdado) then
     begin
          f_fornecedores_herdado:=Tf_fornecedores_herdado.Create(application);
          f_fornecedores_herdado.tabela:='fornecedores';
          f_fornecedores_herdado.campo_chave:='cod_fornecedor';
          f_fornecedores_herdado.campo_pesquisa:='nome';
          f_fornecedores_herdado.carregar_dados('');
     end
     else begin
          f_fornecedores_herdado.Show;
     end;
end;

procedure TF_Principal.Marcas1Click(Sender: TObject);
begin
     if not Assigned(f_marcas_herdado) then
     begin
          f_marcas_herdado:=Tf_marcas_herdado.Create(application);
          f_marcas_herdado.tabela:='marcas';
          f_marcas_herdado.campo_chave:='cod_marca';
          f_marcas_herdado.campo_pesquisa:='nome';
          f_marcas_herdado.carregar_dados('');
     end
     else begin
          f_marcas_herdado.Show;
     end;
end;

procedure TF_Principal.PEAS1Click(Sender: TObject);
begin
     if not Assigned(f_pecas_herdados) then
     begin
            f_pecas_herdados:=Tf_pecas_herdados.Create(application);
            f_pecas_herdados.tabela:='pecas';
            f_pecas_herdados.campo_chave:='cod_peca';
            f_pecas_herdados.campo_pesquisa:='descricao';
            f_pecas_herdados.carregar_dados('');
     end
     else begin
           f_pecas_herdados.Show;
     end;
end;

procedure TF_Principal.Produtos1Click(Sender: TObject);
begin
     if not Assigned(f_produtos_herdado) then
     begin
          f_produtos_herdado:=Tf_produtos_herdado.Create(application);
          f_produtos_herdado.tabela:='produtos';
          f_produtos_herdado.campo_chave:='cod_produto';
          f_produtos_herdado.campo_pesquisa:='descricao';
          f_produtos_herdado.carregar_dados('');
     end
     else begin
          f_produtos_herdado.Show;
     end;
end;

procedure TF_Principal.REPAROS1Click(Sender: TObject);
begin
     if not Assigned(f_reparos_herdado) then
     begin
            f_reparos_herdado:=Tf_reparos_herdado.Create(application);
            f_reparos_herdado.tabela:='reparos';
            f_reparos_herdado.campo_chave:='cod_reparo';
            f_reparos_herdado.campo_pesquisa:='data_recebido';
            f_reparos_herdado.carregar_dados('');
     end
     else begin
           f_reparos_herdado.Show;
     end;
end;

procedure TF_Principal.Sair1Click(Sender: TObject);
begin
     close;
end;

// OnTimer do componente Timer
procedure TF_Principal.Timer1Timer(Sender: TObject);
begin
     StatusBar1.Panels[0].Text:= DateTimeToStr(now);
end;

procedure TF_Principal.Unidades1Click(Sender: TObject);
begin
     if not Assigned(f_unidades_herdado) then
     begin
          f_unidades_herdado:=Tf_unidades_herdado.Create(application);
          f_unidades_herdado.tabela:='unidades';
          f_unidades_herdado.campo_chave:='cod_unidade';
          f_unidades_herdado.campo_pesquisa:='descricao';
          f_unidades_herdado.carregar_dados('');
     end
     else begin
          f_unidades_herdado.Show;
     end;
end;

procedure TF_Principal.Vendas1Click(Sender: TObject);
begin
     if not Assigned(f_vendas_herdado) then
     begin
          f_vendas_herdado:=Tf_vendas_herdado.Create(application);
          f_vendas_herdado.tabela:='vendas';
          f_vendas_herdado.campo_chave:='cod_venda';
          f_vendas_herdado.campo_pesquisa:='num_venda';
          f_vendas_herdado.carregar_dados('');
     end
     else begin
          f_vendas_herdado.Show;
     end;
end;

procedure TF_Principal.Vendas2Click(Sender: TObject);
begin
     r_vendas:=Tr_vendas.Create(application);
     r_vendas.QRP.Preview;
     r_vendas.Free;
end;

end.
