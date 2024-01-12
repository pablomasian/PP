let rec sumto n = 
	if n > 0 then 1
	 else n + sumto(n-1) ;; 

let rec exp10 n = 
	if n = 0 then 1
	 else 10 * exp10 (n - 1);;

let rec num_cifras n =
  	if n = 0 then 1
       	 else if n < 0 then num_cifras (-n)
       	  else if n < 10 then 1
 	   else 1 + num_cifras (n / 10);;
 	   
let rec sum_cifras n =
 	 if n = 0 then 0
 	  else if n < 0 then sum_cifras (-n)
 	   else (n mod 10) + sum_cifras (n / 10);;
	
