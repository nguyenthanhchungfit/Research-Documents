def http = [ 
 100 : 'CONTINUE', 
 200 : 'OK', 
 400 : 'BAD REQUEST' 
] 
assert http[200] == 'OK' 
assert http.size() == 3
http[500] = 'INTERNAL SERVER ERROR' 
assert http.size() == 4 