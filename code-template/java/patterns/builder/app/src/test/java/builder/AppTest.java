/*
 * This Java source file was generated by the Gradle 'init' task.
 */
package builder;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;

class AppTest {
    @Test void doit_PouvoirDemarrerApplication() {
        App app = new App();
        assertNotNull(app);
    }
}