<%-- 
    Document   : ListadoUsuarios
    Created on : 24/05/2019, 12:01:51 p. m.
    Author     : Manuel Sanchez
--%>

<%@page import="clases.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.Datos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--JQUERY-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!--FRAMEWORK BOOTSTRAP para el estilo de la pagina-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <!--Los iconos tipo solid de Fontawesome-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
        <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <title>Sistemas de Facturación</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            Usuario miUsuarioLogueado = (Usuario) sesion.getAttribute("usuario");
            if (miUsuarioLogueado == null) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%
            }
            if (miUsuarioLogueado.getIdPerfil() != 1) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%
            }
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <font color="white" class="text-center">
            <h1 class="navbar-brand" >Listado Usuarios del Sistema</h1>
            </font>
        </nav>
        <br>
        <div class="container">
            <div class="form-group">
                <a class="btn btn-outline-primary" href="MenuAdministrador.jsp" role="button">Regresar al menu</a>
                <a class="btn btn-outline-secondary" href="javascript:history.back(1)" role="button">Regresar a la pagina anterior</a>
            </div>    
            <table class="table table-striped">
                <thead class="thead-dark">
                <th>ID Usuario</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Perfil</th>
                <th>Foto</th>
                </thead>
                <tbody>
                    <%
                        Datos misDatos = new Datos();
                        ResultSet rs = misDatos.getUsuarios();
                        while (rs.next()) {
                    %>
                    <tr>                        
                        <td><%=rs.getString("idUsuario")%></td>
                        <td><%=rs.getString("nombres")%></td>
                        <td><%=rs.getString("apellidos")%></td>
                        <td><%=(rs.getString("idPerfil").equals("1") ? "Administrador" : "Empleado")%></td>
                        <td>
                            <%
                                if (rs.getString("foto") == null) {
                                    rs.getString("foto").equals("");
                                }
                                if (rs.getString("foto").equals("")) {
                            %>                        
                            <h6>" sin foto "</h6>
                            <img src="<%="images/usuario.png"%>" width="80" height="100" class="img-rounded"/>                         
                            <%
                            } else {
                            %>
                            <img src="<%="images/" + rs.getString("foto")%>" width="80" height="100" class="img-rounded"/>
                        </td>
                    </tr>
                    <%
                            }
                        }
                        misDatos.cerrarConexion();
                    %>
                </tbody>
            </table>
        </div>    
    </body>
</html>
