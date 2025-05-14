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
import java.util.ArrayList;
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
        List<Vehiculo> vehiculos = vehiculoDAO.obtenerTodos();
        String json = objectMapper.writeValueAsString(vehiculos);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        BufferedReader reader = req.getReader();
        Vehiculo vehiculo = objectMapper.readValue(reader, Vehiculo.class);
        vehiculoDAO.actualizarVehiculo(vehiculo);

        resp.setStatus(HttpServletResponse.SC_CREATED);
    }
}
