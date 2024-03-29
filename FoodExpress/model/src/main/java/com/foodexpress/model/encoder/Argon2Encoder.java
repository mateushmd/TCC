package com.foodexpress.model.encoder;

import org.springframework.security.crypto.argon2.Argon2PasswordEncoder;


public class Argon2Encoder {
    private Argon2PasswordEncoder encoder;
    
    private static Argon2Encoder self = null;
    
    private Argon2Encoder() {
        encoder = new Argon2PasswordEncoder(32, 64, 1, 15 * 1024, 2);
    }
    
    public static Argon2Encoder getEncoder() {
        if(self == null)
            self = new Argon2Encoder();
        
        return self;
    }
    
    public String encode(String target) {
        return encoder.encode(target);
    }
    
    public boolean check(String target, String encoded) {
        return encoder.matches(target, encoded);
    }
}
