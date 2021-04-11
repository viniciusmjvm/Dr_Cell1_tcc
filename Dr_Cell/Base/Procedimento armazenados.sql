use restaurante_LPV_2019
go


---------------------------------------------------------------------------------------
-- Procedimentos armazenados
---------------------------------------------------------------------------------------
/**/
--- procedimento armazenado para incluir/alterar cliente ------------
create procedure sp_cadastrar_cliente
	-- par�metros
	
	-- quando @cod_cliente = 0, ser� realizada uma inclus�o
	@cod_cliente int, 
	
	@nome varchar(100),
	@cpf char(11),
	@rg varchar(18),
	@data_nascimento datetime,
	@sexo char(1),	
	
	@endereco varchar(100),
	@bairro varchar(100),
	@cod_cidade	int, 
	@cep char(8),	
	@telefone varchar(15),
	@celular varchar(15),
	@email varchar(150)
		
as begin

	-- retirando os espa�os � esquerda e � direita	
	set @nome = ltrim(rtrim(@nome))

	if @cod_cidade = 0
	begin
		set @cod_cidade = null
	end
	
	if @nome = '' 
	begin
		select 'O campo nome deve ser informado !' as msg, 0 as retorno
		return; -- interrompe o script
	end
	
	-- se estiver incluindo
	if @cod_cliente = 0 
	begin
		if exists (select * from clientes where nome = @nome )
		begin
			select 'J� h� um cliente com este nome ' as msg, 0 as retorno
			return;
		end

		if exists (select * from clientes where cpf = @cpf) and @cpf != ''
		begin
			select 'J� h� um cliente com este CPF ' as msg, 0 as retorno
			return;
		end

		insert into clientes (
						nome ,
						cpf ,
						rg ,
						data_nascimento ,
						sexo ,	
	
						endereco ,
						bairro ,
						cod_cidade	, 
						cep ,	
						telefone ,
						celular ,
						email
					)
					values (
						@nome ,
						@cpf ,
						@rg ,
						@data_nascimento ,
						@sexo ,	
	
						@endereco ,
						@bairro ,
						@cod_cidade	, 
						@cep ,	
						@telefone ,
						@celular ,
						@email
					)

	
		select 'cliente Inclu�da com sucesso !' as msg, 
			   1 as retorno, 
			   IDENT_CURRENT( 'clientes' ) as cod_cliente -- obtem o c�digo auto-increment do novo cliente 

	end -- incluindo
	else begin	
		if exists (select * from clientes where nome = @nome and cod_cliente != @cod_cliente)
		begin
			select 'J� h� um cliente com este nome !' as msg, 0 as retorno
			return;
		end

		update clientes set 
				  nome                       = @nome                   ,
				  cpf                        = @cpf                    ,
				  rg                         = @rg                     ,
				  data_nascimento            = @data_nascimento        ,
				  sexo                       = @sexo                   ,
				  endereco                   = @endereco               ,
				  bairro                     = @bairro                 ,
				  cod_cidade                 = @cod_cidade             ,
				  cep                        = @cep                    ,
				  telefone                   = @telefone               ,
				  celular                    = @celular                ,
				  email                      = @email                  
		where cod_cliente = @cod_cliente
		
		select 'Cliente Alterado com sucesso !' as msg, 1 as retorno

	end -- alterando	

end; -- sp_cadastra_cliente
go
/**/


-----------------------------------------------------------

create procedure sp_cadastra_cidade
-- par�metros
	@cod_cidade int,
	@nome varchar(100),
	@uf char(2),
	@cep_padrao char(8)

as begin

	set @nome = ltrim(rtrim(@nome))
	set @uf = ltrim(rtrim(@uf))

	-----------------------------------------------------------
	if @nome = ''
	begin
		select 0 as retorno, 'O nome da cidade deve ser informado !' as msg
		return;
	end

	-----------------------------------------------------------
	if @uf = ''
	begin
		select 0 as retorno, 'A unidade federal da cidade deve ser informada !' as msg
		return;
	end

	-----------------------------------------------------------
	begin transaction 

	if @cod_cidade = 0
	begin

		if exists (select cod_cidade from cidades where nome = @nome and uf = @uf)
		begin
			select 0 as retorno, 'J� existe uma cidade com este Nome e UF !' as msg
		end
		else begin

			insert into cidades (
						nome, 
						uf,
						cep_padrao
						)
			values (
					@nome,
					@uf,
					@cep_padrao
				   )	

			select 1 as retorno, 'Cidade incluida com sucesso !' as msg
		end

	end -- incluindo
	-----------------------------------------------------------
	else begin

		if exists (select cod_cidade from cidades where nome = @nome and uf = @uf and cod_cidade != @cod_cidade)
		begin
			select 0 as retorno, 'J� existe uma cidade com este Nome e UF !' as msg
		end
		else begin
			update cidades set
					nome = @nome, 
					uf = @uf,
					cep_padrao = @cep_padrao
			where cod_cidade = @cod_cidade

			select 1 as retorno, 'Cidade alterada com sucesso !' as msg
		end

	end -- alterando

	commit

end; -- sp_cadastra_cidade
go
-------------------------------------------

create procedure sp_del_cidade
	@cod_cidade int
as begin

	begin transaction

	if exists (select cod_cliente from clientes where cod_cidade = @cod_cidade)
	begin
		select 0 as retorno, 'Esta cidade est� relacionada com clientes, portanto n�o pode ser exclu�da !' as msg
		rollback;
		return;
	end

	if exists (select cod_fornecedor from fornecedores where cod_cidade = @cod_cidade)
	begin
		select 0 as retorno, 'Esta cidade est� relacionada com fornecedores, portanto n�o pode ser exclu�da !' as msg
		rollback;
		return;
	end

	-----------------------------------------------------
	delete from cidades where cod_cidade = @cod_cidade

	select 1 as retorno, 'Cidade exclu�da com sucesso !' as msg

	commit

end;

go

//------------------------------------------------------------------------------------------
/**/
--- procedimento armazenado para incluir/alterar cliente ------------
create procedure sp_cadastrar_vendas
	-- par�metros
	
	-- quando @cod_cliente = 0, ser� realizada uma inclus�o
	@cod_venda int, 
	
	@num_venda int,
	@cod_cliente int,
	@observacao text,
	@data datetime
		
as begin

	-- retirando os espa�os � esquerda e � direita	
	set @num_venda = ltrim(rtrim(@num_venda))

	if @cod_cliente = 0
	begin
		set @cod_cliente = null
	end
	
	if @num_venda = '' 
	begin
		select 'O campo Num Venda deve ser informado !' as msg, 0 as retorno
		return; -- interrompe o script
	end
	
	-- se estiver incluindo
	if @cod_venda = 0 
	begin
		if exists (select * from vendas where @num_venda = @num_venda ) and @num_venda != ''
		begin
			select 'J� h� uma venda com este numero ' as msg, 0 as retorno
			return;
		end

		insert into vendas (
						num_venda,
						cod_cliente,
						observacao,
						data
					)
					values (
						@num_venda,
						@cod_cliente,
						@observacao,
						@data
					)

	
		select 'venda Inclu�da com sucesso !' as msg, 
			   1 as retorno, 
			   IDENT_CURRENT( 'vendas' ) as cod_venda -- obtem o c�digo auto-increment do novo cliente 

	end -- incluindo
	else begin	
		if exists (select * from vendas where num_venda = @num_venda)
		begin
			select 'J� h� uma venda com este numero !' as msg, 0 as retorno
			return;
		end

		update vendas set 
				num_venda           = @num_venda    ,
				cod_cliente         = @cod_cliente  ,
				observacao          = @observacao   ,
				data            	= @data         
		where @cod_venda = @cod_venda
		
		select 'Venda Alterada com sucesso !' as msg, 1 as retorno

	end -- alterando	

end; -- sp_cadastra_venda
go
/**/
