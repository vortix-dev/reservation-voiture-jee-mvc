package dao;

import model.Voiture;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VoitureDAO {

    public void addVoiture(Voiture voiture) {
        String query = "INSERT INTO voitures (img, marque, modele, prix, disponible) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, voiture.getImg());
            statement.setString(2, voiture.getMarque());
            statement.setString(3, voiture.getModele());
            statement.setBigDecimal(4, voiture.getPrix());
            statement.setBoolean(5, voiture.isDisponible());
            
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Voiture> getAllVoitures() {
        List<Voiture> voitures = new ArrayList<>();
        String query = "SELECT * FROM voitures";
        
        try (Connection connection = DBConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            
            while (resultSet.next()) {
                Voiture voiture = new Voiture();
                voiture.setIdVoiture(resultSet.getInt("idVoiture"));
                voiture.setImg(resultSet.getString("img"));
                voiture.setMarque(resultSet.getString("marque"));
                voiture.setModele(resultSet.getString("modele"));
                voiture.setPrix(resultSet.getBigDecimal("prix"));
                voiture.setDisponible(resultSet.getBoolean("disponible"));
                
                voitures.add(voiture);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return voitures;
    }

    public Voiture getVoitureById(int id) {
        Voiture voiture = null;
        String query = "SELECT * FROM voitures WHERE idVoiture = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                voiture = new Voiture();
                voiture.setIdVoiture(resultSet.getInt("idVoiture"));
                voiture.setImg(resultSet.getString("img"));
                voiture.setMarque(resultSet.getString("marque"));
                voiture.setModele(resultSet.getString("modele"));
                voiture.setPrix(resultSet.getBigDecimal("prix"));
                voiture.setDisponible(resultSet.getBoolean("disponible"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return voiture;
    }

    public void updateVoiture(Voiture voiture) {
        String query = "UPDATE voitures SET img = ?, marque = ?, modele = ?, prix = ?, disponible = ? WHERE idVoiture = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, voiture.getImg());
            statement.setString(2, voiture.getMarque());
            statement.setString(3, voiture.getModele());
            statement.setBigDecimal(4, voiture.getPrix());
            statement.setBoolean(5, voiture.isDisponible());
            statement.setInt(6, voiture.getIdVoiture());
            
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteVoiture(int id) {
        String query = "DELETE FROM voitures WHERE idVoiture = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
