package com.gamelog.app;

import com.gamelog.exception.InvalidInputException;
import com.gamelog.model.User;
import com.gamelog.service.UserService;
import com.gamelog.dao.UserDAO;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        UserService service = new UserService();
        UserDAO userDAO = new UserDAO();

        System.out.println("==================================================");
        System.out.println("   GAME BACKLOG MANAGER - CORE JAVA TEST APPLICATION ");
        System.out.println("==================================================");
        System.out.print("Enter Username : ");
        String username = sc.nextLine();
        System.out.print("Enter Password : ");
        String password = sc.nextLine();

        try {
            if (service.validateUser(username, password)) {
                User user = new User(username, password);
                System.out.println("\n[VALIDATION SUCCESS] Core Java validation passed!");
                user.displayUser();

                boolean isSaved = userDAO.registerUser(user);
                if (isSaved) {
                    System.out.println("[DB SUCCESS] User saved to MySQL database.");
                } else {
                    System.out.println("[DB NOTICE] MySQL connection skipped or duplicate entry.");
                }
            }
        } catch (InvalidInputException e) {
            System.out.println("\n[VALIDATION ERROR] " + e.getMessage());
        }

        sc.close();
    }
}
