<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <title>Administrador Pedidos</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="assets/css/dashboard.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/css/datatables.min.css">
    <link rel="stylesheet" href="assets/morris.css">
  </head>

  <body>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <a class="navbar-brand" href="#">Administrador</a>
      <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item" id="Inicio">
            <a class="nav-link" href="menu.jsp">Inicio<span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item" id="rVehiculo">
            <a class="nav-link" href="registrar_vehiculo.jsp">Registrar Vehiculo</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="index.jsp">Salir</a>
        </ul>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar">
          <ul class="nav nav-pills flex-column">
            <li class="nav-item">
              <a class="nav-link active" href="#">Listado Vehiculos <span class="sr-only">(current)</span></a>
            </li>
            <!--
            <li class="nav-item">
              <a class="nav-link" href="#">Reportes</a>
            </li>
          </ul>-->
          <!--
          <ul class="nav nav-pills flex-column">
            <li class="nav-item">
              <a class="nav-link" href="#">Nav item</a>
            </li>
          </ul>-->
        </nav>
        <main class="col-sm-9 ml-sm-auto col-md-10 pt-3" role="main">