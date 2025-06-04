package vehiculos.modelo;

public class Vehiculo {

    private int id;
    private String placa;
    private String marca;
    private String modelo;
    private int anio;

    public Vehiculo() {

    }

    public Vehiculo(int id, String marca, String modelo, String placa, int anio) {
        this.id = id;
        this.marca = marca;
        this.modelo = modelo;
        this.placa = placa;
        this.anio = anio;
    }

    public Vehiculo(String marca, String modelo, String placa, int anio) {
        this.marca = marca;
        this.modelo = modelo;
        this.placa = placa;
        this.anio = anio;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }
}
