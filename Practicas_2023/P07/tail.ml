(* tail.ml *)

let to0from n =
  let rec aux acc n =
    if n < 0 then acc
    else aux (n :: acc) (n - 1)
  in
  aux [] n

let fromto m n =
  let rec aux acc m =
    if m > n then acc
    else aux (m :: acc) (m + 1)
  in
  aux [] m

let remove x lst =
  List.fold_right (fun h acc -> if h = x then acc else h :: acc) lst []

let compress lst =
  let rec aux acc = function
    | h1 :: h2 :: t when h1 = h2 -> aux acc (h2 :: t)
    | h :: t -> aux (h :: acc) t
    | l -> List.rev acc @ l
  in
  aux [] lst

let append' = List.rev_append

let map' f lst =
  List.rev (List.rev_map f lst)

let fold_right' f lst acc =
  List.fold_left (fun acc' x -> f x acc') acc (List.rev lst)

let incseg lst =
  List.fold_left (fun acc x -> List.rev_append (List.map ((+) x) acc) (x :: acc)) [] (List.rev lst)

