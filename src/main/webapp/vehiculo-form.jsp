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
    // Obtenemos el vehículo desde el request, si existe (es edición)
    Vehiculo vehiculo = (Vehiculo) request.getAttribute("vehiculo");

    // Si hay vehículo (es edición), tomamos sus datos; si no, dejamos por defecto
    int id = vehiculo != null ? vehiculo.getId() : 0;
    String marca = vehiculo != null ? vehiculo.getMarca() : "";
    String modelo = vehiculo != null ? vehiculo.getModelo() : "";
    String placa = vehiculo != null ? vehiculo.getPlaca() : "";
    int anio = vehiculo != null ? vehiculo.getAnio() : 0;

    // Determinamos si es edición o nuevo
    boolean esEdicion = vehiculo != null;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= esEdicion ? "Editar" : "Agregar" %> Vehículo</title>

    <style>
        /* Estilo general para el body */
        body {
            background-image: url("https://img.freepik.com/fotos-premium/coche-moderno-negro-sobre-fondo-negro-generativo-ai_39665-640.jpg"); /* fondo de una imagen automovilista */
            background-size: cover;      /* hace que la imagen cubra toda la pantalla */
            background-repeat: no-repeat; /* evita que se repita la imagen */
            background-position: center center; /* centra la imagen tanto horizontal como verticalmente */
            background-attachment: fixed; /* mantiene la imagen fija al hacer scroll */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* fuente moderna */
            padding: 30px; /* espacio alrededor del contenido */
        }

        /* Contenedor del formulario centrado */
        .form-container {
            background-color: #ffffff; /* fondo blanco */
            max-width: 600px; /* ancho máximo del formulario */
            margin: auto; /* centrar horizontalmente */
            padding: 30px; /* espacio interno */
            border-radius: 10px; /* bordes redondeados */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* sombra suave */
        }

        /* Título del formulario */
        h2 {
            text-align: center; /* centrar texto */
            color: #333333; /* color oscuro */
            margin-bottom: 25px; /* espacio debajo del título */
        }

        /* Estilo para cada grupo de campos */
        .form-group {
            margin-bottom: 20px; /* espacio entre campos */
        }

        /* Estilo para las etiquetas */
        label {
            display: block; /* cada etiqueta en su propia línea */
            margin-bottom: 5px; /* espacio entre la etiqueta y el input */
            color: #555555; /* gris medio */
            font-weight: bold; /* texto en negrita */
        }

        /* Estilo para los inputs */
        input[type="text"],
        input[type="number"] {
            width: 100%; /* que ocupe todo el ancho del contenedor */
            padding: 10px; /* espacio interno */
            border: 1px solid #ccc; /* borde gris claro */
            border-radius: 5px; /* bordes redondeados */
            font-size: 16px; /* tamaño de letra */
        }

        /* Botón principal de envío */
        input[type="submit"] {
            width: 100%; /* que ocupe todo el ancho */
            padding: 12px;
            background-color: #28a745; /* verde */
            color: white; /* texto blanco */
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer; /* cambia el cursor a una mano */
            transition: background-color 0.3s ease; /* animación suave al pasar el mouse */
        }

        /* Efecto hover para el botón */
        input[type="submit"]:hover {
            background-color: #218838; /* verde más oscuro al pasar el mouse */
        }

        /* Enlace para volver */
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff; /* azul */
        }

        .back-link:hover {
            text-decoration: underline; /* subrayado al pasar el mouse */
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2><%= esEdicion ? "Editar" : "Agregar" %> Vehículo</h2>

    <!-- Formulario para crear o editar un vehículo -->
    <form action="vehiculos" method="post">

        <%-- Si es edición, incluir campos ocultos con id y método PUT --%>
        <% if (esEdicion) { %>
        <input type="hidden" name="id" value="<%= id %>">
        <input type="hidden" name="_method" value="PUT">
        <% } %>

        <!-- Campo: Marca del vehículo -->
        <div class="form-group">
            <label for="marca">Marca:</label>
            <input type="text" id="marca" name="marca" required value="<%= marca %>">
        </div>

        <!-- Campo: Modelo del vehículo -->
        <div class="form-group">
            <label for="modelo">Modelo:</label>
            <input type="text" id="modelo" name="modelo" required value="<%= modelo %>">
        </div>

        <!-- Campo: Placa del vehículo -->
        <div class="form-group">
            <label for="placa">Placa:</label>
            <input type="text" id="placa" name="placa" required value="<%= placa %>">
        </div>

        <!-- Campo: Año del vehículo -->
        <div class="form-group">
            <label for="anio">Año:</label>
            <input type="number" id="anio" name="anio" required value="<%= anio != 0 ? anio : "" %>">
        </div>

        <!-- Botón para enviar el formulario -->
        <input type="submit" value="<%= esEdicion ? "Actualizar" : "Guardar" %>">
    </form>

    <!-- Enlace para volver a la lista -->
    <a href="vehiculos" class="back-link">← Volver a la lista de vehículos</a>
</div>

</body>
</html>
