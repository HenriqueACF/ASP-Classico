<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Controle de Processes</title>
    </head>
    <body>
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
                        type="text" name="nome" id="nome" placeholder="Nome Completo" size="40"/>
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
                        maxlength="10"/>
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
                        placeholder="Nome do Usuario" />
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
    </body>
</html>