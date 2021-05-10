package controller;

import conection.Conexion;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;
import javafx.util.Callback;
import main.Main;

import java.net.URL;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.LinkedList;

public class Controller {

    private Conexion c = new Conexion();
    private String tablaSelecionada;
    private Pane view;
    private int SecuenciaSQL;

    @FXML
    private BorderPane IDBoreder;

    @FXML
    private TableView<LinkedList[]> table;

    @FXML // sirve para identificar que pestaña se ha abierto
    private Label idScena;

    private Pane getPage(String vi) {
        Pane vie = new BorderPane();
        try {
            URL fileUrl = Main.class.getResource("../fxml/" + vi + ".fxml");
            vie = new FXMLLoader().load(fileUrl);

        } catch (Exception e) {
            e.getStackTrace();
        }
        return vie;
    }

    private int identificarSecuencia(String s) {
        if (s.equals("Eliminar Cervezas")) {
            return 0;
        }
        if (s.equals("Eliminar Liquido frio")) {
            return 1;
        }
        if (s.equals("Eliminar Mosto_sin_f")) {
            return 2;
        }
        if (s.equals("Insertar Cervezas")) {
            return 3;
        }
        if (s.equals("Insert Liquido frio")) {
            return 4;
        }
        if (s.equals("Insertar Mosto_sin_f")) {
            return 5;
        }
        if (s.equals("")) {
            return 6;
        }
        if (s.equals("Mod. Liquido frio")) {
            return 7;
        }
        if (s.equals("Modificar Mosto_sin_f")) {
            return 8;
        } else {
            return 999;
        }
    }

    private void laGranSolucion(String nombreDeLaCosaABuscar) {
        // si la talb atiene dato sse los elimino
        int cont2 = table.getColumns().size();
        if (table.getColumns().size() > 0) {
            table.getColumns().remove(0, cont2);

        }
        LinkedList<String> listaNombresColumnas;
        LinkedList<String>[] datos;
        LinkedList<Objetos> dat = new LinkedList<Objetos>();
        // abro la conexion
        Conexion cn = new Conexion();
        try {
            cn.abrirConexion();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            // cojo la lista de nombres y los datos de la tabla
            listaNombresColumnas = cn.obtenerNombreDeColumnas(nombreDeLaCosaABuscar);
            datos = cn.datosTabla(nombreDeLaCosaABuscar);
            // creo la lista con los objetos
            if (datos[0].size() > 0) {
                for (int i = 0; i < datos[0].size(); i++) {
                    dat.add(new Objetos());
                }
                for (int e = 0; e < datos.length; e++) {
                    int contador = 0;
                    Iterator it = datos[e].iterator();
                    while (it.hasNext()) {
                        String nombre = (String) it.next();
                        dat.get(contador).getDatos().add(nombre);
                        contador++;

                    }
                }
                ObservableList data = FXCollections.observableList(dat);
                table.setItems(data);
                //la tableview es table
                for (int i = 0; i < listaNombresColumnas.size(); i++) {
                    final int cont = i;
                    TableColumn veces = new TableColumn();
                    veces.setText(listaNombresColumnas.get(i));
                    veces.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<Objetos, String>, ObservableValue<String>>() {
                        @Override
                        public ObservableValue<String> call(TableColumn.CellDataFeatures<Objetos, String> p) {
                            return new SimpleStringProperty(String.valueOf(p.getValue().getDatos().get(cont)));
                        }
                    });
                    table.getColumns().add(veces);
                }
                //table.getColumns().setAll(veces);
                table.setColumnResizePolicy(TableView.CONSTRAINED_RESIZE_POLICY);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }


    @FXML
    void mostrarAgua(ActionEvent event) {

        tablaSelecionada = "agua";
        laGranSolucion(tablaSelecionada);
    }

    @FXML
    void mostrarAguaMin(ActionEvent event) {
        tablaSelecionada = "agua_min";
        laGranSolucion(tablaSelecionada);
    }

    @FXML
    void mostrarCerveza(ActionEvent event) {
        tablaSelecionada = "cerveza";
        laGranSolucion(tablaSelecionada);
    }

    @FXML
    void mostrarCervezaEnCab(ActionEvent event) {
        tablaSelecionada = "cerveza_emb_cab";
        laGranSolucion(tablaSelecionada);

    }

    @FXML
    void mostrarCervezaEnLin(ActionEvent event) {
        tablaSelecionada = "cerveza_emb_lin";
        laGranSolucion(tablaSelecionada);

    }

    @FXML
    void mostrarLevadura(ActionEvent event) {
        tablaSelecionada = "levadura";
        laGranSolucion(tablaSelecionada);
    }

    @FXML
    void mostrarLiquidoDulce(ActionEvent event) {
        tablaSelecionada = "liquido_dulce";
        laGranSolucion(tablaSelecionada);
    }

    @FXML
    void mostrarLiquidoFrio(ActionEvent event) {
        tablaSelecionada = "liquido_frio";
        laGranSolucion(tablaSelecionada);
    }

    @FXML
    void mostrarLupulo(ActionEvent event) {
        tablaSelecionada = "lupulo";
        laGranSolucion(tablaSelecionada);
    }

    @FXML
    void mostrarMalta(ActionEvent event) {
        tablaSelecionada = "malta";
        laGranSolucion(tablaSelecionada);
    }

    @FXML
    void mostrarMaltaMolida(ActionEvent event) {
        tablaSelecionada = "malta_molida";
        laGranSolucion(tablaSelecionada);
    }

    @FXML
    void mostrarMateriales(ActionEvent event) {
        tablaSelecionada = "materiales";
        laGranSolucion(tablaSelecionada);
    }

    @FXML
    void mostrarMosto(ActionEvent event) {
        tablaSelecionada = "mosto";
        laGranSolucion(tablaSelecionada);
    }

    @FXML
    void mostrarMostoSinF(ActionEvent event) {
        tablaSelecionada = "mosto_sin_f";
        laGranSolucion(tablaSelecionada);
    }

    @FXML
    void mostrarPaises(ActionEvent event) {
        tablaSelecionada = "paises";
        laGranSolucion(tablaSelecionada);
    }

    @FXML
    void deleteCerveza(ActionEvent event) {
        IDBoreder.setRight(getPage("deletecerveza"));
    }

    @FXML
    void deleteLiquido(ActionEvent event) {
        IDBoreder.setRight(getPage("deleteliquidofrio"));
    }

    @FXML
    void deleteMosto(ActionEvent event) {
        IDBoreder.setRight(getPage("deletemostosinf"));
    }

    @FXML
    void insertCerveza(ActionEvent event) {
        IDBoreder.setRight(getPage("insertcerveza"));
    }

    @FXML
    void insertLiquido(ActionEvent event) {
        IDBoreder.setRight(getPage("insertliquidofrio"));
    }

    @FXML
    void insertMosto(ActionEvent event) {
        IDBoreder.setRight(getPage("insertmostosinf"));
    }

    @FXML
    void modifyCerveza(ActionEvent event) {

        IDBoreder.setRight(getPage("modifycerveza"));
    }

    @FXML
    void modifyLiquido(ActionEvent event) {

        IDBoreder.setRight(getPage("modifyliquidofrio"));
    }

    @FXML
    void modifyMosto(ActionEvent event) {

        IDBoreder.setRight(getPage("modifymostosinf"));
    }

    @FXML
    void MostrarSentencia1(ActionEvent event) {

    }

    @FXML
    void MostrarSentencia2(ActionEvent event) {

    }

    @FXML
    void MostrarSentencia3(ActionEvent event) {

    }

/*
    OBJETOS FXML DE LIQUIDO FRIO
 */

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

    /*
     OBJETOS DE FXML CERVEZA
         */
    @FXML
    private TextField cer_numero_sec;

    @FXML
    private TextField cer_id_material;

    @FXML
    private TextField cer_id_material3;

    @FXML
    private TextField cer_id_levadura;

    @FXML
    private TextField cer_id_material2;

    @FXML
    private TextField cer_id_agua;

    @FXML
    private TextField cer_id_material1;

    @FXML
    private TextField cer_id_lupulo;

    @FXML
    private TextField cer_id_malta;

    @FXML
    private TextField cer_año;

    @FXML
    private TextField cer_id_material4;

    @FXML
    private TextField cer_id_tiempo_trasvase;
    /*
    OBJETOS DE FXML mosto
     */
    @FXML
    private TextField msf_id_material3;

    @FXML
    private TextField msf_id_levadura;

    @FXML
    private TextField msf_id_material2;

    @FXML
    private TextField msf_id_agua;

    @FXML
    private TextField msf_id_material;

    @FXML
    private TextField msf_id_malta;

    @FXML
    private TextField msf_id_material1;

    @FXML
    private TextField msf_id_lupulo;

    @FXML
    private TextField msf_tiempo_oxidacion;

    @FXML
    private TextField msf_tiempo_fermentacion;

    @FXML
    private TextField msf_temperatura;



    @FXML
    void aceptar(ActionEvent event) {
        System.out.println(identificarSecuencia(idScena.getText().toString()));
        try {
            c.abrirConexion();
        } catch (Exception e) {
            // mostrar mensaje de error al abrir la conexion
        }
        switch (identificarSecuencia(idScena.getText().toString())) {
            case 0:
                elimCerveza();
                break;
            case 1:
                eliminarLiquido();
                break;
            case 2:
                eleminarMosto();
                break;
            case 3:
                insertarCerveza();
                break;
            case 4:
                insertarLiquido();
                break;
            case 5:
                insertarMosto();
                break;
            case 6:
                break;
            case 7:
                break;
            case 8:
                break;
        }
    }

    private void elimCerveza() {

        try {
            c.abrirConexion();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            String s = "delete cerveza , cerveza_emb_cab , cerveza_emb_lin from cerveza , cerveza_emb_cab , cerveza_emb_lin where cer_año=cec_año and cer_numero_sec=cec_numero_sec and cec_numero=cel_numero and cec_fecha=cel_fecha and cer_año= ? and cer_numero_sec= ?;";
            PreparedStatement ss = c.getCon().prepareStatement(s);
            ss.setString(1, cer_año.getText().toString());
            ss.setString(2, cer_numero_sec.getText().toString());
            ss.execute();
            c.cerrarConexion();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void eliminarLiquido(){
        try {
            c.abrirConexion();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            String s = "delete liquido_frio, mosto_sin_f, cerveza,cerveza_emb_cab , cerveza_emb_lin from liquido_frio, mosto_sin_f, cerveza,cerveza_emb_cab , cerveza_emb_lin where lif_id_material2= ? and lif_id_agua= ? and lif_id_material= ? and lif_id_malta= ? and lif_id_material1= ? and lif_id_lupulo= ? and lif_id_material2=msf_id_agua and lif_id_agua=msf_id_agua and lif_id_material=msf_id_material and lif_id_malta=msf_id_malta and lif_id_material1=msf_id_material1 and lif_id_lupulo=msf_id_lupulo and cer_id_material3=msf_id_material3 and cer_id_levadura=msf_id_levadura and cer_id_material2=msf_id_material2 and cer_id_material=msf_id_material and cer_id_malta=msf_id_malta and cer_id_material1=msf_id_material1 and cer_id_lupulo=msf_id_lupulo and cer_año=cec_año and cer_numero_sec=cec_numero_sec and cec_numero=cel_numero and cec_fecha=cel_fecha ;";
            PreparedStatement ss = c.getCon().prepareStatement(s);
            ss.setString(1, lif_id_material2.getText().toString());
            ss.setString(2, lif_id_agua.getText().toString());
            ss.setString(3, lif_id_material.getText().toString());
            ss.setString(4, lif_id_malta.getText().toString());
            ss.setString(5, lif_id_material1.getText().toString());
            ss.setString(6, lif_id_lupulo.getText().toString());
            ss.execute();
            c.cerrarConexion();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void eleminarMosto(){
    try {
            c.abrirConexion();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            String s = "delete mosto_sin_f,cerveza,cerveza_emb_cab , cerveza_emb_lin  from mosto_sin_f,cerveza,cerveza_emb_cab , cerveza_emb_lin  where msf_id_material3= ? and msf_id_levadura= ? and msf_id_material2= ? and msf_id_agua= ? and msf_id_material= ? and msf_id_malta= ? and msf_id_material1= ? and msf_id_lupulo= ? and cer_id_material3=msf_id_material3 and cer_id_levadura=msf_id_levadura and cer_id_material2=msf_id_material2 and cer_id_material=msf_id_material and cer_id_malta=msf_id_malta and cer_id_material1=msf_id_material1 and cer_id_lupulo=msf_id_lupulo and cer_año=cec_año and cer_numero_sec=cec_numero_sec and cec_numero=cel_numero and cec_fecha=cel_fecha  ;";
            ;
            PreparedStatement ss = c.getCon().prepareStatement(s);
            ss.setString(1, msf_id_material3.getText().toString());
            ss.setString(2,msf_id_levadura.getText().toString());
            ss.setString(3, msf_id_material2.getText().toString());
            ss.setString(4, msf_id_agua.getText().toString());
            ss.setString(5, msf_id_material.getText().toString());
            ss.setString(6, msf_id_malta.getText().toString());
            ss.setString(7, msf_id_material1.getText().toString());
            ss.setString(8, msf_id_lupulo.getText().toString());
            ss.execute();
            c.cerrarConexion();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void insertarMosto(){
        try {
            c.abrirConexion();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            String s = "insert into mosto_sin_f values(?,?,?,?,?,?,?,?,?,?,?);";
            PreparedStatement ss = c.getCon().prepareStatement(s);
            ss.setString(1, msf_id_material3.getText().toString());
            ss.setString(2,msf_id_levadura.getText().toString());
            ss.setString(3, msf_id_material2.getText().toString());
            ss.setString(4, msf_id_agua.getText().toString());
            ss.setString(5, msf_id_material.getText().toString());
            ss.setString(6, msf_id_malta.getText().toString());
            ss.setString(7, msf_id_material1.getText().toString());
            ss.setString(8, msf_id_lupulo.getText().toString());
            ss.setString(9, msf_tiempo_oxidacion.getText().toString());
            ss.setString(10, msf_tiempo_fermentacion.getText().toString());
            ss.setString(11, msf_temperatura.getText().toString());
            ss.execute();
            c.cerrarConexion();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void insertarCerveza(){
     try {
            c.abrirConexion();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            String s = "insert into cerveza values(?,?,?,?,?,?,?,?,?,?,?,?);";
            PreparedStatement ss = c.getCon().prepareStatement(s);
            ss.setString(1, cer_numero_sec.getText().toString());
            ss.setString(2,cer_id_material.getText().toString());
            ss.setString(3, cer_id_material3.getText().toString());
            ss.setString(4, cer_id_levadura.getText().toString());
            ss.setString(5, cer_id_material2.getText().toString());
            ss.setString(6, cer_id_agua.getText().toString());
            ss.setString(7, cer_id_material1.getText().toString());
            ss.setString(8, cer_id_lupulo.getText().toString());
            ss.setString(9, cer_id_malta.getText().toString());
            ss.setString(10, cer_año.getText().toString());
            ss.setString(11, cer_id_material4.getText().toString());
            ss.setString(12, cer_id_tiempo_trasvase.getText().toString());
            ss.execute();
            c.cerrarConexion();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
    private void insertarLiquido(){
    try {
            c.abrirConexion();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            String s = "insert into liquido_frio values(?,?,?,?,?,?,?,?);";
            PreparedStatement ss = c.getCon().prepareStatement(s);
             ss.setString(1, lif_id_material2.getText().toString());
            ss.setString(2, lif_id_agua.getText().toString());
            ss.setString(3, lif_id_material.getText().toString());
            ss.setString(4, lif_id_malta.getText().toString());
            ss.setString(5, lif_id_material1.getText().toString());
            ss.setString(6, lif_id_lupulo.getText().toString());
            ss.setString(7, lif_metodo.getText().toString());
            ss.setString(8, lif_temperatura.getText().toString());
            
            ss.execute();
            c.cerrarConexion();
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
