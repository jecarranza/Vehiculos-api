<%--
  Created by IntelliJ IDEA.
  User: franc
  Date: 5/22/2025
  Time: 12:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="vehiculos.modelo.Vehiculo" %>

<%
    // Recuperamos la lista de vehículos enviada desde el Servlet (setAttribute)
    List<Vehiculo> vehiculos = (List<Vehiculo>) request.getAttribute("vehiculos");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Vehículos</title>
    <style>
        /* Estilo básico para tabla */
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            padding: 8px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        a {
            text-decoration: none;
            color: blue;
        }

        .button {
            padding: 6px 10px;
            background-color: green;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
        }

        .delete {
            background-color: red;
        }

        .edit {
            background-color: orange;
        }
    </style>
</head>
<body>

<h2>Lista de Vehículos</h2>

<!-- Botón para agregar un nuevo vehículo -->
<a class="button" href="vehiculo-form.jsp">Agregar Vehículo</a>
<br><br>

<!-- Tabla con los datos -->
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Marca</th>
        <th>Modelo</th>
        <th>Placa</th>
        <th>Año</th>
        <th>Acciones</th>
    </tr>
    </thead>
    <tbody>
    <%
        // Mostramos cada vehículo en una fila de la tabla
        for (Vehiculo v : vehiculos) {
    %>
    <tr>
        <td><%= v.getId() %></td>
        <td><%= v.getMarca() %></td>
        <td><%= v.getModelo() %></td>
        <td><%= v.getPlaca() %></td>
        <td><%= v.getAnio() %></td>
        <td>
            <!-- Enlace para editar -->
            <a class="button edit" href="vehiculo-form.jsp?id=<%= v.getId() %>">Editar</a>

            <!-- Formulario para eliminar (enviar por POST con hidden _method DELETE) -->
            <form action="vehiculos" method="post" style="display:inline;">
                <input type="hidden" name="id" value="<%= v.getId() %>">
                <input type="hidden" name="_method" value="DELETE">
                <input class="button delete" type="submit" value="Eliminar">
            </form>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>

