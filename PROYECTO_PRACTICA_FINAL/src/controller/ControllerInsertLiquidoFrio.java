package controller;

import conection.Conexion;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.Node;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import java.sql.SQLException;

public class ControllerInsertLiquidoFrio {

    private Conexion c = new Conexion();

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
    private TextField lif_metodo;

    @FXML
    private TextField lif_temperatura;

    @FXML
    void aceptar(ActionEvent event) {
        try {
            c.abrirConexion();
        } catch (Exception e) {
            // mostrar mensaje de error al abrir la conexion
        }

            // hay dentor va el String concadenando los datos
            String enviar = "insert liquido_frio values( "+lif_id_material2.getText()+","+lif_id_agua.getText()+","+lif_id_material.getText()+","+lif_id_malta.getText()+","+lif_id_material1.getText()+","+lif_id_lupulo.getText()+","+lif_metodo.getText()+","+lif_temperatura.getText()+");";
            System.out.println(enviar);
        try {
            c.getSt().executeQuery(enviar);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


    }

    @FXML
     void salir(ActionEvent event) {
        closeStage(event);
    }

    private void closeStage(ActionEvent event) {
        Node source = (Node) event.getSource();
        Stage stage = (Stage) source.getScene().getWindow();
        stage.close();
    }
}