package models;

import entities.Auth;

public class AuthModel extends ModelBase<Auth> {

    public AuthModel() throws Exception {
        super(Auth.class);
    }

    public boolean isAdmin(Long id) {
        try {
            return get(id).isAdmin();
        } catch (Exception e) {
            return false;
        }
    }
}
