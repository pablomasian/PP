();; (*unit = ()*)

2 + 5 * 3;; (*int = 17*)

1.25 *. 2.0;; (*float = 2.5*)

(*2 - 2.0;;*) (*error, float en vez de int*)

(*3.0 + 2.0;;*) (*error: esta expresión es de tipo float, pero debería ser de tipo int*)

5/3;; (*int = 1*)

5 mod 3;; (*int = 2*)

2.0 *. 3.0 ** 2.0;; (*float = 18*)

2.0 ** 3.0 ** 2.0;; (*float = 512*)

sqrt;; (*float -> float = <fun>*)

(*sqrt 4;;*) (*error: esta expresión es de tipo int, pero debería ser de tipo float*)

int_of_float;; (*float -> int = <fun>*)

float_of_int;; (*int -> float = <fun>*)

3.0 = float_of_int 3;; (*bool = true*)

(*int_of_float -2.9;;*) (*error: esta expresión es de tipo float->int, pero debería ser de tipo int*)

int_of_float 2.1 + int_of_float (-2.9);; (*int = 0*)

truncate;; (*float -> int = <fun>*)

truncate 2.1 + truncate (-2.9);; (*int = 0*)

floor;; (*float -> float = <fun>*)

floor 2.1 +. floor (-2.9);; (*float = -1*)

ceil;; (*float -> float = <fun>*)

ceil 2.1 +. ceil (-2.9);; (*float = 1*)

int_of_char;; (*char -> int = <fun>*)

int_of_char 'A';; (*int = 65, A en ascii*)

char_of_int;; (*int -> char = <fun>*)

char_of_int 66;; (*El caracter ascii nº 66, char = 'B'*)

Char.code;; (*char -> int = <fun>*)

Char.code 'B';; (*int = 66, B en ascii*)

Char.chr;; (*int -> char = <fun>*)

Char.chr 67;; (*El caracter ascii nº 67*)

'\067';; (*El caracter ascii nº 67, char = 'C'*)

Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'M');; (*char = 'm'*)

Char.lowercase_ascii;; (*char -> char = <fun>*)

Char.lowercase_ascii 'M';; (*char = 'm'*)

Char.uppercase_ascii;; (*char -> char = <fun>*)

Char.uppercase_ascii 'm';; (*char = 'M'*)

"this is  a string";; (*string = "this is a string"*)

String.length;; (*string -> int = <fun>*)

String.length "longitud";; (*int = 8*)

(*"1999"+"1";;*) (*error: esta expresión es de tipo string, pero debería ser de tipo int*)

"1999" ^"1";; (*string = "19991"*)

int_of_string;; (*string -> int = <fun>*)

int_of_string "1999" +1;; (*int = 2000*)

"\065\066";; (*los caracteres ascii 065 y 066, string = "AB"*)

string_of_int;; (*int -> string = <fun>*)

string_of_int 010;; (*string = "10"*)

not true;; (*bool = false*)

true && false;; (*bool = false*)

true || false;; (*bool = true*)

(1 < 2) = false;; (*bool = false*)

"1" < "2";; (*bool = true*)

2<12;; (*bool = true*)

"2"<"12";; (*bool = false*)

"uno"<"dos";; (*bool = false*)

if 3=4 then 0 else 4;; (*int = 4*)

if 3=4 then "0" else"4";; (*string = "4"*)

(*if 3=4 then 0 else "4";;*) (*error: esta expresión es de tipo string, pero debería ser de tipo int*)

(if 3 < 5 then 8 else 10) + 4;; (*int = 12*)

