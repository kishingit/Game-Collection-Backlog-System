package com.gamelog.model;

public class Game {
    private int id;
    private int userId;
    private String title;
    private String platform;
    private String status;

    public Game() {}

    public Game(int userId, String title, String platform, String status) {
        this.userId = userId;
        this.title = title;
        this.platform = platform;
        this.status = status;
    }

    public Game(int id, int userId, String title, String platform, String status) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.platform = platform;
        this.status = status;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getPlatform() { return platform; }
    public void setPlatform(String platform) { this.platform = platform; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
