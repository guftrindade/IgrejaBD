-- Página para cadastrar usuário
/*
declare @MensagemRetorno varchar(max)
, @retorno int
execute @retorno = IgrejaBD.dbo.AdicionarUsuario_Controlador
	@p_nome = '', 
	@p_dtaNascimento = '20210414', 
	@p_cpf = null,
	@p_MensagemRetorno=@MensagemRetorno output
*/

use IgrejaBD
go

create or alter  procedure dbo.AdicionarUsuario_Controlador
	@p_usuarioId int = null  output,
	@p_nome varchar(200) null, 
	@p_dtaNascimento datetime null, 
	@p_cpf numeric(11,0) null,
	@p_MensagemRetorno varchar(max) = '' output
as
begin 
declare @retorno int = 0
	
	-- Realiza validação de regra de negocio.
	execute @retorno = IgrejaBD.dbo.AdicionarUsuario_RegraNegocio
			@p_nome= @p_nome
		,	@p_dtaNascimento = @p_dtaNascimento
		,	@p_cpf = @p_cpf
		,	@p_MensagemRetorno = @p_MensagemRetorno output


		if(@retorno = 0)begin 
			--Salva dados na tabela 

			execute @retorno = IgrejaBD.dbo.Usuario_Insert
				@p_usuarioId = @p_usuarioId output
			,	@p_nome= @p_nome
			,	@p_dtaNascimento = @p_dtaNascimento
			,	@p_cpf = @p_cpf

		end 
	return @retorno
end 
go