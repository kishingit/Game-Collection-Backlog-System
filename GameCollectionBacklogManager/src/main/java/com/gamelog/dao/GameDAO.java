package com.gamelog.dao;

import com.gamelog.model.Game;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GameDAO {

    public boolean addGame(Game game) {
        String sql = "INSERT INTO games (user_id, title, platform, status) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, game.getUserId());
            stmt.setString(2, game.getTitle());
            stmt.setString(3, game.getPlatform());
            stmt.setString(4, game.getStatus());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Add Game Error: " + e.getMessage());
            return false;
        }
    }

    public List<Game> getGamesByUserId(int userId) {
        List<Game> list = new ArrayList<>();
        String sql = "SELECT * FROM games WHERE user_id = ? ORDER BY id DESC";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Game(
                    rs.getInt("id"),
                    rs.getInt("user_id"),
                    rs.getString("title"),
                    rs.getString("platform"),
                    rs.getString("status")
                ));
            }
        } catch (SQLException e) {
            System.err.println("Get Games Error: " + e.getMessage());
        }
        return list;
    }
}
