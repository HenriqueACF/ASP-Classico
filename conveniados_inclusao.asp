<!DOCTYPE html>
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