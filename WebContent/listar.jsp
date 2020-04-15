<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="beans.Cliente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Listar</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">LISTA CLIENTES</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="clienteController?opcion=lis">Clientes</a>
				</li>
			</ul>
		</div>
	</nav>

	<div class="container" >
		<h1
			class="text-secondary border border-success border-top-0 border-left-0 border-right-0"
			></h1>
		<p><a  href="form.jsp" class="btn btn-success btn-xs">crear cliente</a></p>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>id</th>
					<th>nombre</th>
					<th>apellido</th>
					<th>email</th>
					<th>fecha</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="cli" items="${listadito}">
			
				<tr>
					<td>${cli.id}</td>
					<td>${cli.nombre}</td>
					<td>${cli.apellido}</td>
					<td>${cli.email}</td>
					<td>${cli.fecha}</td>
			</tr>
			</c:forEach>
			</tbody>

		</table>
		
		<h5>${aviso}</h5>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>