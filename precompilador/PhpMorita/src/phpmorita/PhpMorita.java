/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package phpmorita;

import java.io.File;

/**
 *
 * @author David Abraham
 */
public class PhpMorita {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        generadorFlex();
        generadorFlexS();
        generadorCupS();
        generadorFlexI();
        generadorCupI();
        Interfaz a = new Interfaz();
        a.setTitle("PhpMorita Compilador para PseudoPHP");
        a.setLocationRelativeTo(null);
        a.setResizable(false);
        a.setVisible(true);
    }
    
    public static void generadorFlex() {
        JFlex.Main.generate(new File(
                "src" + File.separator + "Lexico"
                + File.separator + "Lexer.flex"));
    }
    
    public static void generadorFlexS() {
        JFlex.Main.generate(new File(
                "src" + File.separator + "Sintactico"
                + File.separator + "Lexico.flex"));
    }
    
    public static void generadorCupS() {
        String opciones[] = new String[5];
        opciones[0] = "-destdir";
        opciones[1] = "src"
                + File.separator
                + "Sintactico";
        opciones[2] = "-parser";
        opciones[3] = "AnalizadorSintactico";
        opciones[4] = "src"
                + File.separator
                + "Sintactico"
                + File.separator
                + "Sintaxis.cup";
        try {
            java_cup.Main.main(opciones);
        } catch (Exception e) {
            System.out.print(e);
        }
    }
    
    public static void generadorFlexI() {
        JFlex.Main.generate(new File(
                "src" + File.separator + "Intermedio"
                + File.separator + "Lexico.jlex"));
    }
    
    public static void generadorCupI() {
        String opciones[] = new String[5];
        opciones[0] = "-destdir";
        opciones[1] = "src"
                + File.separator
                + "Intermedio";
        opciones[2] = "-parser";
        opciones[3] = "parser";
        opciones[4] = "src"
                + File.separator
                + "Intermedio"
                + File.separator
                + "Sintactico.cup";
        try {
            java_cup.Main.main(opciones);
        } catch (Exception e) {
            System.out.print(e);
        }
    }
}
