/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clubmain;

public class NewMain {

    
    public static void main(String[] args) {
        
        Jugador j = new Jugador("Ozil", 1000, 34, 8, 42);
        
        Entrenador e = new Entrenador("Pep", 20000, 18, 250);
        
        
        
        System.out.println(j.toString());
        
        System.out.println(e.toString());
        
        
    }
    
}
