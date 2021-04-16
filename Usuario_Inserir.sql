use IgrejaBD
go

create or alter proc dbo.Usuario_Inserir
	@p_usuarioId int = null output,
	@p_nome varchar(200), 
	@p_dtaNascimento datetime, 
	@p_cpf numeric(11,0)
as 
begin 
declare @retorno int = 0

insert into IgrejaBD.dbo.usuario
(nome, dtanascimento, cpf)
values
(@p_nome,@p_dtaNascimento,@p_cpf)

set @p_usuarioId = @@IDENTITY

set @retorno = @@ERROR

return @retorno
end 
go