<%

    Set conexao = Server.CreateObject("ADODB.Connection");
    coexao.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("bd_controle.mdb") & " ; "

%>