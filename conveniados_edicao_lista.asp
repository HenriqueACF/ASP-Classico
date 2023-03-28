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
            'Localizando usuario no banco para inibir duplicados
            StrConveniado = "SELECT * FROM Conveniados"
            Set rsListaConveniados = conexao.Execute(StrConveniado)
        %>
        <div>
        <table 
            align="center" 
            border="1" 
            cellspacing="0" 
            width="80%" 
            bgcolor="#D9FFEC" 
            style="border-collapse: collapse; text-align: center;" 
            id="table1"
        >
            <tr bgcolor="#8db4b4">
                <td>Codigo</td>
                <td>Nome Conveniado</td>
                <td>CPF</td>
                <td>Convenio</td>
                <td>Usuario</td>
            </tr>

            <%
                'Loop para carregar os dados da instrução select
                Do Until rsListaConveniados.EOF
            %>

            <tr>
                <td> 
                    <a href="conveniados_edicao_index.asp?cod_conveniado1=<% = rsListaConveniados.Fields("Codigo") %>" 
                    <% = rsListaConveniados.Fields("Codigo") %> 
                    </a> 
                </td>
                
                <td>
                    <% = rsListaConveniados.Fields("Nome_Conveniado") %> 
                </td>

                <td>
                    <% = rsListaConveniados.Fields("CPF_Conveniado") %> 
                </td>

                <td>
                    <% = rsListaConveniados.Fields("Convenio") %> 
                </td>

                <td>
                    <% = rsListaConveniados.Fields("Usuario") %> 
                </td>
            </tr>

            <%
                rsListaConveniados.MoveNext
                Loop

                conexao.Close
                Set add_action = Nothing
                Set conexao = Nothing
            %>
        </table>
        </div>

        <a href="default.asp">Menu</a>
    </body>
</html>