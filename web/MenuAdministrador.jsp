<%-- 
    Document   : MenuAdministrador
    Created on : 25/04/2019, 3:48:09 p. m.
    Author     : Manuel Sanchez
--%>

<%@page import="clases.Usuario"%>
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
        <title>Sistema de Facturación</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            Usuario miUsuario = (Usuario) sesion.getAttribute("usuario");
            if (miUsuario == null) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%
            }
            if (miUsuario.getIdPerfil() != 1) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%
            }
        %>        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <font color="white" class="text-center">
            <h1 class="navbar-brand" >Menú Administrador</h1>
            </font>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Clientes <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Productos <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Usuarios.jsp">Usuarios <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Nueva Factura <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="ReporteFacturas.jsp">Reporte Facturas <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Salir <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </div>
        </nav>
        <br>
        <div class="modal-dialog text-center">
            <table class="table">
                <thead class="thead-dark">                
                <th><%=miUsuario.getNombres() + " " + miUsuario.getApellidos()%></th>
                </thead>
                <tbody>
                    <tr>                        
                        <td>
                            <%
                                if (miUsuario.getFoto() == null) {
                                    miUsuario.getFoto().equals("");
                                }
                                if (miUsuario.getFoto().equals("")) {
                            %>
                            <h1>" sin foto "</h1>
                            <img src="<%="images/usuario.png"%>" width="200" height="200" class="img-rounded"/>
                            <%
                            } else {
                            %>
                            <img src="<%="images/" + miUsuario.getFoto()%>" width="200" height="200" class="img-rounded"/>
                        </td>
                    </tr>  
                    <%
                        }
                    %>
                </tbody>
            </table>
            <script>
                toastr.info('', 'Bienvenid@', {
                    "progressBar": true,
                    "positionClass": "toast-bottom-center",
                    "timeOut": "2500"
                });
            </script>
        </div>
    </body>
</html>
