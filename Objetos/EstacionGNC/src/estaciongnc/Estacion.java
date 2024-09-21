/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package estaciongnc;

public class Estacion {
    private String direccion;
    private double precioM3;
    private int dimF = 6;
    private Surtidor[] surtidores = new Surtidor[dimF];
    
    public Estacion (String unaDirec, double unPrecio, int V){
        setDireccion(unaDirec);
        setPrecio(unPrecio);
        for (int i=0; i<dimF; i++){
            surtidores[i] = new Surtidor(V); // Instancio pq lo pide la consigna instanciarle V ventas por cada surtidor
        }
    }
    
    public void agregarVenta(int N, int unDni, int cantM3, String unPago){
        double monto = cantM3*precioM3;
        if (surtidores[(N-1)].agregarVenta(unDni, cantM3, monto, unPago)){
            System.out.println("Se agregó una venta"); // a modo de debug
        }
    }
    
    public String setFueraServicio (int X){
        String aux = "";
        for (int i=0;i<dimF;i++){
            if (surtidores[i].fueraDeServicio(X)){
                aux += "Se seteo fuera de servicio el surtidor n°"+(i+1)+"\n";
            }
        }
        return aux;
    }
    
    public Venta mayorVentaEstacion (){
        double max = -1;
        Venta ventaMaxima = null;
        for (int i=0;i<dimF;i++){
            if (surtidores[i].mayorVentaSurtidor() != null && surtidores[i].mayorVentaSurtidor().getMonto() > max){
                max = surtidores[i].mayorVentaSurtidor().getMonto();
                ventaMaxima = surtidores[i].mayorVentaSurtidor();
            }
        }
        return ventaMaxima;
    }
    
    private void setDireccion (String unaDirec){
        direccion = unaDirec;
    }
    
    private void setPrecio (double unPrecio){
        precioM3 = unPrecio;
    }
    
    public String toString(){
        String aux="";
        for(int i=0;i<dimF;i++){
            aux+="Surtidor "+(i+1)+" "+surtidores[i].toString()+"\n";
        }
        return aux;
    }
}
