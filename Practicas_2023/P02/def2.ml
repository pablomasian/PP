let p r = 2. *. 3.1415 *. r;;

let area r = 3.1415 *. r ** 2.0;;

let absf f = if f >= 0.0 then f else  -.f;;

let even e = if e mod 2 = 0 then true else false;;

let rec next3 x = if x mod 3 = 0 then x else next3 (x + 1);;

let is_a_letter c = (c >= 'a' && c <= 'z') || (c >= 'A' && c<= 'Z');;

let string_of_bool b = if b then "verdadero" else "falso";;
