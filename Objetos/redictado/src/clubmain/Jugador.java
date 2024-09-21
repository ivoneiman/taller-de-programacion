
package clubmain;

public class Jugador extends Empleado{
    private int partidos;
    private int goles;
    
    public Jugador (String nombre, double sueldo, int antiguedad, int goles, int partidos){
        super(nombre, sueldo, antiguedad);
        setGoles(goles);
        setPartidos(partidos);
    }
    
    private void setPartidos(int partidos){
        this.partidos = partidos;
    }
    
    private void setGoles (int goles){
        this.goles = goles;
    }
    
    public double calcularEfectividad(){
        return this.partidos/this.goles;
    }
    
    public double SueldoACobrar(){
        double aux= calcularSueldoACobrar();
        if (calcularEfectividad() > 0.5){
            aux += getSueldo()*1.5; 
            System.out.println(" el jugador tiene mas de 0.5 de efectividad");
        }
        return aux;
    }
    
    public String toString (){
        return super.toString() +" Sueldo a cobrar: "+SueldoACobrar()+" Efectividad del jugador: "+calcularEfectividad();
    }
}
