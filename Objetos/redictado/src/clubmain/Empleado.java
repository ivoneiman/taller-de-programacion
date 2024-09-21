
package clubmain;

public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antiguedad;
    
    public Empleado (String nombre, double sueldo, int antiguedad){
        setNombre(nombre);
        setAntiguedad(antiguedad);
        setSueldo(sueldo);
    }
    
    private void setNombre (String nombre){
        this.nombre = nombre;    
    }
    
    private void setSueldo(double sueldo){
        this.sueldo = sueldo;
    }
    
    private void setAntiguedad(int antiguedad){
        this.antiguedad = antiguedad;
    }
    
    public int getAntiguedad(){
        return antiguedad;
    }
    public double getSueldo(){
        return sueldo;
    }
    
    public abstract double calcularEfectividad();
    
    public double calcularSueldoACobrar(){
        this.sueldo = this.sueldo+(this.antiguedad*1.10);
        return this.sueldo;
    }
    
    public String toString(){
        
        return "Nombre: "+this.nombre;
    }
}
