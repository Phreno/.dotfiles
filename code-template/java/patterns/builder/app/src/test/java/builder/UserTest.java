/*
 * This Java source file was generated by the Gradle 'init' task.
 */
package builder;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;

import org.junit.jupiter.api.Test;

import builder.model.User;

class UserTest {
    @Test
    void doit_AvoirUnAttribut_balance() throws SecurityException, NoSuchMethodException {
        assertDoesNotThrow(() -> User.class.getDeclaredMethod("getBalance"));
        assertDoesNotThrow(() -> User.class.getDeclaredMethod("setBalance", String.class));
    }

    @Test
    void doiAvoirUnAttribut_picture() {
        assertDoesNotThrow(() -> User.class.getDeclaredMethod("getPicture"));
        assertDoesNotThrow(() -> User.class.getDeclaredMethod("setPicture", String.class));
    }

    @Test
    void doiAvoirUnAttribut_age() {
        assertDoesNotThrow(() -> User.class.getDeclaredMethod("getAge"));
        assertDoesNotThrow(() -> User.class.getDeclaredMethod("setAge", String.class));
    }

    @Test
    void doiAvoirUnAttribut_name() {
        assertDoesNotThrow(() -> User.class.getDeclaredMethod("getName"));
        assertDoesNotThrow(() -> User.class.getDeclaredMethod("setName", String.class));
    }

    @Test
    void doiAvoirUnAttribut_gender() {
        assertDoesNotThrow(() -> User.class.getDeclaredMethod("getGender"));
        assertDoesNotThrow(() -> User.class.getDeclaredMethod("setGender", String.class));
    }

    @Test
    void doiAvoirUnAttribut_company() {
        assertDoesNotThrow(() -> User.class.getDeclaredMethod("getCompany"));
        assertDoesNotThrow(() -> User.class.getDeclaredMethod("setCompany", String.class));
    }

    @Test
    void doiAvoirUnAttribut_email() {
        assertDoesNotThrow(() -> User.class.getDeclaredMethod("getEmail"));
        assertDoesNotThrow(() -> User.class.getDeclaredMethod("setEmail", String.class));
    }
}