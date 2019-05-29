<%-- 
    Document   : index
    Created on : 25/04/2019, 11:35:29 a. m.
    Author     : Manuel Sanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <!--JQUERY-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!--FRAMEWORK BOOTSTRAP para el estilo de la pagina-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <!--Los iconos tipo solid de Fontawesome-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
        <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
        <!--Nuestro css-->
        <link rel="stylesheet" type="text/css" href="static/css/index.css">
        <title>Aplicación WEB</title>
        <script>
            $(document).ready(function (){
                $("#ValidarUsuario").submit(function() {
                    $.post("ValidarUsuario", $("#ValidarUsuario").serialize(), function(data) {
                        perfil = jQuery.trim(data);
                        if(perfil === "1")document.location.href = "MenuAdministrador.jsp";
                        else if(perfil === "2")document.location.href = "MenuEmpleado.jsp";
                        else $("#mensaje_ingreso").html("<center><h1>Usuario o clave no válido</h1></center>");
                    });
                    return false;
                });
            });
        </script>
    </head>
    <body>   
        <%
            session.invalidate();
        %>
        <div class="modal-dialog text-center">
            <div class="col-sm-8 main-section">
                <div class="modal-content">
                    <div class="col-12 user-img">
                        <div>
                            <img src="static/images/avatar.jpg" style="max-width: 100%;"/>                            
                            <font color="white" class="text-center">
                            <h4>Ingrese sus Datos</h4>                            
                            </font>
                        </div>
                        <form class="col-12" name="ValidarUsuario" id="ValidarUsuario" action="ValidarUsuario" method="POST">
                            <div class="form-group" id="user-group">
                                <input type="text" name="usuario" id="usuario" value="" class="form-control" placeholder="Usuario" required/>
                            </div>
                            <div class="form-group" id="contrasena-group">                                   
                                <input type="password" name="clave" id="clave" value="" class="form-control" placeholder="Contraseña" required/>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-block" value="Ingresar" name="ingresar" id="ingresar" ><i class="fas fa-sign-in-alt"></i>  Ingresar</button>
                            </div>
                        </form>
                        <div class="col-12 forgot">
                            <font color="white" class="text-center">
                            <a href="#">Recordar contraseña</a>             
                            </font>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="mensaje_ingreso"></div> 
    </body>
</html>
