let rec powmod m b e = 
    if e = 0 then 1
    else if e mod 2 = 0 then powmod m ((b mod m*b mod m)mod m) (e / 2) 
    else (b mod m * powmod m ((b mod m*b mod m)mod m) (e / 2) ) mod m;;
