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
        codConveniado = Request.QueryString("cod_conveniado1")

        StrConveniado = "SELECT * FROM Conveniados WHERE Codigo = " & codConveniado
        Set rsSQL = conexao.Execute(StrConveniado)
       %>

       <p align="center"> Conveniados [<smal>Edição</smal>]</p>
       <div style="text-align: left; position:absolute; left: 50%; top: 10%, margin-left: -110px; margin-top: -40p">
        <form action="conveniados_edicao_update.asp">
            <p>
                <label for="codigo"> Codigo: </label> <br>
                <input 
                    type="text"
                    name="codigo"
                    id="codigo"
                    value="<% = rsSQL.Fields("Codigo") %>"
                    size="6"
                    disabled="yes">
                <input type="hidden" name="codigo1" id="codigo1" required="required" value="<% = rsSQL.Fields("Codigo")> %>" size="6">
            </p>

             <p align="left">
                <label for="nome"> Nome Completo: </label> <br>
                <input 
                    onkeyup="this.value=this.value.replace(/[çÇáÁàÀéèÉÈíìÍÌóòÓÒúùÚÙñÑ~@&]/g,'')"
                    type="text"
                    name="nome"
                    id="nome"
                    value="<% = rsSQL.Fields("Codigo") %>"
                     size="6" disabled="disabled"
                     placeholder="Nome Completo"
                     style="text-transform: uppercase;"
                     minlength="10"
                     size="40"
                     autofocus
                     >
            </p>

            <p align="left">
                <label for="cpf"> CPF: </label> <br>
                <input 
                    onkeyup="this.value=this.value.replace(/[çÇáÁàÀéèÉÈíìÍÌóòÓÒúùÚÙñÑ~@&]/g,'')"
                    type="text"
                    name="cpf"
                    id="cpf"
                    value="<% = rsSQL.Fields("CPF_Conveniado") %>"
                     size="6" disabled="disabled"
                     placeholder="Nome Completo"
                     minlength="11"
                     maxlength="11"
                     pattern="\d{11}"
                     >
            </p>

            <p>
                <label for="convenio"> Convenio: </label> <br>
                <input 
                    onkeyup="this.value=this.value.replace(/[çÇáÁàÀéèÉÈíìÍÌóòÓÒúùÚÙñÑ~@&]/g,'')"
                    type="text"
                    name="convenio"
                    id="convenio"
                    value="<% = rsSQL.Fields("Convenio") %>"
                    autocomplete="on"
                    required="required"
                     placeholder="numero do convenio"
                     maxlength="10"
                     pattern="\d{10}"
                     >
            </p>

            <p>
                <label for="senha"> Senha</label><br>
                <input type="password" name="senha" id="senha" value="<% = rsSQL.Fields("Senha") %>" maxlength="10" required="required">
            </p>

            <p>
                <label for="senha2">Confirme a Senha</label><br>
                <input type="password" name="senha2" id="senha2" value="<% = rsSQL.Fields("Senha") %>" maxlength="10" required="required">
            </p>

            <input type="submit" name="submit" value="Editar">
            <input type="reset" name="reset" value="Limpar">
        </form>
            <a href="default.asp">Menu</a>
       </div>
    </body>
</html>