/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author David Abraham
 */
import java.util.Vector;

public class Lista {

	Vector lista;

	public Lista() {
		lista = new Vector();
	}

	public void addCadena(String c) {
		lista.addElement(c);
	}

	public String getCadena(int i) {
		return(String)lista.elementAt(i);
	}

	public int size() {
		return lista.size();
	}
}