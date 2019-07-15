/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.Dao;

import Util.Conexion;
import Util.InterfaceCrud;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Bean.BeanUsuario;

/**
 *
 * @author Sergio Munoz
 */
public class DaoUsuario extends Conexion implements InterfaceCrud {

    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet comando = null;

    private boolean respuesta = false;

    String usuId = "";
    String usuLogin = "";
    String usuPassword = "";
    

    public DaoUsuario(BeanUsuario Buser) {
        super();
        

        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();

            usuId = Buser.getUsuId();
            usuLogin = Buser.getUsuLogin();
            usuPassword = Buser.getUsuPassword();

        } catch (Exception e) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, e);
        }

    }

    public boolean validar(String usuario, String contrasenia) {

        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();
            comando = puente.executeQuery("select * from usuario where usulogin ='" + usuario + "' and usupassword= '" + contrasenia + "'");

            if (comando.next()) {

                respuesta = true;

            }
            this.cerrarConexion();

        } catch (Exception e) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, e);

        }

        return respuesta;

    }

    @Override
    public boolean AgregarRegistro() {
        try {
            
            puente.executeUpdate("insert into usuario(usulogin, usupassword) values ('"+usuLogin+"', '"+usuPassword+"');");
            respuesta = true;
            
        } catch (Exception e) {
             Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, e);
        }
        return  respuesta;
    }

    @Override
    public boolean ActualizarRegistro() {
        try {
            puente.executeUpdate("update usuario set usulogin =  '"+usuLogin+"', usupassword= '"+usuPassword+"';");
            respuesta = true;
        } catch (Exception e) {
             Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, e);
            
        }
        return respuesta;
    }

}
