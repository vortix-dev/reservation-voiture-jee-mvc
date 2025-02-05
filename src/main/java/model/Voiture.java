package model;

import java.math.BigDecimal;

public class Voiture {
    private int idVoiture;
    private String marque;
    private String modele;
    private BigDecimal prix;
    private boolean disponible;
    private String img;
    
    public Voiture() {
    }

    public Voiture(String marque, String modele, BigDecimal prix, boolean disponible, String img) {
		super();
		this.marque = marque;
		this.modele = modele;
		this.prix = prix;
		this.disponible = disponible;
		this.img = img;
	}







	public Voiture(int idVoiture, String marque, String modele, BigDecimal prix, boolean disponible, String img) {
		super();
		this.idVoiture = idVoiture;
		this.marque = marque;
		this.modele = modele;
		this.prix = prix;
		this.disponible = disponible;
		this.img = img;
	}







	public String getImg() {
		return img;
	}







	public void setImg(String img) {
		this.img = img;
	}







	public int getIdVoiture() {
        return idVoiture;
    }

    public void setIdVoiture(int idVoiture) {
        this.idVoiture = idVoiture;
    }

    public String getMarque() {
        return marque;
    }

    public void setMarque(String marque) {
        this.marque = marque;
    }

    public String getModele() {
        return modele;
    }

    public void setModele(String modele) {
        this.modele = modele;
    }

    public BigDecimal getPrix() {
        return prix;
    }

    public void setPrix(BigDecimal prix) {
        this.prix = prix;
    }

    public boolean isDisponible() {
        return disponible;
    }

    public void setDisponible(boolean disponible) {
        this.disponible = disponible;
    }
}
