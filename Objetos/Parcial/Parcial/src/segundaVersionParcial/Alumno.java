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
public class Alumno {
    private int dni;
    private String nombre;
    private String residencia;

    public Alumno(int dni, String nombre, String residencia) {
        this.dni = dni;
        this.nombre = nombre;
        this.residencia = residencia;
    }

    public int getDni() {
        return dni;
    }

    public String getNombre() {
        return nombre;
    }

    public String getResidencia() {
        return residencia;
    }

    @Override
    public String toString() {
        return "{" + "dni= " + dni + ", nombre= " + nombre + ", residencia= " + residencia + '}';
    }
    
    
}
