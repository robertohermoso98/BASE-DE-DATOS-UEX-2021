package controller;

import conection.Conexion;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.TextField;

import java.net.URL;
import java.util.ResourceBundle;


public class ControllerEliminarLiquidoFrio {
    private Conexion cn;

    public Conexion getConexion(){
        return cn;
    }
    public void setConexion(Conexion c) {
        cn = c;
    }


    public void initialize(URL arg0, ResourceBundle arg1) {
        try {
            System.out.println("jajjaja");
            cn.abrirConexion();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @FXML
    private TextField lif_id_material2;

    @FXML
    private TextField lif_id_agua;

    @FXML
    private TextField lif_id_material;

    @FXML
    private TextField lif_id_malta;

    @FXML
    private TextField lif_id_material1;

    @FXML
    private TextField lif_id_lupulo;

    @FXML
    void aceptar(ActionEvent event) {

    }

    @FXML
    void salir(ActionEvent event) {

    }

}