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

public class Pila {

	Vector pila;

	public Pila() {
		pila = new Vector();
	}

	public void apilar(int n) {
		pila.addElement(new Integer(n));
	}

	public int desapilar() {
		int retorno = ((Integer)pila.lastElement()).intValue();
		pila.removeElementAt(pila.size()-1);
		return retorno;
	}

	public int verCima() {
		return ((Integer)pila.lastElement()).intValue();
	}
}
