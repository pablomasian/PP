let rec reverse n =
  if n < 10 then
    n
  else
    let last_digit = n mod 10 in
    let remaining_digits = n / 10 in
    let reversed_remaining = reverse remaining_digits in
    let num_digits = int_of_float (log10 (float_of_int remaining_digits)) + 1 in
    last_digit * int_of_float (10. ** float_of_int num_digits) + reversed_remaining
;;
	
	
let rec palindromo s =
	if String.length s <= 1
	then true
	else(if int_of_char(s.[0]) == int_of_char(s.[String.length s - 1])
		then palindromo (String.sub s 1 (String.length(s)-2))
		else false);;
		
let rec mcd (x, y) =
  if y = 0 then x
  else mcd ((x mod y), y);;
