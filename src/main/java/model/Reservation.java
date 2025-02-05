package model;

import java.sql.Date;

public class Reservation {
    private int idReservation;
    private int idClient;
    private int idVoiture;
    private Date dateReservation;
    private String statut;

    // بيانات إضافية لعرض الطلبات
    private String nomClient;
    private String marqueVoiture;
    private String modeleVoiture;
    private String img;

    public Reservation() {
    }

	public Reservation(int idClient, int idVoiture, Date dateReservation, String statut) {
		super();
		this.idClient = idClient;
		this.idVoiture = idVoiture;
		this.dateReservation = dateReservation;
		this.statut = statut;
	}



	public int getIdReservation() {
        return idReservation;
    }

    public void setIdReservation(int idReservation) {
        this.idReservation = idReservation;
    }

    public int getIdClient() {
        return idClient;
    }

    public void setIdClient(int idClient) {
        this.idClient = idClient;
    }

    public int getIdVoiture() {
        return idVoiture;
    }

    public void setIdVoiture(int idVoiture) {
        this.idVoiture = idVoiture;
    }

    public Date getDateReservation() {
        return dateReservation;
    }

    public void setDateReservation(Date dateReservation) {
        this.dateReservation = dateReservation;
    }

    public String getStatut() {
        return statut;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }

    public String getNomClient() {
        return nomClient;
    }

    public void setNomClient(String nomClient) {
        this.nomClient = nomClient;
    }

    public String getMarqueVoiture() {
        return marqueVoiture;
    }

    public void setMarqueVoiture(String marqueVoiture) {
        this.marqueVoiture = marqueVoiture;
    }

    public String getModeleVoiture() {
        return modeleVoiture;
    }

    public void setModeleVoiture(String modeleVoiture) {
        this.modeleVoiture = modeleVoiture;
    }

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

}
