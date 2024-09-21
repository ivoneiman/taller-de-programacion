/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package estaciongnc;

/**
 *
 * @author Usuario
 */
public class EstacionGNC {

    public static void main(String[] args) {
        
        Estacion e = new Estacion("7 y 32", 200, 5);
        
        e.agregarVenta(2, 111, 10, "efectivo");
        e.agregarVenta(1, 220, 30, "debito");
        e.agregarVenta(3, 220, 30, "debito");
        e.agregarVenta(4, 220, 30, "debito");
        e.agregarVenta(3, 220, 30, "debito");
        e.agregarVenta(2, 220, 30, "debito");
        e.agregarVenta(1, 220, 30, "debito");
        e.agregarVenta(3, 220, 30, "debito");
        e.agregarVenta(4, 220, 30, "debito");
        e.agregarVenta(5, 220, 30, "debito");
        
        System.out.println(e.setFueraServicio(10000));
        
        if (e.mayorVentaEstacion() != null){
            System.out.println("La mayor venta de la estacion fue la venta: "+e.mayorVentaEstacion().toString());
        }
        
        System.out.println(e.toString());
    }
    
}
