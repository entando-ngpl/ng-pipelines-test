package org.entando;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

@Tag("slow-test")
class KarateDojoITTest {

    @Test
    void miyagiDoIT() {
        assertEquals("Nice bonsai", new KarateDojo().miyagiDo());
    }

    @Test
    void kobraKaiIT() {
        assertEquals("Never Dies", new KarateDojo().kobraKai());
    }
}
