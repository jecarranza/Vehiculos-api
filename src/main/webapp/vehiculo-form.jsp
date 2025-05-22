<%--
  Created by IntelliJ IDEA.
  User: franc
  Date: 5/22/2025
  Time: 1:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vehiculos.modelo.Vehiculo" %>

<%
    // Obtenemos el vehículo desde el request si viene para edición
    Vehiculo vehiculo = (Vehiculo) request.getAttribute("vehiculo");

    // Definimos variables que se llenarán si se edita
    String id = vehiculo != null ? String.valueOf(vehiculo.getId()) : "";
    String marca = vehiculo != null ? vehiculo.getMarca() : "";
    String modelo = vehiculo != null ? vehiculo.getModelo() : "";
    String placa = vehiculo != null ? vehiculo.getPlaca() : "";
    int anio = vehiculo != null ? vehiculo.getAnio() : 0;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= id.isEmpty() ? "Agregar" : "Editar" %> Vehículo</title>
    <style>
        form {
            max-width: 500px;
            margin: auto;
        }

        label, input {
            display: block;
            width: 100%;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            background-color: green;
            color: white;
            padding: 8px;
            border: none;
            border-radius: 5px;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<h2 style="text-align: center;"><%= id.isEmpty() ? "Agregar" : "Editar" %> Vehículo</h2>

<form action="vehiculos" method="post">
    <!-- Si hay ID, lo incluimos oculto -->
    <input type="hidden" name="id" value="<%= id %>">

    <label for="marca">Marca:</label>
    <input type="text" name="marca" id="marca" required value="<%= marca %>">

    <label for="modelo">Modelo:</label>
    <input type="text" name="modelo" id="modelo" required value="<%= modelo %>">

    <label for="placa">Placa:</label>
    <input type="text" name="placa" id="placa" required value="<%= placa %>">

    <label for="anio">Año:</label>
    <input type="number" name="anio" id="anio" required value="<%= anio == 0 ? "" : anio %>">

    <input type="submit" value="<%= id.isEmpty() ? "Guardar" : "Actualizar" %>">
</form>

<a href="vehiculos">Volver a la lista</a>

</body>
</html>

