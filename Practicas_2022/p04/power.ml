let rec power x y = 
    if y = 0 then 1 
    else x * power x (y-1);;

let rec power' x y = 
    if y = 0 then 1 
    else if (n mod 2 = 0) then power' (x*x) (y/2)
    else x * power' (x*x) (y/2);;

(*La función power' procesa menos operaciones porque reduce n a la mitad recursivamente.
Esto se notará con números de mayor tamaño, con int se salen de rango *)

let rec powerf x y = 
    if n = 0 then 1. 
    else if (n mod 2 = 0) then powerf (x*.x) (y/2)
    else x *. powerf (x*.x) (y/2);;
