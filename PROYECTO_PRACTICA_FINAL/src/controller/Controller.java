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
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;
import javafx.util.Callback;
import main.Main;
import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.LinkedList;

public class Controller {

    private Conexion c=new Conexion();
    private String tablaSelecionada;
    private Pane view;
    private int SecuenciaSQL;




    @FXML
    private BorderPane IDBoreder;

    @FXML
    private TableView<LinkedList[]> table;



    private Pane getPage(String vi){
        Pane vie = new BorderPane();
        try{
            URL fileUrl = Main.class.getResource("../fxml/"+vi+".fxml");
            vie= new FXMLLoader().load(fileUrl);
        }catch (Exception e){
            e.getStackTrace();
        }
        return vie;
    }

    public void laGranSolucion(String nombreDeLaCosaABuscar) {
        // si la talb atiene dato sse los elimino
        int cont2=table.getColumns().size();
        if (table.getColumns().size() > 0) {
            table.getColumns().remove(0,cont2);

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
        SecuenciaSQL=0;
        IDBoreder.setRight( getPage("deletecerveza"));
    }

    @FXML
    void deleteLiquido(ActionEvent event) {
        SecuenciaSQL=1;
        IDBoreder.setRight( getPage("deleteliquidofrio"));
    }

    @FXML
    void deleteMosto(ActionEvent event) {
        SecuenciaSQL=2;
        IDBoreder.setRight( getPage("deletemostosinf"));
    }

    @FXML
    void insertCerveza(ActionEvent event) {
        SecuenciaSQL=3;
        IDBoreder.setRight( getPage("insertcerveza"));
    }

    @FXML
    void insertLiquido(ActionEvent event) {
        SecuenciaSQL=4;
        IDBoreder.setRight( getPage("insertliquidofrio"));
    }

    @FXML
    void insertMosto(ActionEvent event) {
        SecuenciaSQL=5;
        IDBoreder.setRight( getPage("insertmostosinf"));
    }

    @FXML
    void modifyCerveza(ActionEvent event) {
        SecuenciaSQL=6;
        IDBoreder.setRight( getPage("modifycerveza"));
    }

    @FXML
    void modifyLiquido(ActionEvent event) {
        SecuenciaSQL=7;
        IDBoreder.setRight( getPage("modifyliquidofrio"));
    }

    @FXML
    void modifyMosto(ActionEvent event) {
        SecuenciaSQL=8;
        IDBoreder.setRight( getPage("modifymostosinf"));
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
    //insert cerveza values(1969, 1239, 6,6,6,6,6,11,1,1,6,66666.666 );


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


    @FXML
    void aceptar(ActionEvent event) {
        elimCerveza("1238","1974");
        try {
            c.abrirConexion();
        } catch (Exception e) {
            // mostrar mensaje de error al abrir la conexion
        }
        String enviar="";
        switch (SecuenciaSQL){
            case 0:
                elimCerveza("1238","1974");
                break;
            case 1:
                break;
            case 2:
                break;
            case 3:
                break;
            case 4:
                enviar = "insert liquido_frio values( "+lif_id_material2.getText()+","+lif_id_agua.getText()+","+lif_id_material.getText()+","+lif_id_malta.getText()+","+lif_id_material1.getText()+","+lif_id_lupulo.getText()+","+lif_metodo.getText()+","+lif_temperatura.getText()+");";
                break;
            case 5:
                break;
            case 6:
                break;
            case 7:
                break;
            case 8:
                break;
        }
        // hay dentor va el String concadenando los datos


        try {
            c.getSt().executeQuery(enviar);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void elimCerveza(String numSec, String anio){
        LinkedList<String> nombresBorrar=new LinkedList<String>();
        try {
            c.abrirConexion();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            Statement st = c.getCon().createStatement();
            ResultSet rs = st.executeQuery("select cec_fecha from cerveza_emb_cab where cec_numero_sec="+numSec+" and cec_año="+anio+";");
            while (rs.next()) {
                nombresBorrar.add(rs.getString(1));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        int r=3;

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
