package vehiculos.dao;

import vehiculos.modelo.Vehiculo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VehiculoDAO {

    private final static String URL = "jdbc:mysql://localhost:3306/vehiculos_db";
    private final static String USER = "root";
    private final static String PASS = "Pancho5510";


    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("No se pudo cargar el driver JDBC de MySQL", e);
        }
    }

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

            }

            resultSet.close();
            statement.close();
            connection.close();

        }catch (SQLException e){
            e.printStackTrace();
        }

        return vehiculosList;
    }

    public Vehiculo obtenerPorId(int id) {
        Vehiculo vehiculo = null;
        String sql = "SELECT * FROM vehiculos WHERE id = ?";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASS);
        PreparedStatement statement = connection.prepareStatement(sql)){

            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()){
                vehiculo = new Vehiculo();
                vehiculo.setId(resultSet.getInt("id"));
                vehiculo.setMarca(resultSet.getString("marca"));
                vehiculo.setModelo(resultSet.getString("modelo"));
                vehiculo.setPlaca(resultSet.getString("placa"));
                vehiculo.setAnio(resultSet.getInt("anio"));
            }

            resultSet.close();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return vehiculo;
    }

    public void guardarVehiculo(Vehiculo vehiculo){

        String sqlAdd = "INSERT INTO vehiculos (marca, modelo, placa, anio) VALUES (?, ?, ?, ?)";

        try(Connection connection = DriverManager.getConnection(URL, USER, PASS);
        PreparedStatement preparedStatement = connection.prepareStatement(sqlAdd)) {
            preparedStatement.setString(1, vehiculo.getMarca());
            preparedStatement.setString(2, vehiculo.getModelo());
            preparedStatement.setString(3, vehiculo.getPlaca());
            preparedStatement.setInt(4, vehiculo.getAnio());

            preparedStatement.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void actualizarVehiculo(Vehiculo vehiculo){

        String sqlUpdate = "UPDATE vehiculos SET marca = ?, modelo = ?, placa = ?, anio = ? WHERE id = ?";

        try(Connection connection = DriverManager.getConnection(URL, USER, PASS);
            PreparedStatement preparedStatement = connection.prepareStatement(sqlUpdate)) {

            preparedStatement.setString(1, vehiculo.getMarca());
            preparedStatement.setString(2, vehiculo.getModelo());
            preparedStatement.setString(3, vehiculo.getPlaca());
            preparedStatement.setInt(4, vehiculo.getAnio());
            preparedStatement.setInt(5, vehiculo.getId());

            preparedStatement.executeUpdate();

        }catch (Exception e){
            throw new RuntimeException(e);
        }

    }

    public void eliminarVehiculo(Vehiculo vehiculo){

        String sqlDelete = "DELETE FROM vehiculos WHERE id = ?";

        try(Connection connection = DriverManager.getConnection(URL, USER, PASS);
            PreparedStatement preparedStatement = connection.prepareStatement(sqlDelete)) {

            preparedStatement.setInt(1, vehiculo.getId());
            preparedStatement.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
