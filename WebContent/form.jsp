<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Formulario </a>

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="#">Home</a></li>
				<li class="nav-item"><a class="nav-link"
					href="clienteController?opcion=lis">Lista de clientes</a></li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<h1
			class="text-secondary border border-success border-top-0 border-left-0 border-right-0">FORMULARIO</h1>


		<form action="clienteController" method="post">
			<!-- incluir action -->
			<input name="opcion" value="reg" type="hidden" />
			<div class="form-group row">

				<label class="col-sm-2 col-form-label">Nombre</label>
				<div class="col-sm-6">
					<input type="text" value="${cliente.nombre}" name="txtNombre"
						class="form-control" /> <small
						class="form-text text-danger"></small>
				</div>

				<!--  -->
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Apellido</label>
				<div class="col-sm-6">
					<input type="text" value="${cliente.apellido}" name="txtApellido"
						class="form-control" /> <small
						class="form-text text-danger"></small>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Email</label>
				<div class="col-sm-6">
					<input type="text" value="${cliente.email}" name="txtEmail"
						class="form-control" /> <small
						class="form-text text-danger"></small>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">Fecha</label>
				<div class="col-sm-6">
					<input type="text" value="${cliente.fecha}" name="txtFecha"
						class="form-control" /> <small
						class="form-text text-danger"></small>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-6">
					<input type="submit" class="btn btn-primary" />
				</div>
			</div>

		</form>
	</div>

	<h5>${aviso}</h5>
</body>
</html>