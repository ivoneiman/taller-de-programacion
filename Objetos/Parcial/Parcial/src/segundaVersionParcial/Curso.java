/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package segundaVersionParcial;


public class Curso {
    private String descripcion;
    private TurnoOnline turnoOnline;
    private TurnoPresencial turnoPresencial;
    
    public Curso(String unaDescripcion, TurnoOnline online, TurnoPresencial presencial){
        setDescripcion(unaDescripcion);
        setTurnoOnline(online);
        setTurnoPresencial(presencial);
    }
    
    public void agregarAlumnoAlCurso (Alumno alumno){
        if (alumno.getResidencia().equals("La Plata")){
            turnoPresencial.agregarAlumno(alumno);
        }
        else {
            turnoOnline.agregarAlumno(alumno);
        }
    }
    
    public double gananciaNeta(){
        return turnoOnline.calcularGanancia() + turnoPresencial.calcularGanancia();
    }

    public String getDescripcion() {
        return descripcion;
    }

    private void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    private TurnoOnline getTurnoOnline() {
        return turnoOnline;
    }

    private void setTurnoOnline(TurnoOnline turnoOnline) {
        this.turnoOnline = turnoOnline;
    }

    private TurnoPresencial getTurnoPresencial() {
        return turnoPresencial;
    }

    private void setTurnoPresencial(TurnoPresencial turnoPresencial) {
        this.turnoPresencial = turnoPresencial;
    }
    
    public String toString(){
        return "Turno Online: \n "
                + "Nombre del Docente: "+turnoOnline.getNombre()+"\n"+turnoOnline.toString()+"\n"
                +"\nTurno Presencial \n"
                +" Nombre del Docente: "+turnoPresencial.getNombre()+"\n"+turnoPresencial.toString();
    }
    
    
    
}
