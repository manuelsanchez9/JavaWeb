<%-- 
    Document   : Usuarios
    Created on : 9/05/2019, 2:25:46 p. m.
    Author     : Manuel Sanchez
--%>

<%@page import="clases.Usuario"%>
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
            String mensaje = "";

            boolean consultar = false;
            boolean nuevo = false;
            boolean modificar = false;
            boolean borrar = false;
            boolean limpiar = false;
            boolean listar = false;

            if (request.getParameter("consultar") != null) {
                consultar = true;
            }
            if (request.getParameter("nuevo") != null) {
                nuevo = true;
            }
            if (request.getParameter("modificar") != null) {
                modificar = true;
            }
            if (request.getParameter("borrar") != null) {
                borrar = true;
            }
            if (request.getParameter("limpiar") != null) {
                limpiar = true;
            }
            if (request.getParameter("listar") != null) {
                listar = true;
            }

            String idUsuario = "";
            String nombres = "";
            String apellidos = "";
            String clave = "";
            String confirmacion = "";
            String perfil = "";
            String foto = "";

            if (request.getParameter("idUsuario") != null) {
                idUsuario = request.getParameter("idUsuario");
            }

            if (request.getParameter("nombres") != null) {
                nombres = request.getParameter("nombres");
            }

            if (request.getParameter("apellidos") != null) {
                apellidos = request.getParameter("apellidos");
            }

            if (request.getParameter("clave") != null) {
                clave = request.getParameter("clave");
            }

            if (request.getParameter("confirmacion") != null) {
                confirmacion = request.getParameter("confirmacion");
            }

            if (request.getParameter("perfil") != null) {
                perfil = request.getParameter("perfil");
            }

            if (request.getParameter("foto") != null) {
                foto = request.getParameter("foto");
            }

            // Si presiona el boton Consultar Usuario
            if (consultar) {
                if (idUsuario == "") {
                    mensaje = "Debe Ingresar un ID de usuario";
                } else {
                    Datos misDatos = new Datos();
                    Usuario miUsuario = misDatos.getUsuario(idUsuario);
                    if (miUsuario == null) {
                        mensaje = "Usuario no existe";
                    } else {
                        idUsuario = miUsuario.getIdUsuario();
                        nombres = miUsuario.getNombres();
                        apellidos = miUsuario.getApellidos();
                        clave = miUsuario.getClave();
                        confirmacion = miUsuario.getClave();
                        perfil = "" + miUsuario.getIdPerfil();
                        foto = miUsuario.getFoto();
                        mensaje = "Usuario Consultado de forma correcta";
                    }
                    misDatos.cerrarConexion();
                }
            }

            // Si presiona el boton Limpiar Campos
            if (limpiar) {
                idUsuario = "";
                nombres = "";
                apellidos = "";
                clave = "";
                confirmacion = "";
                perfil = "";
                foto = "";
                mensaje = "Campos Limpios";
            }

            // Si presiona el boton Nuevo Usuario   
            if (nuevo) {
                if (idUsuario == "") {
                    mensaje = "Debe Ingresar un ID de usuario";
                } else if (nombres == "") {
                    mensaje = "Debe Ingresar un nombre(s) para el nuevo usuario";
                } else if (apellidos == "") {
                    mensaje = "Debe Ingresar un apellido(s) para el nuevo usuario";
                } else if (clave == "") {
                    mensaje = "Debe Ingresar una contraseña para el nuevo usuario";
                } else if (confirmacion == "") {
                    mensaje = "Debe confirmar la contraseña para el nuevo usuario";
                } else if (!clave.equals(confirmacion)) {
                    mensaje = "La clave y la confirmación deben ser iguales";
                } else if (perfil.equals("0")) {
                    mensaje = "Debe Seleccionar un perfil para el nuevo usuario";
                } else {
                    Datos misDatos = new Datos();
                    Usuario miUsuario = misDatos.getUsuario(idUsuario);

                    if (miUsuario != null) {
                        mensaje = "El Usuario ya existe";
                    } else {
                        miUsuario = new Usuario(
                                idUsuario,
                                nombres,
                                apellidos,
                                clave,
                                new Integer(perfil),
                                foto);
                        misDatos.newUsuario(miUsuario);
                        mensaje = "El Usuario se creo de forma correcta";
                    }
                    misDatos.cerrarConexion();
                }
            }

            // Si presiona boton Modificar Usuario
            if (modificar) {
                if (idUsuario == "") {
                    mensaje = "Debe Ingresar un ID de usuario";
                } else if (nombres == "") {
                    mensaje = "Debe Ingresar un nombre(s) para el nuevo usuario";
                } else if (apellidos == "") {
                    mensaje = "Debe Ingresar un apellido(s) para el nuevo usuario";
                } else if (clave == "") {
                    mensaje = "Debe Ingresar una contraseña para el nuevo usuario";
                } else if (confirmacion == "") {
                    mensaje = "Debe confirmar la contraseña para el nuevo usuario";
                } else if (!clave.equals(confirmacion)) {
                    mensaje = "La clave y la confirmación deben ser iguales";
                } else if (perfil.equals("0")) {
                    mensaje = "Debe Seleccionar un perfil para el nuevo usuario";
                } else {
                    Datos misDatos = new Datos();
                    Usuario miUsuario = misDatos.getUsuario(idUsuario);

                    if (miUsuario == null) {
                        mensaje = "El ID Usuario no se puede modificar";
                    } else {
                        miUsuario = new Usuario(
                                idUsuario,
                                nombres,
                                apellidos,
                                clave,
                                new Integer(perfil),
                                foto);
                        misDatos.updateUsuario(miUsuario);
                        mensaje = "El Usuario se modifico de forma correcta";
                    }
                    misDatos.cerrarConexion();
                }
            }

            // Si presiona el Eliminar Usuario 
            if (borrar) {
                if (idUsuario == "") {
                    mensaje = "Debe Ingresar un ID de usuario";
                } else {
                    Datos misDatos = new Datos();
                    Usuario miUsuario = misDatos.getUsuario(idUsuario);

                    if (miUsuario == null) {
                        mensaje = "Usuario no existe";
                    } else {
                        misDatos.deleteUsuario(idUsuario);
                        idUsuario = "";
                        nombres = "";
                        apellidos = "";
                        clave = "";
                        confirmacion = "";
                        perfil = "";
                        foto = "";
                        mensaje = "Usuario Eliminado de forma correcta";
                    }
                    misDatos.cerrarConexion();
                }
            }

            // Si presiona Listar Usuarios
            if (listar) {
        %>
        <jsp:forward page="ListadoUsuarios.jsp"></jsp:forward>
        <%
            }
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <font color="white" class="text-center">
            <h1 class="navbar-brand" >Ingresar Nuevos Usuarios</h1>
            </font>
        </nav>
        <br>
        <div class="container">

            <div class="form-group">
                <a class="btn btn-outline-primary" href="MenuAdministrador.jsp" role="button">Regresar al menu</a>
                <a <%=limpiar%> class="btn btn-outline-secondary" href="javascript:history.back(1)" role="button">Regresar a la pagina anterior</a>
            </div>

            <form name="usuarios" id="usuarios" action="Usuarios.jsp" method="POST">  

                <div class="form-group">
                    <label for="idUsuario">ID Usuario:</label>
                    <input class="form-control" type="text" name="idUsuario" value="<%=idUsuario%>" id="idUsuario" size="10" placeholder="ID Usuario:">
                </div>

                <div class="form-group">
                    <label for="nombres">Nombres:</label>
                    <input class="form-control" type="text" name="nombres" id="nombres" value="<%=nombres%>" size="30" placeholder="Nombres:">
                </div>

                <div class="form-group">
                    <label for="apellidos">Apellidos:</label>
                    <input class="form-control" type="text" name="apellidos" id="apellidos" value="<%=apellidos%>" size="30" placeholder="Apellidos:">
                </div>

                <div class="form-group">
                    <label for="clave">Contraseña:</label>
                    <input class="form-control" type="password" name="clave" id="clave" value="<%=clave%>" size="10" placeholder="Contraseña:">
                </div>

                <div class="form-group">
                    <label for="clave">Confirmación de contraseña:</label>
                    <input class="form-control" type="password" name="confirmacion" id="confirmacion" value="<%=confirmacion%>" size="10" placeholder="Confirmación Contraseña:">
                </div>

                <div class="form-group">
                    <label for="idPerfil">Perfil Usuario:</label>
                    <select class="form-control" name="perfil" id="perfil" >
                        <option value="0" <%=(perfil.equals("") ? "selected" : "")%>>Seleccione Perfil ...</option>
                        <option value="1" <%=(perfil.equals("1") ? "selected" : "")%>>Administrador</option>
                        <option value="2" <%=(perfil.equals("2") ? "selected" : "")%>>Empleado</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="foto">Fotografia:</label>
                    <input class="form-control" type="file" name="foto" id="foto" value="<%=foto%>">
                    <br>
                    <%
                        if (foto == null) {
                            foto = "";
                        }
                        if (foto.equals("")) {
                    %>
                    <h2>" sin foto "</h2>
                    <img src="<%="images/usuario.png"%>" width="150" height="150" class="img-rounded"/>
                    <%
                    } else {
                    %>
                    <img src="<%="images/" + foto%>" width="150" height="150" class="img-rounded"/>
                    <%
                        }
                    %>
                </div>
                <jsp:include page="Botones.jsp"></jsp:include>
                    <script>
                        toastr.info('<%=mensaje%>', 'Bienvenid@', {
                            "progressBar": true,
                            "positionClass": "toast-top-center",
                            "tapToDismiss": true,
                            "timeOut": "2500"
                        });
                </script>
            </form>   
        </div> 
    </body>
</html>
