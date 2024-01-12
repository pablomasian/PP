let rec insert x = function
[] -> [x]
| h::t -> if x <= h then x :: h :: t
else h :: insert x t


let rec isort = function
[] -> []
| h::t -> insert h (isort t)

(*no son terminales*)

let rec bigl_generator acc n =
  if n <= 0 then acc
  else bigl_generator (Random.int 1000000 :: acc) (n - 1)

let bigl : int list = bigl_generator [] 700000

(* isort provoca stack overflow con bigl*)



let insert_t x lst =
  let rec insert_acc acc = function
    | [] -> List.rev (x :: acc)
    | h::t -> if x <= h then List.rev_append acc (x :: h :: t)
              else insert_acc (h :: acc) t
  in insert_acc [] lst

let isort_t lst =
  let rec isort_acc acc = function
    | [] -> List.rev acc
    | h::t -> isort_acc (insert_t h acc) t
  in isort_acc [] lst
  
(*si son terminales*)



let rec rlist n =
  if n <= 0 then []
  else Random.int 100 :: rlist (n - 1)

(*genera lista aleatoria*)



let crono f x =
  let t = Sys.time () in
  let _ = f x in
  Sys.time () -. t
  
(*funcion para comprobar como crece el tiempo de ejecucion*)

let lc1 = List.init 10000 (fun x -> x) 
  let lc2 = List.init 20000 (fun x -> x) 
  let ld1 = List.init 10000 (fun x -> 10000 - x - 1) 
  let ld2 = List.init 20000 (fun x -> 20000 - x - 1) 
  let lr1 = List.init 10000 (fun _ -> Random.int 10000) 
  let lr2 = List.init 20000 (fun _ -> Random.int 20000)
  
  
  
(* El tiempo de ejecución de isort puede aumentar al duplicar el tamaño de la lista debido a la complejidad cuadrática del algoritmo de ordenación por inserción.
Lo que lleva a un aumento del tiempo de ejecución proporcional al cuadrado del tamaño de la lista. Este comportamiento es más evidente en listas aleatorias o desordenadas *)


(*El tiempo de ejecución de isort_t debería ser más estable en listas grandes debido a ser recursiva terminal, mientras que isort puede experimentar un desbordamiento de pila en listas muy grandes.*)

let rec insert_g cmp x lst =
  match lst with
  | [] -> [x]
  | h::t -> if cmp x h then x :: h :: t else h :: insert_g cmp x t

let rec isort_g cmp lst =
  match lst with
  | [] -> []
  | h::t -> insert_g cmp h (isort_g cmp t)


let rec split l = match l with
h1::h2::t -> let t1, t2 = split t
in h1::t1, h2::t2
| _ -> l, []


let rec merge (l1,l2) = match l1, l2 with
[], l | l, [] -> l
| h1::t1, h2::t2 -> if h1 <= h2 then h1 :: merge (t1, l2)
else h2 :: merge (l1, t2)


let rec msort l = match l with
[] | [_] -> l
| _ -> let l1, l2 = split l
in merge (msort l1, msort l2)

(*no son terminales*)



let rec bigl2_generator acc n =
  if n <= 0 then acc
  else bigl2_generator (Random.int 1000000 :: acc) (n - 1)

let bigl2 : int list = bigl2_generator [] 700000

(* msort provoca stack overflow con bigl2*)




let split_t lst =
  let rec split_acc acc1 acc2 = function
    | [] -> (List.rev acc1, List.rev acc2)
    | h1::h2::t -> split_acc (h1::acc1) (h2::acc2) t
    | [x] -> (List.rev (x::acc1), List.rev acc2)
  in
  split_acc [] [] lst

let merge_t (lst1, lst2) =
  let rec merge_acc acc l1 l2 =
    match l1, l2 with
    | [], l | l, [] -> List.rev_append acc l
    | h1::t1, h2::t2 ->
        if h1 <= h2 then merge_acc (h1 :: acc) t1 l2
        else merge_acc (h2 :: acc) l1 t2
  in
  merge_acc [] lst1 lst2
  
(*son terminales*)


let rec msort' lst =
  match lst with
  | [] | [_] -> lst
  | _ ->
      let lst1, lst2 = split_t lst in
      merge_t (msort' lst1, msort' lst2)
      
(*nueva version del anterior msort que no provoca stack overflow con bigl2*)


  let bigl3 : int list = []
(*msort' en bigl3 no provoca stack overflow debido al uso de split_t y merge_t. Esto permite que el compilador realice optimizaciones
y evite el desbordamiento de pila en algunos casos.*)


(*En general, msort' parece tener tiempos de ejecución ligeramente más largos que msort.
Las diferencias son más notables en las listas desordenadas (lr1 y lr2). msort' toma más tiempo.*)


(*En lr1, msort' toma más tiempo que msort, pero la diferencia no es significativa.
En lr2, msort' toma más tiempo que msort, y la diferencia es más pronunciada. Esto podría deberse a las características particulares de la lista y cómo split_t y merge_t manejan las subdivisiones y fusiones.
*)


let rec msort_g cmp lst =
  let rec split_t acc1 acc2 = function
    | [] -> (List.rev acc1, List.rev acc2)
    | h1::h2::t -> split_t (h1::acc1) (h2::acc2) t
    | [x] -> (List.rev (x::acc1), List.rev acc2)
  in

  let rec merge_t l1 l2 =
    match l1, l2 with
    | [], l | l, [] -> l
    | h1::t1, h2::t2 ->
        if cmp h1 h2 then h1 :: merge_t t1 l2
        else h2 :: merge_t l1 t2
  in

  match lst with
  | [] | [_] -> lst
  | _ ->
      let lst1, lst2 = split_t [] [] lst in
      merge_t (msort_g cmp lst1) (msort_g cmp lst2)


      
      

