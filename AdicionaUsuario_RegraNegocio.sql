use IgrejaBD
go

create or alter proc AdicionarUsuario_RegraNegocio
	@p_nome varchar(200) null , 
	@p_dtaNascimento datetime null, 
	@p_cpf numeric(11,0) null,
	@p_MensagemRetorno varchar(max) = '' output
as 
begin 

declare @retorno int = 0
,	@MsgError varchar(max) = ''
-- Verifica quantidade de caracteres
-- Nome tem que ter mais de 0 caracteres
if(len(isnull(@p_nome,''))=0)begin 
	set @MsgError = @MsgError + ' - Nome é de preenchimento obrigatório.'
	set @retorno= @retorno + 1
end 


-- @p_dtaNascimento
if(@p_dtaNascimento is null
	or convert(varchar(10), @p_dtaNascimento,112) >= convert(varchar(10), getdate(),112))begin 
	set @MsgError = @MsgError + '- Data de nascimento é de preenchimento obrigatório e deverá ser menor que data atual.'
	set @retorno= @retorno + 1

end 

-- @p_cpf
set @p_MensagemRetorno =  @MsgError

-- igual à zero = ok
return @retorno


end 
go