package vehiculos.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vehiculos.dao.VehiculoDAO;
import vehiculos.modelo.Vehiculo;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

@WebServlet("/vehiculos")
public class VehiculoServlet extends HttpServlet {
    private VehiculoDAO vehiculoDAO;
    private ObjectMapper objectMapper;

    @Override
    public void init() throws ServletException {
        vehiculoDAO = new VehiculoDAO();
        objectMapper = new ObjectMapper();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String idParam = req.getParameter("id");

        if (idParam != null) {
            int id = Integer.parseInt(idParam);
            Vehiculo vehiculo = vehiculoDAO.obtenerPorId(id);

            if (vehiculo != null) {
                req.setAttribute("vehiculo", vehiculo);
                req.getRequestDispatcher("vehiculo-form.jsp").forward(req, resp);
            }else {
                resp.sendRedirect("vehiculos");
            }

        }else {
            List<Vehiculo> vehiculos = vehiculoDAO.obtenerTodos();

            String accepHeader = req.getHeader("Accept");
            if (accepHeader != null && accepHeader.contains("application/json")) {
                String JSON = objectMapper.writeValueAsString(vehiculos);

                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                resp.getWriter().write(JSON);
            }else {
                req.setAttribute("vehiculos", vehiculos);
                req.getRequestDispatcher("vehiculo-list.jsp").forward(req, resp);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String contentType = req.getContentType();
        String method = req.getParameter("_method");

        if (contentType != null && contentType.contains("application/json")) {
            BufferedReader reader = req.getReader();
            Vehiculo vehiculo = objectMapper.readValue(reader, Vehiculo.class);
            vehiculoDAO.guardarVehiculo(vehiculo);
            resp.setStatus(HttpServletResponse.SC_CREATED);
        } else {
            if ("PUT".equalsIgnoreCase(method)) {
                doPut(req, resp); // Redirige internamente al método PUT
            } else if ("DELETE".equalsIgnoreCase(method)) {
                doDelete(req, resp);
            } else {
                // Crear nuevo vehículo (POST normal)
                String marca = req.getParameter("marca");
                String modelo = req.getParameter("modelo");
                String placa = req.getParameter("placa");
                int anio = Integer.parseInt(req.getParameter("anio"));

                Vehiculo vehiculo = new Vehiculo(marca, modelo, placa, anio);
                vehiculoDAO.guardarVehiculo(vehiculo);

                resp.sendRedirect("vehiculos");
            }
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String contentType = req.getContentType();

        if (contentType != null && contentType.contains("application/json")) {
            BufferedReader reader = req.getReader();
            Vehiculo vehiculo = objectMapper.readValue(reader, Vehiculo.class);
            vehiculoDAO.actualizarVehiculo(vehiculo);

            resp.setStatus(HttpServletResponse.SC_OK);
        }else{

            int id = Integer.parseInt(req.getParameter("id"));
            String marca = req.getParameter("marca");
            String modelo = req.getParameter("modelo");
            String placa = req.getParameter("placa");
            int anio = Integer.parseInt(req.getParameter("anio"));

            Vehiculo vehiculo = new Vehiculo(id, marca, modelo, placa, anio);
            vehiculo.setId(id);
            vehiculoDAO.actualizarVehiculo(vehiculo);

            resp.sendRedirect("vehiculos");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

        String contentType = req.getContentType();

        if (contentType != null && contentType.contains("application/json")) {
            BufferedReader reader = req.getReader();
            Vehiculo vehiculo = objectMapper.readValue(reader, Vehiculo.class);
            vehiculoDAO.eliminarVehiculo(vehiculo);

            resp.setStatus(HttpServletResponse.SC_NO_CONTENT);
        }else {
            int id = Integer.parseInt(req.getParameter("id"));
            Vehiculo vehiculo = new Vehiculo();
            vehiculo.setId(id);
            vehiculoDAO.eliminarVehiculo(vehiculo);
            resp.sendRedirect("vehiculos");
        }
    }
}
