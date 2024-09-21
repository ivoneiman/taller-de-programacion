/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package segundaVersionParcial;

public abstract class Turno {
    private String nombre;
    private double sueldoDocente;
    private double cuota;
    
    public Turno(int N, String unNombre, double unSueldo, double unaCuota){
        setNombre(unNombre);
        setSueldo(unSueldo);
        setCuota(unaCuota);
    }
    
    private void setNombre(String unNombre){
        nombre = unNombre;
    }
    
    private void setSueldo(double unSueldo){
        sueldoDocente = unSueldo;
    }
    
    private void setCuota (double unaCuota){
        cuota = unaCuota;
    }
    
    public double getsueldo(){
        return sueldoDocente;
    }
    
    public double getCuota(){
        return cuota;
    }

    public String getNombre() {
        return nombre;
    }
    
    

    public abstract void agregarAlumno(Alumno alumno);
    
    
    
}
