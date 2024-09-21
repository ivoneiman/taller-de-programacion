/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package redictado;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Redictado {

    public static void main(String[] args) {
        int dimFMatriz = 40;
        int diml = 0;
        int filas = 5;
        int columnas = 8;
        Persona[][] casting = new Persona[filas][columnas];
        int[] dimlFilas= new int[5];
        // El vector se pone automaticamente en 0 , por eso no hace falta iniciar en 0
        
        String unNombre = GeneradorAleatorio.generarString(3);
        int x=0;
        int y=0;
        while (!unNombre.equals("ZZZ") && (diml < dimFMatriz)){
            Persona p = new Persona("unNombre", GeneradorAleatorio.generarInt(100), GeneradorAleatorio.generarInt(80));
            if (dimlFilas[x] == 8 && (x < 5)){  // si la fila está llena
                x++;                // avanzo en la fila
                y=0;                // seteo y=0
                casting[x][y] = p;  // siguiente fila = p
                dimlFilas[x]++;     // dimlFilas de la nueva fila + 1
                diml++;             // diml global + 1
            }
            else if (dimlFilas[x] < 8){ // si no, todavía hay lugar en la fila entonces:
                casting[x][y] = p;  //el lugar lubre = p
                dimlFilas[x]++;
                y++;           // aumento y
                diml++;         // aumento diml gobal
            }
            unNombre = GeneradorAleatorio.generarString(3);
        }
    }
    
}
