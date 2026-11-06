package com.gamelog.service;

import com.gamelog.exception.InvalidInputException;

public interface UserOperations {
    boolean validateUser(String username, String password) throws InvalidInputException;
    boolean login(String username, String password);
}
