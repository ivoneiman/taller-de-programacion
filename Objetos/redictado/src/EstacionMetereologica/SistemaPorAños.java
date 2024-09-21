/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EstacionMetereologica;

/**
 *
 * @author Usuario
 */
public class SistemaPorAños extends Estacion{
    private double [] años;
    private double [] meses;
    
    public SistemaPorAños(int N, int A){
        setMeses();
        setAños(N, A);
        // No instancio los vectores pq esto se ejecuta automáticamente
    }
    
    public void setMeses(){
        meses = new double[12];
    }
    
    public void setAños(int N, int A){
        años = new double[(N)+A+N-1];
    }
    
    
    /*public SistemaPorAños (int N, int A){ // N = años consecutivos ; A = a partir de un año
        int años = A + (N-1);
        int mes = 12;
        registro = new double[años][mes];
        System.out.println("meses: "+mes+" años: "+años); // so a modo de debugging
    }*/
}
