import com.diabolo.api.PathHandler;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.lang.reflect.Method;

import static org.junit.jupiter.api.Assertions.assertEquals;

@DisplayName("Test params method in PathHandler class")
class ParamsTest {
    /**
     * Test using reflection to access the private method
     */
    @Test
    @DisplayName("Should return empty string for \"path/even/more/arg\"")
    void paramsNone() {
        try {
            Method method = PathHandler.class.getDeclaredMethod("params", String.class);
            method.setAccessible(true);
            String test = (String)method.invoke(PathHandler.class.getDeclaredConstructor().newInstance(),
                    "path/even/more/arg");
            assertEquals("", test);
        } catch (Exception ex) {}
    }

    @Test
    @DisplayName("Should return \"arg\" for \"path/even/more/{arg}\"")
    void paramsOne() {
        try {
            Method method = PathHandler.class.getDeclaredMethod("params", String.class);
            method.setAccessible(true);
            String test = (String)method.invoke(PathHandler.class.getDeclaredConstructor().newInstance(),
                    "path/even/more/{arg}");
            assertEquals("arg", test);
        } catch (Exception ex) {}
    }
}
