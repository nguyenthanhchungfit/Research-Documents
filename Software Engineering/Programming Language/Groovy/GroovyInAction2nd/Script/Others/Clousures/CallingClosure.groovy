def code = { 123 }
assert code() == 123

assert code.call() == 123 // explicit

def isOdd = { int i -> i%2 != 0 }                           
assert isOdd(3) == true                                     
assert isOdd.call(2) == false                               

def isEven = { it%2 == 0 }                                  
assert isEven(3) == false                                   
assert isEven.call(2) == true     