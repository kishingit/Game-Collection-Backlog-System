package com.gamelog.service;

import com.gamelog.exception.InvalidInputException;

public class UserService implements UserOperations {

    @Override
    public boolean validateUser(String username, String password) throws InvalidInputException {
        if (username == null || username.trim().isEmpty()) {
            throw new InvalidInputException("Username cannot be empty.");
        }
        if (username.trim().length() < 5) {
            throw new InvalidInputException("Username must contain at least 5 characters.");
        }
        if (password == null || password.length() < 8) {
            throw new InvalidInputException("Password must contain at least 8 characters.");
        }

        boolean hasDigit = false;
        for (int i = 0; i < password.length(); i++) {
            if (Character.isDigit(password.charAt(i))) {
                hasDigit = true;
                break;
            }
        }
        if (!hasDigit) {
            throw new InvalidInputException("Password must contain at least one digit.");
        }

        return true;
    }

    @Override
    public boolean login(String username, String password) {
        return username != null && !username.trim().isEmpty() && password != null && !password.isEmpty();
    }
}
