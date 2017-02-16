/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author David Abraham
 */
public class Tipo {

	private int cod;
	private String id;

	public Tipo() {
		cod = -1;
		id = "";
	}

	public Tipo(int c, String i) {
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
}
    