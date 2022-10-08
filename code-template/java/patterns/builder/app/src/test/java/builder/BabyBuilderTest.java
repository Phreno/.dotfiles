/*
 * This Java source file was generated by the Gradle 'init' task.
 */
package builder;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class BabyBuilderTest {

    BabyBuilder builder;

    @BeforeEach
    void setup() {
        builder = new BabyBuilder();
    }

    @Test
    void doit_InstancierUn_UserBuilder() {
        assertTrue(builder instanceof UserBuilder);
    }

    @Test
    void doit_RecupererUnUtilisateurNonNullApres_build() {
        // given
        // when
        builder.build();
        // then
        assertNotNull(builder.get());
    }

    @Test
    void doit_RecupererUnUtilisateurNullSans_build() {
        // given
        // when
        // then
        assertNull(builder.get());
    }
}