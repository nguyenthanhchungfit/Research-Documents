// class SimpleUnitTest extends GroovyTestCase {
//  void testSimple() {
//     assertEquals("Groovy should add correctly", 2, 1 + 1)
//  }
// }

import org.junit.Test
import static org.junit.Assert.assertEquals
class SimpleUnitTest {
  @Test
  void shouldAdd() {
    assertEquals("Groovy should add correctly", 3, 1 + 1)
  }
}