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
public class BeanVehiculo {
    
  private String vehPlaca;
  private String datId;
  private String catId;
  private String vehModelo;
  private String vehMarca;
  private String vehEstado;
  private String vehPrecio;
  
   public BeanVehiculo(String vehPlaca, String datId, String catId, String vehModelo, String vehMarca, String vehEstado, String vehPrecio) {
        this.vehPlaca = vehPlaca;
        this.datId = datId;
        this.catId = catId;
        this.vehModelo = vehModelo;
        this.vehMarca = vehMarca;
        this.vehEstado = vehEstado;
        this.vehPrecio = vehPrecio;
    }

    public BeanVehiculo() {
        
           }

    public String getVehPlaca() {
        return vehPlaca;
    }

    public void setVehPlaca(String vehPlaca) {
        this.vehPlaca = vehPlaca;
    }

    public String getDatId() {
        return datId;
    }

    public void setDatId(String datId) {
        this.datId = datId;
    }

    public String getCatId() {
        return catId;
    }

    public void setCatId(String catId) {
        this.catId = catId;
    }

    public String getVehModelo() {
        return vehModelo;
    }

    public void setVehModelo(String vehModelo) {
        this.vehModelo = vehModelo;
    }

    public String getVehMarca() {
        return vehMarca;
    }

    public void setVehMarca(String vehMarca) {
        this.vehMarca = vehMarca;
    }

    public String getVehEstado() {
        return vehEstado;
    }

    public void setVehEstado(String vehEstado) {
        this.vehEstado = vehEstado;
    }

    public String getVehPrecio() {
        return vehPrecio;
    }

    public void setVehPrecio(String vehPrecio) {
        this.vehPrecio = vehPrecio;
    }

   
    
}
