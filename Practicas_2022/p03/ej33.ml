let g1 n = if (n >=0) then (if (n mod 2 = 0) then (true) else (false)) else (n mod 2 = -1);;

let g2 n = (function true -> ((function true -> true | false -> false) (n mod 2 = 0)) | false -> (n mod 2 = -1) )(n >= 0);;
