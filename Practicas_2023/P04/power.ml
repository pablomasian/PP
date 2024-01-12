let rec power x n = 
    if n = 0 then 1 
    else x * power x (n-1);;

let rec power' x n = 
    if n = 0 then 1 
    else if (n mod 2 = 0) then power' (x*x) (n/2)
    else x * power' (x*x) (n/2);;

(*La función power' procesa menos operaciones porque reduce n a la mitad recursivamente.
Esto se notará con números de mayor tamaño, con int se salen de rango *)

let rec powerf x n = 
    if n = 0 then 1. 
    else if (n mod 2 = 0) then powerf (x*.x) (n/2)
    else x *. powerf (x*.x) (n/2);;
