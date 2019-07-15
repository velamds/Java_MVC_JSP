<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="assets/css/dashboard.css" rel="stylesheet">
    <link href="assets/css/login.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/css/datatables.min.css">
    <link rel="stylesheet" href="assets/morris.css">

    <title>Log in</title>
  </head>

  <body>

    <div class="container">

      <form class="form-signin" method="post" action="Usuario">
        <h2 class="form-signin-heading">Ingrese sus datos por favor</h2>
        <label for="usuario" class="sr-only">Usuario</label>
        <input type="text" id="usuario" name="usuario" class="form-control" placeholder="Usuario" required autofocus>
        <label for="clave" class="sr-only">Password</label>
        <input type="password" id="clave" name="clave" class="form-control" placeholder="Password" required>
       
        <button class="btn btn-lg btn-primary btn-block" type="submit">Ingresar</button>
        <input type="hidden" name="opcion" value="2">
        <a href="registrar_usuario.jsp" class="btn btn-lg btn-default btn-block">Registrarse</a>
        <% if (request.getAttribute("error")!= null) { %>
            ${error}
        <% }%>
      </form>
        
    </div> <!-- /container -->


  </body>
</html>
