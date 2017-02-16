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

public class Tabla {

	private Vector tablaSimbolos;
	private Vector tablaTipos;

	public Tabla() {
		tablaSimbolos = new Vector();
		tablaTipos = new Vector();
		addTipo("int");
	}

	public void addSimbolo(String id) {
		tablaSimbolos.add(new Simbolo(countSimbolos(),id));
	}

	public void addTipo(String id) {
		tablaTipos.add(new Tipo(countTipos(),id));
	}

	public int countSimbolos() {
		return tablaSimbolos.size();
	}

	public int countTipos() {
		return tablaTipos.size();
	}

	public Simbolo getSimbolo(int pos) {
		return (Simbolo)tablaSimbolos.elementAt(pos);
	}

	public Tipo getTipo(int pos) {
		return (Tipo)tablaTipos.elementAt(pos);
	}

	public Simbolo getSimbolo(String id) {
		Simbolo simbolo = null;
		for(int i=0;i<countSimbolos();i++) {
			simbolo = getSimbolo(i);
			if(simbolo.getId().equals(id)) {
				break;
			} else {
				simbolo = null;
			}
		}
		return simbolo;
	}

	public Tipo getTipo(String id) {
		Tipo tipo = null;
		for(int i=0;i<countTipos();i++) {
			tipo = getTipo(i);
			if(tipo.getId().equals(id)) {
				break;
			} else {
				tipo = null;
			}
		}
		return tipo;
	}

	public boolean existeSimbolo(String id) {
		if(getSimbolo(id)!=null) {
			return true;
		} else {
			return false;
		}
	}

	public boolean existeTipo(String id) {
		if(getTipo(id)!=null) {
			return true;
		} else {
			return false;
		}
	}	

	public void setSimbolo(Simbolo s) {
		int cod = s.getCod();
		tablaSimbolos.setElementAt(s,cod);
	}

	public void setDireccionSimbolo(String id,int d) {
		Simbolo simbolo = getSimbolo(id);
		simbolo.setDireccion(d);
		setSimbolo(simbolo);
	}
}
