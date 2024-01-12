let rec qsort1 ord = function
[] -> []
| h::t -> let after, before = List.partition (ord h) t in
qsort1 ord before @ h :: qsort1 ord after;;

(* Complicaciones con ordenaciones aleatorias  *)

let rec qsort2 ord =
  let append' l1 l2 = List.rev_append (List.rev l1) l2 in
  function
    [] -> []
  | h::t -> let after, before = List.partition (ord h) t in
            append' (qsort2 ord before) (h :: qsort2 ord after);;

(* qsort2 es más lento cuando la lista no está ya ordenada  
   	- Ha sido más lento casi el 100% de las veces
   en caso de que ya esté ordenada o sea necesario ordenar tamaños muy grandes,
   qsort2 es más rápido *)

let init n f =
  let rec aux (i, l) =
    if i = n
      then l
    else aux(i + 1, f i::l)
  in List.rev(aux(0, []));;

let l1 = init 600000 (function x -> Random.int 5000);;
