class HashmapTest extends GroovyTestCase{
    static final KEY = new Object()
    static final MAP = [key1: new Object(), key2: new Object()]

    void testHashMapRejectsNull() {
        shouldFail(NullPointerException) {
            new HashMap(null)
        }
    }

    void testHashtableRejectsNull() {
        shouldFail(NullPointerException) {
            new Hashtable()[KEY] = null
        }
    }
    
    void testBadInitialSize() {
        def msg = shouldFail(IllegalArgumentException) { 
            new HashMap(-1)
        }
        assertEquals "Illegal initial capacity: -1", msg 
    }
    
    void testHashMapAcceptsNull() {
        def myMap = new HashMap()
        myMap[KEY] = null
        assert myMap.keySet().contains(KEY)
    }

    void testHashMapReturnsOriginalObjects() {
        def myMap = new HashMap()
        MAP.entrySet().each {
            myMap[it] = MAP[it]
            assertSame MAP[it], myMap[it]
        }
        assert MAP.dump().contains('java.lang.Object') 
        assert myMap.size() == MAP.size()
    }
}

