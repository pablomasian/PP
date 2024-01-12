let rec divide l = match l with
    h1::h2::t -> let t1, t2 = divide t in (h1::t1, h2::t2)
  | _ -> l, [];;

 let rec merge = function
      [], l | l, [] -> l
    | h1::t1, h2::t2 -> if h1 <= h2 then h1 :: merge (t1, h2::t2)
                        else h2 :: merge (h1::t1, t2);; 
let rec msort1 l = match l with
   [] | _::[] -> l
   | _ -> let l1, l2 = divide l in
          merge (msort1 l1, msort1 l2);;

(* No terminal: una implementación no terminal puede terminar 
   en un Stack Overflow *)

let l2  = List.init 500000 (function x -> Random.int 1000);;

(* --------------- IMPLEMENTACIÓN TERMINAL ----------------- *)

let divide' l =
  let rec aux dvd1 dvd2 = function
      [] -> (List.rev dvd1, List.rev dvd2)
    | h::[] -> (List.rev (h::dvd1), List.rev dvd2)
    | h1::h2::t -> aux (h1::dvd1) (h2::dvd2) t
  in aux [] [] l;;

let merge' ord (l1, l2) =
  let rec aux (a1, a2) mer = match a1, a2 with
      [], l | l, [] -> List.rev_append mer l
    | h1::t1, h2::t2 -> if ord h1 h2 then aux (t1, h2::t2) (h1::mer)
                        else aux (h1::t1, t2) (h2::mer)
  in aux (l1, l2) [];;

let rec msort2 ord l = match l with
    [] | _::[] -> l
  | _ -> let l1, l2 = divide' l
         in merge' ord (msort2 ord l1, msort2 ord l2);;

(* los tres algoritmos msort1, msort2 y qsort2 tienen velocidades muy similares entre
   0.014s y 0.035s para ordenar una lista de 10000 elementos aleatorios.
   Las mediciones las hice con la función time indicada abajo, encontré mucha variación
   entre ellas, por eso indico un rango y no una media de las mediciónes. *)
