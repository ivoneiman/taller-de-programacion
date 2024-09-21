/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package segundaVersionParcial;

/**
 *
 * @author Usuario
 */
public class TurnoPresencial extends Turno{
    private Alumno[] alumnos;
    private int dimL;
    private int dimF;
    
    public TurnoPresencial(int N, String unNombre, double unSueldo, double unaCuota) {
        super(N, unNombre, unSueldo, unaCuota);
        dimF = N;
        dimL = 0;
        alumnos = new Alumno[dimF];
    }
    
    public void agregarAlumno(Alumno alumno){
        if (dimL < dimF){
            alumnos[dimL] = alumno;
            dimL++;
        }
    }

    public int getDimL() {
        return dimL;
    }
    
    public double calcularGanancia(){
        double aux = 0;
        for (int i = 0; i<getDimL();i++){
            aux += 1;
        }
        return aux*getCuota()-getsueldo();
    }
    
    public String toString(){
        String aux="";
        for (int i=0;i<getDimL();i++){
            aux+= "\n Alumno "+(i+1)+alumnos[i].toString();
        }
        return aux;
    }
    
}
