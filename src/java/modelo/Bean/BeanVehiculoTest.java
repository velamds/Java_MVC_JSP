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
public class BeanVehiculoTest {
    private String placa;
    private BeanCategoria categoria;

    public BeanVehiculoTest(String placa, BeanCategoria categoria) {
        this.placa = placa;
        this.categoria = categoria;
    }

    public BeanVehiculoTest() {
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public BeanCategoria getCategoria() {
        return categoria;
    }

    public void setCategoria(BeanCategoria categoria) {
        this.categoria = categoria;
    }

    
    
    
}
