package dao;

import model.Admin;
import util.DBConnection;

import java.sql.*;

public class AdminDAO {

    public Admin getAdminByUsernameAndPassword(String username, String password) {
        Admin admin = null;
        String query = "SELECT * FROM admin WHERE username = ? AND password = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                admin = new Admin();
                admin.setIdAdmin(resultSet.getInt("idAdmin"));
                admin.setUsername(resultSet.getString("username"));
                admin.setPassword(resultSet.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return admin;
    }
}
