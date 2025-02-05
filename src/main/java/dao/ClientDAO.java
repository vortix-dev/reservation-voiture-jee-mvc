package dao;

import model.Client;
import util.DBConnection;

import java.sql.*;

public class ClientDAO {

    public Client getClientByEmailAndPassword(String email, String password) {
        Client client = null;
        String query = "SELECT * FROM clients WHERE email = ? AND motDePasse = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                client = new Client();
                client.setIdClient(resultSet.getInt("idClient"));
                client.setNom(resultSet.getString("nom"));
                client.setPrenom(resultSet.getString("prenom"));
                client.setEmail(resultSet.getString("email"));
                client.setMotDePasse(resultSet.getString("motDePasse"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return client;
    }

    public void addClient(Client client) {
        String query = "INSERT INTO clients (nom, prenom, email, motDePasse) VALUES (?, ?, ?, ?)";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setString(1, client.getNom());
            statement.setString(2, client.getPrenom());
            statement.setString(3, client.getEmail());
            statement.setString(4, client.getMotDePasse());
            
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
  
}
