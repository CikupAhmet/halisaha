function dalga() {
    var connection = new ActiveXObject("ADODB.Connection");
    var connectionstring = "Data Source=DESKTOP-I8UU1NR;Initial Catalog=uyeler;Integrated Security=True;"
    connection.Open(connectionstring);
    var rs = new ActiveXObject("ADODB.recordset");

    rs.Open("SELECT * FROM kullanici", connection);
    rs.MoveFirst
    while (!rs.eof) {
        document.write(rs.fields(1));
        rs.movenext;
    }
    s.close;
    connection.close;

}