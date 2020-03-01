// def x = 1
// def gs = "x = ${x}"
// assert gs == 'x = 1'

// x = 2
// assert gs == 'x = 2'

// def x = 1
// def gs = "x = ${-> x}"
// assert gs == 'x = 1'

// x = 2
// assert gs == 'x = 2'

// class Person {
//     String name
//     String toString() { name }          
// }
// def sam = new Person(name:'Sam')        
// def lucy = new Person(name:'Lucy')      
// def p = sam                             
// def gs = "Name: ${p}"                   
// assert gs == 'Name: Sam'                
// p = lucy                                
// assert gs == 'Name: Sam'                
// sam.name = 'Lucy'                       
// assert gs == 'Name: Lucy'

class Person {
    String name
    String toString() { name }
}
def sam = new Person(name:'Sam')
def lucy = new Person(name:'Lucy')
def p = sam
// Create a GString with lazy evaluation of "p"
def gs = "Name: ${-> p}"
assert gs == 'Name: Sam'
p = lucy
assert gs == 'Name: Lucy'