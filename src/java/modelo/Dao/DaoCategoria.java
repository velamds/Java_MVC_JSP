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
import modelo.Bean.BeanVehiculo;

/**
 *
 * @author Sergio Munoz
 */
public class DaoCategoria extends Conexion implements InterfaceCrud {
    
    public static ArrayList<BeanCategoria> consultar() {
        BeanCategoria bcategoria = null;
        ArrayList<BeanCategoria> CatList = new ArrayList<>();
        try {
            Conexion conexion = new Conexion();
            Connection conn = conexion.obtenerConexion();
            Statement puente = conn.createStatement();

            ResultSet rs = puente.executeQuery("select * from categoria");
           
            while (rs.next()) {
                bcategoria = new BeanCategoria(rs.getString(1), rs.getString(2));
                CatList.add(bcategoria);
            }
            rs.close();
            puente.close();
        } catch (Exception e) {
            Logger.getLogger(DaoCategoria.class.getName()).log(Level.SEVERE, null, e);
        }
        return CatList;
    }
    
    public static String consultaPorId(String ID) {
        String CatNom = "";
        try {
            Conexion conexion = new Conexion();
            Connection conn = conexion.obtenerConexion();
            Statement puente = conn.createStatement();

            ResultSet rs = puente.executeQuery("CALL consultarPorId("+ID+")");
           
            while (rs.next()) {
                CatNom = rs.getString(1);
            }
            rs.close();
            puente.close();
        } catch (Exception e) {
            Logger.getLogger(DaoCategoria.class.getName()).log(Level.SEVERE, null, e);
        }
        return CatNom;
    }

    @Override
    public boolean AgregarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean ActualizarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}