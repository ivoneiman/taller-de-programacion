/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package estaciongnc;


public class Surtidor {
    private boolean servicio;
    private int dimF;
    private int dimL=0;
    private Venta[] ventas;
    
    public Surtidor (int V){
        dimF = V;
        ventas = new Venta[dimF];
        setServicio();
    }
    
    public boolean agregarVenta (int unDni, int cantM3, double unMonto, String unPago){
       boolean aux = false;
       if (unPago.equals("debito") || unPago.equals("credito") || unPago.equals("efectivo") && dimL < dimF){
           ventas[dimL] = new Venta(unDni, cantM3, unMonto, unPago);
           dimL++;
           aux=true;
       }
       return aux;
    }
    
    public boolean fueraDeServicio (int X){
        boolean aux=false;
        int cantTotalMetros = 0;
        for (int i=0; i<dimL;i++){
            cantTotalMetros += ventas[i].getCantM3();
        }
        if (cantTotalMetros < X){
            setFueraServicio();
            aux=true;
        }
        return aux;
    }
    
    public Venta mayorVentaSurtidor (){
        double max = -1;
        Venta ventaMaxima = null;
        if (ventas[0] != null){
            for (int i=0;i<dimL;i++){
                if (ventas[i].getMonto() > max){
                    max = ventas[i].getMonto();
                    ventaMaxima = ventas[i];
                }
            }
        }
        return ventaMaxima;
    }
    
    private void setServicio(){
        servicio = true;
    }
    private void setFueraServicio(){
        servicio = false;
    }
    private boolean getServicio(){
        return servicio;
    }
    
    
    public String toString (){
        String aux = "";
        if (getServicio()){
            aux+="Se encuentra en servicio";
        }
        else{
            aux+="Se encuentra fuera de servicio";
        }
        for (int i=0;i<dimL;i++){
            aux += ";\n Venta n°"+(i+1)+" "+ventas[i].toString();
        }
        return aux;
    }
    
}
