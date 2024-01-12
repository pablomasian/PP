let rec sum_cifras n =
	if n>0
	then n mod 10 + sum_cifras(n/10)
	else 0;;
	
let rec num_cifras n =
	if n<10
	then 1
	else 1+num_cifras(n/10);;
	
let rec exp10 n =
	if n=0
	then 1
	else 10 * exp10(n-1);;	

let rec reverse n =
	if n>0
	then n mod 10 * int_of_float(10. ** (float_of_int(num_cifras n) -. 1.)) + reverse (n/10)
	else 0;;
	
let rec palindromo n =
	if String.length n <= 1
	then true
	else(if int_of_char(n.[0]) == int_of_char(n.[String.length n - 1])
		then palindromo (String.sub n 1 (String.length(n)-2))
		else false);;

		
