package vehiculos.dao;

import vehiculos.modelo.Vehiculo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VehiculoDAO {

    private final static String URL = "jdbc:mysql://localhost:3308/vehiculos_db";
    private final static String USER = "root";
    private final static String PASS = "root";

    public List<Vehiculo> obtenerTodos() {
        List<Vehiculo> vehiculosList = new ArrayList<>();

        try {
            Connection connection = DriverManager.getConnection(URL, USER, PASS);

            String sql = "SELECT * FROM vehiculos";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
                Vehiculo vehiculo = new Vehiculo();

                vehiculo.setId(resultSet.getInt("id"));
                vehiculo.setMarca(resultSet.getString("marca"));
                vehiculo.setModelo(resultSet.getString("modelo"));
                vehiculo.setPlaca(resultSet.getString("placa"));
                vehiculo.setAnio(resultSet.getInt("anio"));

                vehiculosList.add(vehiculo);

                resultSet.close();
                statement.close();
                connection.close();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return vehiculosList;
    }

    public List<Vehiculo> insertarVehiculo(Vehiculo vehiculo) {
        List<Vehiculo> vehiculosList = new ArrayList<>();
        vehiculosList.add(vehiculo);
        return vehiculosList;
    }

    public List<Vehiculo> actualizarVehiculo(Vehiculo vehiculo) {
        List<Vehiculo> vehiculosList = new ArrayList<>();
        vehiculosList.remove(vehiculo);
        vehiculosList.add(vehiculo);
        return vehiculosList;
    }
}
