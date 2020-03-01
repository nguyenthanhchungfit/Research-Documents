class CounterTest extends GroovyTestCase {
    private counter;
    void setUp(){
        counter = new Counter();
    }

    void testCounterWorks(){
        assertEquals(2, counter.biggerThan([5, 10, 15], 7))
    }

    private check(expectedCount, items, threshold) {
        assertEquals(expectedCount,
                        counter.biggerThan(items, threshold))
    }

    static final Integer[ ] NEG_NUMBERS = [-2, -3, -4]
    static final Integer[ ] POS_NUMBERS = [ 4, 5, 6]
    static final Integer[ ] MIXED_NUMBERS = [ 4, -6, 0]

    void testCountHowManyFromSampleNumbers () {
        check(2, NEG_NUMBERS, -4)
        check(2, POS_NUMBERS, 4)
        check(1, MIXED_NUMBERS, 0)
    }

    void testInputDataUnchanged() { 
        def numbers = NEG_NUMBERS.clone()
        def origLength = numbers.size()
        counter.biggerThan(numbers, 0 /* don't care */)
        assertLength origLength, numbers
        assertArrayEquals NEG_NUMBERS, numbers
    }

    void testCountHowManyFromSampleStrings() {
        check(2, ['Dog', 'Cat', 'Antelope'], 'Bird')
    }

    void testInputDataAssumptions() { 
        assertTrue NEG_NUMBERS.every { it < 0 }
        assertTrue POS_NUMBERS.every { it > 0 }
        assertContains 0, MIXED_NUMBERS
        int negCount = 0
        int posCount = 0
        MIXED_NUMBERS.each {
            if (it < 0) 
                negCount++ 
            else if (it > 0) 
                posCount++
        }
        assert negCount && posCount
    } 
}