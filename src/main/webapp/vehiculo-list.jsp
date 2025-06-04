<%--
  Created by IntelliJ IDEA.
  User: franc
  Date: 5/22/2025
  Time: 12:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%-- Configura la codificación UTF-8 y el lenguaje JSP --%>
<%@ page import="java.util.List" %> <%-- Importa la clase List para usar listas --%>
<%@ page import="vehiculos.modelo.Vehiculo" %> <%-- Importa la clase Vehiculo del paquete correspondiente --%>

<%
    List<Vehiculo> vehiculos = (List<Vehiculo>) request.getAttribute("vehiculos"); // Obtiene la lista de vehículos desde el request
%>

<!DOCTYPE html> <!-- Define el tipo de documento HTML -->
<html> <!-- Inicio del documento HTML -->
<head> <!-- Sección de configuración del encabezado -->
    <meta charset="UTF-8"> <!-- Establece el conjunto de caracteres a UTF-8 -->
    <title>Lista de Vehículos</title> <!-- Título de la pestaña del navegador -->

    <style> /* Inicio del bloque de estilos CSS */

    body {
        margin: 0; /* Elimina el margen por defecto del navegador */
        padding: 0; /* Elimina el relleno por defecto del navegador */
        font-family: Arial, sans-serif; /* Define la fuente del texto */
        background-image: url("https://img.freepik.com/fotos-premium/coche-moderno-negro-sobre-fondo-negro-generativo-ai_39665-640.jpg"); /* Imagen de fondo */
        background-size: cover; /* Escala la imagen para cubrir toda la pantalla */
        background-repeat: no-repeat; /* Evita que se repita la imagen */
        background-position: center center; /* Centra la imagen tanto vertical como horizontalmente */
        background-attachment: fixed; /* Fija la imagen de fondo al hacer scroll */
        color: white; /* Color del texto para contraste con fondo oscuro */
    }

    .container {
        max-width: 1000px; /* Ancho máximo del contenedor */
        margin: 50px auto; /* Centra el contenedor horizontalmente y da espacio arriba y abajo */
        background-color: rgba(0, 0, 0, 0.7); /* Fondo negro con opacidad para efecto translúcido */
        padding: 30px; /* Espaciado interno del contenedor */
        border-radius: 15px; /* Bordes redondeados */
        box-shadow: 0 0 10px rgba(255, 255, 255, 0.3); /* Sombra externa suave en color blanco translúcido */
    }

    h2 {
        text-align: center; /* Centra el título */
        margin-bottom: 20px; /* Espacio inferior */
        color: #00ffcc; /* Color llamativo verde neón */
    }

    table {
        width: 100%; /* La tabla ocupa todo el ancho disponible */
        border-collapse: collapse; /* Une los bordes de las celdas */
        background-color: #fff; /* Fondo blanco para contraste con el fondo oscuro */
        color: #333; /* Color del texto dentro de la tabla */
        border-radius: 10px; /* Bordes redondeados en la tabla */
        overflow: hidden; /* Oculta bordes desbordados */
    }

    th, td {
        padding: 12px; /* Espaciado interno de celdas */
        text-align: center; /* Alinea el contenido al centro */
        border-bottom: 1px solid #ccc; /* Línea gris debajo de cada fila */
    }

    th {
        background-color: #444; /* Fondo gris oscuro para la cabecera */
        color: white; /* Texto blanco en la cabecera */
    }

    tr:hover {
        background-color: #f1f1f1; /* Cambia el color de fondo al pasar el mouse por la fila */
    }

    .btn {
        padding: 8px 15px; /* Espaciado interno para botones */
        border: none; /* Sin borde */
        border-radius: 5px; /* Bordes redondeados */
        color: white; /* Color del texto del botón */
        cursor: pointer; /* Cambia el cursor a una mano */
        margin: 2px; /* Espacio entre botones */
        text-decoration: none; /* Elimina subrayado en botones que son enlaces */
        display: inline-block; /* Permite que se comporten como botones inline */
    }

    .btn-editar {
        background-color: #2196F3; /* Color azul para botón de editar */
    }

    .btn-eliminar {
        background-color: #f44336; /* Color rojo para botón de eliminar */
    }

    .btn-agregar {
        background-color: #4CAF50; /* Color verde para botón de agregar */
        display: block; /* Botón ocupa toda la línea */
        width: fit-content; /* Se ajusta al contenido */
        margin: 20px auto 0; /* Centra el botón horizontalmente y da espacio arriba */
    }

    a {
        text-decoration: none; /* Elimina subrayado en enlaces */
    }

    </style> <!-- Fin del bloque de estilos -->
</head> <!-- Fin del encabezado -->

<body> <!-- Inicio del cuerpo de la página -->

<div class="container"> <!-- Contenedor central con fondo oscuro semitransparente -->
    <h2>Lista de Vehículos</h2> <!-- Título principal de la sección -->
    <br>
    <a href="vehiculo-form.jsp" class="btn btn-agregar">Agregar Vehículo</a><%-- Botón para ir al formulario y agregar un nuevo vehículo --%>
    <br>
    <table> <!-- Inicio de la tabla de vehículos -->
        <thead> <!-- Cabecera de la tabla -->
        <tr> <!-- Fila de la cabecera -->
            <th>ID</th> <!-- Encabezado de columna para ID -->
            <th>Marca</th> <!-- Encabezado de columna para Marca -->
            <th>Modelo</th> <!-- Encabezado de columna para Modelo -->
            <th>Placa</th> <!-- Encabezado de columna para Placa -->
            <th>Año</th> <!-- Encabezado de columna para Año -->
            <th>Acciones</th> <!-- Encabezado de columna para botones -->
        </tr> <!-- Fin de la fila de encabezados -->
        </thead> <!-- Fin del encabezado de tabla -->

        <tbody> <!-- Cuerpo de la tabla -->
        <% for (Vehiculo v : vehiculos) { %> <!-- Bucle para mostrar cada vehículo -->
        <tr> <!-- Fila por cada vehículo -->
            <td><%= v.getId() %></td> <!-- Muestra el ID del vehículo -->
            <td><%= v.getMarca() %></td> <!-- Muestra la marca del vehículo -->
            <td><%= v.getModelo() %></td> <!-- Muestra el modelo del vehículo -->
            <td><%= v.getPlaca() %></td> <!-- Muestra la placa del vehículo -->
            <td><%= v.getAnio() %></td> <!-- Muestra el año del vehículo -->
            <td> <!-- Celda de acciones -->

                <a href="vehiculos?id=<%= v.getId() %>" class="btn btn-editar">Editar</a> <%-- Botón para editar el vehículo --%>

                <form action="vehiculos" method="post" style="display:inline;" onsubmit="return confirm('¿Estás seguro de eliminar este vehículo?');">
                    <%-- Formulario para eliminar el vehículo con confirmación --%>
                    <input type="hidden" name="id" value="<%= v.getId() %>"> <%-- Campo oculto con el ID del vehículo --%>
                    <input type="hidden" name="_method" value="DELETE"> <%-- Emula método DELETE usando POST --%>
                    <button type="submit" class="btn btn-eliminar">Eliminar</button> <%-- Botón para enviar el formulario y eliminar --%>
                </form>

            </td> <!-- Fin de celda de acciones -->
        </tr> <!-- Fin de fila del vehículo -->
        <% } %> <!-- Fin del bucle for -->
        </tbody> <!-- Fin del cuerpo de la tabla -->
    </table> <!-- Fin de la tabla -->

</div> <!-- Fin del contenedor principal -->

</body> <!-- Fin del cuerpo de la página -->
</html> <!-- Fin del documento HTML -->

