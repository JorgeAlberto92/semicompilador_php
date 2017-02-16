/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author David Abraham
 */
public class Simbolo {

	private int cod;
	private String id;
	private int direccion;

	public Simbolo() {
		cod = -1;
		id = "";
	}

	public Simbolo(int c, String i) {
		cod = c;
		id = i;
	}

	public void setCod(int c) {
		cod = c;
	}

	public void setId(String i) {
		id = i;
	}

	public int getCod() {
		return cod;
	}

	public String getId() {
		return id;
	}

	public void setDireccion(int d) {
		direccion = d;
	}

	public int getDireccion() {
		return direccion;
	}
}