
package clubmain;


public class Entrenador extends Empleado{
    private int campeonatos;
    
    public Entrenador(String nombre, double sueldo, int antiguedad, int campeonatos){
        super(nombre, sueldo, antiguedad);
        this.campeonatos = campeonatos;
    }
    
    public double calcularEfectividad(){
        return getAntiguedad()/campeonatos;
    }
    
     
     public double SueldoACobrar(){
        double aux= calcularSueldoACobrar();
        if (this.campeonatos > 0 && this.campeonatos < 5){
            aux += 5000; 
            System.out.println("el entrenador tiene entre 1 y 4 campeonatos y recibe $5000"); // este SO es a modo de debuggin
        }
        else if (this.campeonatos > 4 && this.campeonatos <= 10){
            aux += 30000;
            System.out.println("el entrenador tiene entre 5 y 10 campeonatos y recibe $30000"); // este SO es a modo de debuggin
        }
        else if (this.campeonatos > 10){
            aux += 50000;
            System.out.println("el entrenador tiene mas de 10 campeonatos y recibe $50000"); // este SO es a modo de debuggin
        }
        
        
        return aux;
    }
     
     public String toString(){
         return super.toString() + " Sueldo a cobrar: "+SueldoACobrar()+" Efectividad del entrenador: "+calcularEfectividad();
     }
}
