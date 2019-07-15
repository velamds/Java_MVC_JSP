/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.Dao;

import Util.Conexion;
import Util.InterfaceCrud;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Bean.BeanCategoria;
import modelo.Bean.BeanGraficaVeh;
import modelo.Bean.BeanVehiculo;
import modelo.Bean.BeanVehiculoTest;

/**
 *
 * @author Sergio Munoz
 */
public class DaoVehiculo extends Conexion implements InterfaceCrud {

    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet comando = null;

    private boolean respuesta = false;

    private String vehPlaca = "";
    private String datId = "";
    private String catId;
    private String vehModelo = "";
    private String vehMarca = "";
    private String vehEstado = "";
    private String vehPrecio = "";

    public DaoVehiculo(BeanVehiculo bVehiculo) {

        super();

        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();

            vehPlaca = bVehiculo.getVehPlaca();
            datId = bVehiculo.getDatId();
            catId = bVehiculo.getCatId();
            vehModelo = bVehiculo.getVehModelo();
            vehMarca = bVehiculo.getVehMarca();
            vehEstado = bVehiculo.getVehEstado();
            vehPrecio = bVehiculo.getVehPrecio();

        } catch (Exception e) {
            Logger.getLogger(DaoVehiculo.class.getName()).log(Level.SEVERE, null, e);
        }

    }

    public DaoVehiculo() {
    }

    @Override
    public boolean AgregarRegistro() {

        try {
            puente.executeUpdate("insert into vehiculo values ('" + vehPlaca + "' ,'" + datId + "' ,'" + catId + "' ,'" + vehModelo + "' ,'" + vehMarca + "' ,'" + vehEstado + "' ,'" + vehPrecio + "');");
            respuesta = true;
        } catch (Exception e) {
            Logger.getLogger(DaoVehiculo.class.getName()).log(Level.SEVERE, null, e);
        }
        return respuesta;
    }

    @Override
    public boolean ActualizarRegistro() {
        try {
            puente.executeUpdate("update vehiculo set datid= '" + datId + "', catid='" + catId + "', vehmodelo= '" + vehModelo + "', vehmarca= '" + vehMarca + "', vehestado='" + vehEstado + "', vehprecio='" + vehPrecio + "' where vehplaca='" + vehPlaca + "'; ");
            respuesta = true;
        } catch (Exception e) {
            Logger.getLogger(DaoVehiculo.class.getName()).log(Level.SEVERE, null, e);
        }
        return respuesta;
    }

    public static BeanVehiculo consultarPorPlaca(String placa) {
        BeanVehiculo bvehiculo = null;

        try {
            Conexion conexion = new Conexion();
            Connection conn = conexion.obtenerConexion();
            Statement puente = conn.createStatement();

            ResultSet rs = puente.executeQuery("select * from vehiculo where vehplaca= '" + placa + "'");
            while (rs.next()) {
                bvehiculo = new BeanVehiculo(placa, rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }
            rs.close();
            puente.close();
        } catch (Exception e) {
            Logger.getLogger(DaoVehiculo.class.getName()).log(Level.SEVERE, null, e);

        }
        return bvehiculo;
    }

    public ArrayList<BeanVehiculo> listar() {

        Conexion conexion = new Conexion();
        ArrayList<BeanVehiculo> listaVehiculo = new ArrayList<BeanVehiculo>();

        try {
            puente = conexion.obtenerConexion().createStatement();
            comando = puente.executeQuery("select * from vehiculo");
            while (comando.next()) {
                vehPlaca = comando.getString("vehplaca");
                datId = comando.getString("datid");
                catId = comando.getString("catid");
                vehModelo = comando.getString("vehmodelo");
                vehMarca = comando.getString("vehmarca");
                vehEstado = comando.getString("vehestado");
                vehPrecio = comando.getString("vehprecio");

                BeanVehiculo bvehiculo = new BeanVehiculo();
                bvehiculo.setVehPlaca(vehPlaca);
                bvehiculo.setDatId(datId);
                bvehiculo.setCatId(catId);
                bvehiculo.setVehModelo(vehModelo);
                bvehiculo.setVehMarca(vehMarca);
                bvehiculo.setVehMarca(vehMarca);
                bvehiculo.setVehEstado(vehEstado);
                bvehiculo.setVehPrecio(vehPrecio);

                listaVehiculo.add(bvehiculo);

            }

        } catch (Exception e) {
        }

        return listaVehiculo;

    }
    
    public ArrayList<BeanVehiculoTest> listarTest() {

        Conexion conexion = new Conexion();
        ArrayList<BeanVehiculoTest> listaVehiculo = new ArrayList<BeanVehiculoTest>();

        try {
            puente = conexion.obtenerConexion().createStatement();
            comando = puente.executeQuery("select VEHPLACA,CATIPO,categoria.CATID from vehiculo JOIN categoria ON categoria.CATID=vehiculo.CATID");
            while (comando.next()) {
                String placa = comando.getString("VEHPLACA");
                BeanCategoria bc = new BeanCategoria(comando.getString("CATID"),comando.getString("CATIPO"));

                BeanVehiculoTest bvehiculo = new BeanVehiculoTest();
                bvehiculo.setPlaca(placa);
                bvehiculo.setCategoria(bc);

                listaVehiculo.add(bvehiculo);

            }

        } catch (Exception e) {
           //e.getMessage();
        }

        return listaVehiculo;

    }
    
    public ArrayList<BeanGraficaVeh> listarGraVeh() {

        Conexion conexion = new Conexion();
        ArrayList<BeanGraficaVeh> listaVehiculo = new ArrayList<>();
        
        try {
            puente = conexion.obtenerConexion().createStatement();
            comando = puente.executeQuery("SELECT count(VEHESTADO) as Cantidad,VEHESTADO,VEHMODELO FROM vehiculo GROUP BY VEHESTADO");
            while (comando.next()) {
                String cantidad = comando.getString("Cantidad");
                String estado = comando.getString("VEHMODELO");

                BeanGraficaVeh bvehiculo = new BeanGraficaVeh();
                bvehiculo.setCantidad(cantidad);
                bvehiculo.setEstado(estado);

                listaVehiculo.add(bvehiculo);

            }

        } catch (Exception e) {
           //e.getMessage();
        }

        return listaVehiculo;

    }
    
    

}
