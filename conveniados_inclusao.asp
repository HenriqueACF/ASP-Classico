<!DOCTYPE html>
    <%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Controle de Processes</title>
    </head>
    <body>

        <%
            'Recuperando dddos do formulario
            nome = Request.Form("nome")
            cpf = Request.Form("cpf")
            convenio = Request.Form("convenio")
            usuario = Request.Form("usuario")
            senha = Request.Form("senha")
            senha2 = Request.Form("senha2")

            'LIMPANDO lixo dos dados
            '1 removendo os espaços em branco
            '2 removendo aspas simples

            nome = LCASE(REPLACE(TRIM("nome"), "'", ""))
            cpf = REPLACE(TRIM("cpf"), "'", "")
            convenio =REPLACE(TRIM("convenio"), "'", "")
            usuario = LCASE(REPLACE(TRIM("usuario"), "'", ""))
            senha = REPLACE(TRIM("senha"), "'", "")
            senha2 =REPLACE(TRIM("senha2"), "'", "")

            'VALIDANDO FORMULARIO
            'VERIFICANDO SE O CAMPON COMVENIO POSSUI APENAS NUMEROS

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

            Set conexao = Server.CreateObject("ADODB.Connection")
            conexao.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Serve.MapPath("bd_controle.mdb") &" ; "

                Set add_action = Server.CreateObject("ADODB.Recordset")

                add_action.Open "Conveniados", conexao, 3,3

                add_action.AddNew

                    add_action("Nome_Conveniado") = nome
                    add_action("CPF_Conveniado") = cpf
                    add_action("Convenio") = convenio
                    add_action("Usuario") = usuario
                    add_action("Senha") = Senha

                add_action.Update

                add_action.Close
                conexao.Close

                Set add_action = Nothing
                set conexao = Nothing


        %>

    </body>
</html>