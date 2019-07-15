/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.Bean;

/**
 *
 * @author Sergio Munoz
 */
public class BeanGraficaVeh {
    private String Cantidad;
    private String Estado;

    public BeanGraficaVeh(String Cantidad, String Estado) {
        this.Cantidad = Cantidad;
        this.Estado = Estado;
    }

    public BeanGraficaVeh() {
        
    }

    public String getCantidad() {
        return Cantidad;
    }

    public void setCantidad(String Cantidad) {
        this.Cantidad = Cantidad;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }
    
    
}
