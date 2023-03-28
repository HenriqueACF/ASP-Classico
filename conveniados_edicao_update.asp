<!DOCTYPE html>
    <%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
    <!--#Include file="conexao.inc" -->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Controle de Processes</title>
    </head>
    <body>
        <%
            'recuperando dados do formulario
            codigo = Request.Form("codigo1")

            Response.Write "codigo: " & nome & "<br>"
            nome = Request.Form("nome")

            Response.Write "Nome: " & nome & "<br>"
            cpf = Request.Form("cpf")
            convenio = Request.Form("convenio")
            usuario = Request.Form("usuario")
            senha = Request.Form("senha")
            senha2 = Request.Form("senha2")

             nome = UCASE(REPLACE(TRIM("nome"), "'", ""))
            cpf = REPLACE(TRIM("cpf"), "'", "")
            convenio =REPLACE(TRIM("convenio"), "'", "")
            usuario = LCASE(REPLACE(TRIM("usuario"), "'", ""))
            senha = REPLACE(TRIM("senha"), "'", "")
            senha2 =REPLACE(TRIM("senha2"), "'", "")

              if isNumeric(convenio) = False Then
                ValidaConvenio = "erro"
                OcorreuErro = "sim"
            end if

            'VALIDANDO CAMPO SENHA
            'VERIFICANDO SE A SENHA DIGITADA POSSUI NO MINIMO 6 CARACTERES E NO MAXIMO 10 CARACTERES

            If Len(senha) < 6 OR Len(senha2) < 6 OR Len(senha) > 10 OR Len(senha2) > 10 Then
                ValidaTamanhoSenha = "erro"
                OcorreuErro = "sim"
            End If

            'Verificando se as senhas digitadas sao iguais
            If senha <> senha2 Then
                ValidaSenhasIguais = "erro"
                OcorreuErro = "sim"
            End If

             'LOCALIZANDO USUARIOO NO BANCO PRA EVITAR DUPLICADOS
            StrConveniado = "SELECT Nome_Conveniado, Usuario, CPF_Conveniado FROM Conveniados 
            WHERE Nome_Conveniado
            Usuario = ' " & usuario & " ' OR CPF_Conveniado = ' " & cpf & " ' "
            Set rsSQL = conexao.Execute(StrConveniado)
            Contador = 0
            Do Until rsSQL.EoF
                Contador = Contador + 1
                rsSQL.MoveNext
            Loop

            If Contador > 1 Then
                ValidaUsuariosDiferentes = "erro"
                OcorreuErro = "sim"
            Else
                If(ValidaConvenio <> "erro") and (ValidaTamanhoSenha <> "erro") and (ValidaSenhasIguais <> "erro")
                    Response.Write "Não Ocorreram erros no formmulario" & "<br>"
                    Set Conveniado = Server.CreateObject("ADODB.Recordset")

                    inst_sql = "SELECT * FROM Conveniados WHERE Codigo = " & codigo
                    
                    Conveniado.Open inst_sql, conexao,3,3

                    Conveniado.Fields("Nome_Conveniado") = nome
                    Conveniado.Fields("CPF_Conveniado") = cpf
                    Conveniado.Fields("Convenio") = convenio
                    Conveniado.Fields("Usuario") = usuario
                    Conveniado.Fields("Senha") = senha

                    Conveniado.Update
                End If
            End If
        %>
    </body>
</html>