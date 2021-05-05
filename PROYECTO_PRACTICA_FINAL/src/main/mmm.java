package main;

import conection.Conexion;

import java.sql.SQLException;

public class mmm {
    public static void main(String[] args) {

        Conexion c = new Conexion();
        try {
            c.abrirConexion();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            c.datosTabla("agua");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
