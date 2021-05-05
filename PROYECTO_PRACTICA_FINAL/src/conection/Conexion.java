package conection;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class Conexion {

    private Connection con;
    private Statement st;
    private ResultSet rs;

    /**
     * @brief: Abre la conexión con la base de datos
     */
    public  Conexion(){
    }

    public Connection getCon() {
        return con;
    }

    public ResultSet getRs() {
        return rs;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public void setRs(ResultSet rs) {
        this.rs = rs;
    }

    public Statement getSt() {
        return st;
    }

    public boolean abrirConexion() throws Exception {
        try {
            String userName = "ukimmrsyremx5quf";
            String password = "gA817OVGnbPG7ukVKYco";
            String database = "b3egw3goupxrzhhztdav";
            String url = "jdbc:mysql://ukimmrsyremx5quf:gA817OVGnbPG7ukVKYco@b3egw3goupxrzhhztdav-mysql.services.clever-cloud.com:3306/b3egw3goupxrzhhztdav";
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, userName, password);
        } catch (ClassNotFoundException e) {
            // Error. No se ha encontrado el driver de la BD
          throw new ClassNotFoundException();

        } catch (SQLException e) {
            // Error. No se ha podido conectar a la BD
            throw new SQLException();

        } catch (Exception e) {
            // Error. No se ha encontrado el driver de la BD
            throw new Exception();
        }
        return true;
    }

    /**
     * @brief: Cierra la conexión con la BD
     */
    public void cerrarConexion() throws SQLException {
        try {
            con.close();
            System.out.println("Conexión cerrada");
        } catch (SQLException e) {
            throw new SQLException();
        }
    }

    public LinkedList<String> obtenerNombreDeColumnas(String nombreDeLaTabla) throws SQLException {
        // nos creamos una lista para guardar los nombres de las columnas
        LinkedList<String> listaDeNombres = new LinkedList<>();
        try {
            st = con.createStatement();
            rs = st.executeQuery("SHOW COLUMNS from b3egw3goupxrzhhztdav."+nombreDeLaTabla+";");
            while (rs.next()) {
                listaDeNombres.add(rs.getNString("Field"));
            }
        } catch (SQLException e) {
            throw new SQLException ();
        }
        return listaDeNombres;
    }

    public  LinkedList<String>[] datosTabla(String nombreDeLaTabla) throws SQLException {
        int numColumnas=obtenerNombreDeColumnas(nombreDeLaTabla).size();
        LinkedList<String>[] datosDeLaTabla = new LinkedList[numColumnas];
        for (int i=0; i<numColumnas;i++){
            datosDeLaTabla[i]=new LinkedList<String>();
        }
        // nos creamos una lista para guardar los nombres de las columnas
        try {

            st = con.createStatement();
            rs = st.executeQuery("select * from "+nombreDeLaTabla+" ;");
            int posicion=0;
            while (rs.next()) {
                for( int i =0; i<numColumnas;i++){
                    datosDeLaTabla[i].add(rs.getString(i+1));
                }
                posicion++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException ();
        }
        return datosDeLaTabla;
    }



/*
    public  ResultSet datosTabla(String nombreDeLaTabla) throws SQLException {
        int numColumnas=obtenerNombreDeColumnas(nombreDeLaTabla).size();
        LinkedList<String>[] datosDeLaTabla = new LinkedList[numColumnas];
        for (int i=0; i<numColumnas;i++){
            datosDeLaTabla[i]=new LinkedList<String>();
        }
        // nos creamos una lista para guardar los nombres de las columnas
        try {

            st = con.createStatement();
            rs = st.executeQuery("select * from "+nombreDeLaTabla+" ;");
            return rs;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException ();
        }
    }

 */


    public void ProcesarResultados_At() {
        System.out.println("---------------------------------");
        System.out.println("Procesamos por nombre de atributo");
        System.out.println("---------------------------------");
        try {
            while (rs.next()) {
                String name = rs.getString("cantidad");

                System.out.println(name);
            }
        } catch (Exception e) {

            System.out.println("Error al visualizar datos");
        }
    }
    // Se procesa por el campo recuperado
    public void ProcesarResultados_Pos() {
        System.out.println("---------------------------------");
        System.out.println("Procesamos por Posicion          ");
        System.out.println("---------------------------------");
        try {
            while (rs.next()) {
                String name = rs.getString("Field");

                System.out.println(name);

            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error al visualizar datos");
        }
    }

    // Se procesa por el campo recuperado
    public void ProcesarComoString() {
        System.out.println("---------------------------------");
        System.out.println("Procesamos por String          ");
        System.out.println("---------------------------------");
        try {
            while (rs.next()) {
                String name = rs.getString(1);

                System.out.println(name);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error al visualizar datos");
        }
    }





   //  CREATE USER 'pabletaGC'@'%' IDENTIFIED BY '12bd123';
    public void obtenerDatosTabla(String Query) {
        try {
            st = con.createStatement();
            rs = st.executeQuery(Query);
            System.out.println("Tabla abierta");
        } catch (SQLException e) {
            System.out.println("Error al Abrir tabla ");
        }
    }


}
