package com.gamelog.servlet;

import com.gamelog.dao.UserDAO;
import com.gamelog.exception.InvalidInputException;
import com.gamelog.model.User;
import com.gamelog.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserService userService = new UserService();
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            userService.validateUser(username, password);

            if (userDAO.isUsernameTaken(username)) {
                request.setAttribute("error", "Username already exists. Please choose another.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            User newUser = new User(username, password);
            boolean success = userDAO.registerUser(newUser);

            if (success) {
                request.setAttribute("message", "Registration successful! Please log in.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Registration failed due to a server error.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (InvalidInputException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
