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
        req.setAttribute("vehiculos", vehiculos);
        req.getRequestDispatcher("vehiculo-list.jsp").forward(req, resp);
        /*
        prueba con postman ya que su escritura de pruebas viene con las pruebas de tipo JSON
        String JSON = objectMapper.writeValueAsString(vehiculos);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(JSON);
        */

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        BufferedReader reader = req.getReader();
        Vehiculo vehiculo = objectMapper.readValue(reader, Vehiculo.class);
        vehiculoDAO.guardarVehiculo(vehiculo);

        resp.setStatus(HttpServletResponse.SC_CREATED);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        BufferedReader reader = req.getReader();
        Vehiculo vehiculo = objectMapper.readValue(reader, Vehiculo.class);
        vehiculoDAO.actualizarVehiculo(vehiculo);

        resp.setStatus(HttpServletResponse.SC_OK);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

        BufferedReader reader = req.getReader();
        Vehiculo vehiculo = objectMapper.readValue(reader, Vehiculo.class);
        vehiculoDAO.eliminarVehiculo(vehiculo);

        resp.setStatus(HttpServletResponse.SC_NO_CONTENT);
    }
}
