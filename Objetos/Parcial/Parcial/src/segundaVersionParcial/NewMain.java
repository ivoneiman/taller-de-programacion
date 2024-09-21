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
public class NewMain {

    
    public static void main(String[] args) {
        
        // presencial
        Alumno a1 = new Alumno(1, "Juan", "La Plata");
        Alumno a2 = new Alumno(1, "Juan", "La Plata");
        Alumno a3 = new Alumno(1, "Juan", "La Plata");
        Alumno a4 = new Alumno(1, "Juan", "La Plata");
        Alumno a5 = new Alumno(1, "Juan", "La Plata");
        Alumno a6 = new Alumno(1, "Juan", "La Plata");
        Alumno a7 = new Alumno(1, "Juan", "La Plata");
        Alumno a8 = new Alumno(1, "Juan", "La Plata");
        
        // online
        Alumno a9 = new Alumno(1, "Juan", "s Plata");
        Alumno a10 = new Alumno(1, "Juan", "s Plata");
        Alumno a11 = new Alumno(1, "Juan", "s Plata");
        Alumno a12 = new Alumno(1, "Juan", "s Plata");
        Alumno a13 = new Alumno(1, "Juan", "sPlata");
        Alumno a14 = new Alumno(1, "Juan", "Las Plata");
        Alumno a15 = new Alumno(1, "Juan", "Las Plata");
        Alumno a16 = new Alumno(1, "Juan", "La sPlata");
        Alumno a17 = new Alumno(1, "Juan", "La sPlata");
        Alumno a18= new Alumno(1, "Juan", "La sPlata");
        Alumno a19  = new Alumno(1, "Juan", "Lsa Plata");
        
        TurnoOnline online = new TurnoOnline(15, "Gonzalo", 25000, 10000); // Sueldo $25.000 Cuota $10.000
        TurnoPresencial presencial = new TurnoPresencial(15, "Gonzalo", 25000, 10000); // Sueldo $25.000 Cuota $10.000
        
        
        Curso curso = new Curso("cursos", online, presencial);
        
        
        curso.agregarAlumnoAlCurso(a1);
        curso.agregarAlumnoAlCurso(a2);
        curso.agregarAlumnoAlCurso(a3);
        curso.agregarAlumnoAlCurso(a4);
        curso.agregarAlumnoAlCurso(a5);
        curso.agregarAlumnoAlCurso(a6);
        curso.agregarAlumnoAlCurso(a7);
        curso.agregarAlumnoAlCurso(a8);
        curso.agregarAlumnoAlCurso(a9);
        curso.agregarAlumnoAlCurso(a10);
        curso.agregarAlumnoAlCurso(a11);
        curso.agregarAlumnoAlCurso(a12);
        curso.agregarAlumnoAlCurso(a13);
        curso.agregarAlumnoAlCurso(a14);
        curso.agregarAlumnoAlCurso(a15);
        curso.agregarAlumnoAlCurso(a16);
        curso.agregarAlumnoAlCurso(a17);
        curso.agregarAlumnoAlCurso(a18);
        curso.agregarAlumnoAlCurso(a19);
        
        System.out.println(curso.toString());
        
    }
    
}
