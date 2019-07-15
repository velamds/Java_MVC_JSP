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
public class BeanCategoria {
    private String catid;
    private String cattip;

    public BeanCategoria(String catid, String cattip) {
        this.catid = catid;
        this.cattip = cattip;
    }
    public BeanCategoria(){
    }

    public String getCatid() {
        return catid;
    }

    public void setCatid(String catid) {
        this.catid = catid;
    }

    public String getCattip() {
        return cattip;
    }

    public void setCattip(String cattip) {
        this.cattip = cattip;
    }
    
    
}
