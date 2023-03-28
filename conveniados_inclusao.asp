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

            nome = UCASE(REPLACE(TRIM("nome"), "'", ""))
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

            If not rsSQL.EOF Then
                ValidaUsuariosDiferentes = "erro"
                OcorreuErro = "sim"
            Else
                If(ValidaConvenio <> "erro") and (ValidaTamanhoSenha <> "erro") and (ValidaSenhasIguais <> "erro")
                    Response.Write "Não Ocorreram erros no formmulario" & "<br>"
                    Set add_action = Server.CreateObject("ADODB.Recordset")

                    add_action.Open "Conveniados", conexao, 3,3


                    add_action.AddNew
                        add_action("Nome_Conveniado") = nome
                        add_action("CPF_Conveniado") = cpf
                        add_action("Convenio") = convenio
                        add_action("Usuario") = usuario
                        add_action("Senha") = senha
                    
                    add_action.Update
                    add_action.Close

                    Set add_action = Nothing
                    Set conexao = Nothing
                End If
            End If
        %>

        <%
            If ValidaConvenio = "erro" Then
                Response.Write "<font style='color: red;'> O campo convenio deve conter apenas numeros" & "</font> <br>"
            End If

            If ValidaTamanhoSenha = "erro" Then
                Response.Write "<font style='color: red;'> Sua senha deve ter no minimo 6 e no maximo 10 caracteres" & "</font> <br>"
            End If

            If ValidaSenhasIguais = "erro" Then
                Response.Write "<font style='color: red;'> Senhas nao conferem" & "</font> <br>"
            End If

            If ValidaUsuariosDiferentes = "erro" Then
                Response.Write "<font style='color: red;'> Existe um conveniado com o nome: " & nome & "</font> <br>"
                Response.Write "<font style='color: red;'> Ou existe um usuario: " & usuario & "</font> <br>"
                Response.Write "<font style='color: red;'> Ou existe um CPF: " & cpf & "</font> <br>"
            End If

            If OcorreuErro = "sim" Then
        %>

        <p align="center">Conveniados [<small>Inclusao</small>]</p>

        <div style="text-align:left; position:absolute; left: 50%; top: 10%; margin-left:-110px; margin-top:-40px">
            <form action="conveniados_inclusao.asp" method="post">
                <p align="left">
                    <label for="nome"> Nome Completo</label>
                    <br>
                    <input
                        onkeyup="this.value=this.value.replace(/[çÇáÁàÀéèÉÈíìÍÌóòÓÒúùÚÙñÑ~@&]/g,'')" 
                        required="required"
                        style="text-transform: uppercase;"
                        type="text"
                        name="nome"
                        id="nome"
                        placeholder="Nome Completo"
                        size="40"
                        value="<% =nome %>"
                        />
                </p>

                 <p>
                    <label for="cpf">CPF:</label>
                    <br>
                    <input
                        required="required"
                        pattern="\d{11}"
                        minlength="11"
                        maxlength="11"
                        type="text" 
                        name="cpf" 
                        id="cpf" 
                        placeholder="Apenas Numeros"
                        value="<% =cpf %>"
                       />
                </p>

                 <p>
                    <label for="convenio">Numero do Convenio:</label>
                    <br>
                    <input
                        autocomplete="on"
                        required="required"
                        pattern="[0-9]+$"
                        type="convenio" 
                        name="nome" 
                        id="nome" 
                        placeholder="Nome Completo" 
                        maxlength="10"
                        value="<% =convenio %>"
                        />
                </p>

                 <p>
                    <label for="usuario">Usuario:</label>
                    <br>
                    <input
                        onkeyup="this.value=this.value.replace(/['']/g, '')" 
                        style="text-transform: lowercase"
                        required="required"
                        type="text" 
                        name="usuario" 
                        id="usuario" 
                        placeholder="Nome do Usuario"
                        value="<% =usuario %>"
                         />
                </p>

                 <p>
                    <label for="senha">Senha:</label>
                    <br>
                    <input 
                        type="password" 
                        name="senha" 
                        id="senha" 
                        maxlength="10" />
                </p>

                <p>
                    <label for="senha2">Confirme a Senha:</label>
                    <br>
                    <input 
                        type="password" 
                        name="senha2" 
                        id="senha2" 
                        maxlength="10" />
                </p>

                <input type="submit" name="submit" value="Incluir">
                <input type="reset" name="reset" value="limpar">
            </form>
        </div>

        <% 
            End If
        %>

        <% 
            '  Set conexao = Server.CreateObject("ADODB.Connection")
            ' conexao.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Serve.MapPath("bd_controle.mdb") &" ; "

            '     Set add_action = Server.CreateObject("ADODB.Recordset")

            '     add_action.Open "Conveniados", conexao, 3,3

            '     add_action.AddNew

            '         add_action("Nome_Conveniado") = nome
            '         add_action("CPF_Conveniado") = cpf
            '         add_action("Convenio") = convenio
            '         add_action("Usuario") = usuario
            '         add_action("Senha") = Senha

            '     add_action.Update

            '     add_action.Close
            '     conexao.Close

            '     Set add_action = Nothing
            '     set conexao = Nothing
        %>
    </body>
</html>