/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.sql.*;

/**
 *
 * @author Sergio Munoz
 */
public class Conexion {

    public String driver, urlbd, user, pass, bd;
    public Connection conexion;

    public Conexion() {

        driver = "com.mysql.jdbc.Driver";
        user = "root";
        pass = "";
        bd = "ejerciciocarros";
        urlbd = "jdbc:mysql://localhost:3306/" + bd;

        try {
            Class.forName(driver).newInstance();
            conexion = DriverManager.getConnection(urlbd, user, pass);
            System.out.println("Conexion ok!");

        } catch (Exception e) {
            System.out.println("Error al conectar" + e.getMessage());
        }

    }
    
    public Connection obtenerConexion(){
        return conexion;
    }
    
    public Connection cerrarConexion() throws SQLException{
        
        conexion.close();
        conexion = null;
        return conexion;
        
    }
    public static void main(String[] args) {
        new Conexion();
    }

}
