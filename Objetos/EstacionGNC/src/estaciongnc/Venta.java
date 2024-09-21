/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package estaciongnc;


public class Venta {
    private int dni;
    private int cantM3;
    private double monto;
    private String pago;

    public Venta(int dni, int m3, double monto, String pago) {
        this.dni = dni;
        this.cantM3 = m3;
        this.monto = monto;
        this.pago = pago;
    }
    
    public int getCantM3(){
        return cantM3;
    }
    
    public double getMonto(){
        return monto;
    }
    
    public String toString(){
        return "DNI del cliente: "+dni+" cantidad de m3: "+cantM3+" monto abonado: "+monto+ " metodo de pago: "+pago+"\n";
    }
    
    
}
