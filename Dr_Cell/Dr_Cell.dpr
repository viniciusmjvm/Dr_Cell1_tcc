program Dr_Cell;

uses
  Vcl.Forms,
  U_Principal in 'U_Principal.pas' {F_Principal},
  u_dm in 'u_dm.pas' {DM: TDataModule},
  u_cadastropadrao in 'u_cadastropadrao.pas' {f_cadastropadrao},
  u_cidades_herdado in 'u_cidades_herdado.pas' {f_cidades_herdado},
  u_unidades_herdado in 'u_unidades_herdado.pas' {f_unidades_herdado},
  u_marcas_herdado in 'u_marcas_herdado.pas' {f_marcas_herdado},
  u_categorias_herdado in 'u_categorias_herdado.pas' {f_categorias_herdado},
  u_clientes_herdado in 'u_clientes_herdado.pas' {f_clientes_herdado},
  funcoes in 'funcoes.pas',
  u_fornecedores_herdado in 'u_fornecedores_herdado.pas' {f_fornecedores_herdado},
  u_produtos_herdado in 'u_produtos_herdado.pas' {f_produtos_herdado},
  u_contas_herdados in 'u_contas_herdados.pas' {f_contas_herdados},
  u_vendas_herdado in 'u_vendas_herdado.pas' {f_vendas_herdado},
  u_itens_venda in 'u_itens_venda.pas' {f_itens_vendas},
  u_pesquisa in 'u_pesquisa.pas' {f_pesquisa},
  u_itens_contas in 'u_itens_contas.pas' {f_itens_contas},
  u_reparo in 'u_reparo.pas' {f_reparos_herdado},
  u_itens_reparo in 'u_itens_reparo.pas' {f_itens_reparo},
  u_pecas_herdados in 'u_pecas_herdados.pas' {f_pecas_herdados},
  u_pagamentos in 'u_pagamentos.pas' {f_pagamentos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TF_Principal, F_Principal);
  Application.Run;
end.
