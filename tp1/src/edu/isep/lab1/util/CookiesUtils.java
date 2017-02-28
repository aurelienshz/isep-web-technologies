package edu.isep.lab1.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookiesUtils {
    private Cookie[] cookies;

    public CookiesUtils(HttpServletRequest request) {
        this.cookies = request.getCookies();
    }

    public Cookie find(String key) {
        for (Cookie c: this.cookies) {
            if (c.getName().equals(key)) {
                return c;
            }
        }
        return null;
    }
}
