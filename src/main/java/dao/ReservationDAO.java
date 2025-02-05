package dao;

import model.Reservation;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {

    public void addReservation(Reservation reservation) {
        String query = "INSERT INTO reservations (idClient, idVoiture, dateReservation) VALUES (?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, reservation.getIdClient());
            statement.setInt(2, reservation.getIdVoiture());
            statement.setDate(3, reservation.getDateReservation());

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Réservation ajoutée avec succès.");
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de l'ajout de la réservation : " + e.getMessage());
            e.printStackTrace();
        }
    }

    public List<Reservation> getAllReservations() {
        List<Reservation> reservations = new ArrayList<>();
        String query = "SELECT r.idReservation, r.dateReservation, r.statut, " +
                       "c.nom, c.prenom, " +
                       "v.marque, v.modele, v.img " +
                       "FROM reservations r " +
                       "JOIN clients c ON r.idClient = c.idClient " +
                       "JOIN voitures v ON r.idVoiture = v.idVoiture";

        try (Connection connection = DBConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            
            while (resultSet.next()) {
                Reservation reservation = new Reservation();
                reservation.setIdReservation(resultSet.getInt("idReservation"));
                reservation.setDateReservation(resultSet.getDate("dateReservation"));
                reservation.setStatut(resultSet.getString("statut"));

                reservation.setNomClient(resultSet.getString("nom") + " " + resultSet.getString("prenom"));

                reservation.setMarqueVoiture(resultSet.getString("marque") + " " + resultSet.getString("modele"));
                reservation.setImg(resultSet.getString("img"));

                reservations.add(reservation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return reservations;
    }


    	public List<Reservation> getReservationById(int idClient) {
    	    List<Reservation> reservations = new ArrayList<>();
    	    String query = "SELECT r.idReservation, r.dateReservation, r.statut, " +
    	                   "v.marque, v.modele, v.img " +
    	                   "FROM reservations r " +
    	                   "JOIN voitures v ON r.idVoiture = v.idVoiture " +
    	                   "WHERE r.idClient = ?";

    	    try (Connection connection = DBConnection.getConnection();
    	         PreparedStatement statement = connection.prepareStatement(query)) {

    	        statement.setInt(1, idClient);
    	        try (ResultSet resultSet = statement.executeQuery()) {
    	            while (resultSet.next()) {
    	                Reservation reservation = new Reservation();
    	                reservation.setIdReservation(resultSet.getInt("idReservation"));
    	                reservation.setDateReservation(resultSet.getDate("dateReservation"));
    	                reservation.setStatut(resultSet.getString("statut"));
    	                reservation.setMarqueVoiture(resultSet.getString("marque") + " " + resultSet.getString("modele"));
    	                reservation.setImg(resultSet.getString("img"));
    	                reservations.add(reservation);
    	            }
    	        }
    	    } catch (SQLException e) {
    	        System.err.println("Erreur lors de la récupération des réservations : " + e.getMessage());
    	        e.printStackTrace();
    	    }

    	    return reservations;
    	}


    public void updateReservationStatus(int idReservation, String statut) {
        String query = "UPDATE reservations SET statut = ? WHERE idReservation = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, statut);
            statement.setInt(2, idReservation);

            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Statut mis à jour avec succès.");
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de la mise à jour du statut : " + e.getMessage());
            e.printStackTrace();
        }
    }


    public void deleteReservation(int id) {
        String query = "DELETE FROM reservations WHERE idReservation = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, id);

            int rowsDeleted = statement.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("Réservation supprimée avec succès.");
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de la suppression de la réservation : " + e.getMessage());
            e.printStackTrace();
        }
    }

    private Reservation mapReservation(ResultSet resultSet) throws SQLException {
        Reservation reservation = new Reservation();
        reservation.setIdReservation(resultSet.getInt("idReservation"));
        reservation.setIdClient(resultSet.getInt("idClient"));
        reservation.setIdVoiture(resultSet.getInt("idVoiture"));
        reservation.setDateReservation(resultSet.getDate("dateReservation"));
        reservation.setStatut(resultSet.getString("statut"));
        return reservation;
    }
}
