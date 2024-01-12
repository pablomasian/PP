(*val hd: 'a list -> 'a*)
let hd l =
  match l with
  | [] -> failwith "hd: empty list"
  | x :: _ -> x



(*val tl: 'a list -> 'a list*)
let tl l =
  match l with
  | [] -> failwith "tl: empty list"
  | _ :: rest -> rest



(*val length: 'a list -> int*) (*terminal*)
let length lst =
  let rec aux acc lst =
    match lst with
    | [] -> acc
    | _ :: rest -> aux (acc + 1) rest
  in
  aux 0 lst



(*val compare_lengths : 'a list -> 'b list -> int*) (*terminal*)
let compare_lengths lst1 lst2 =
  let rec compare_lengths_aux acc l1 l2 =
    match (l1, l2) with
    | ([], []) -> acc
    | ([], _) -> -List.length l2
    | (_, []) -> List.length l1
    | (_ :: rest1, _ :: rest2) -> compare_lengths_aux (acc + 1) rest1 rest2
  in
  compare_lengths_aux 0 lst1 lst2



(*val compare_length_with : 'a list -> int -> int*) (*terminal*)
let compare_length_with lst n =
  let rec compare_length_with_aux acc l remaining =
    match (l, remaining) with
    | ([], 0) -> acc
    | ([], _) -> acc - remaining
    | (_ :: rest, _) when remaining > 0 -> compare_length_with_aux (acc + 1) rest (remaining - 1)
    | (_, _) -> acc + List.length l
  in
  compare_length_with_aux 0 lst n




(*val init : int -> (int -> 'a) -> 'a list*) (*terminal*)
let init n f =
  if n < 0 then
    invalid_arg "init: negative length"
  else
    let rec init_aux acc i =
      if i < 0 then acc
      else init_aux ((f i) :: acc) (i - 1)
    in
    init_aux [] (n - 1)




(*val nth : 'a list -> int -> 'a*) (*terminal*)
let nth lst n =
  let rec nth_aux acc l =
    match l with
    | [] -> failwith "nth: list is too short"
    | x :: rest when acc = 0 -> x
    | _ :: rest -> nth_aux (acc - 1) rest
  in
  if n < 0 then
    invalid_arg "nth: negative index"
  else
    nth_aux n lst




(*val append : 'a list -> 'a list -> 'a list*) (* not tail recursive *)
let append l1 l2 =
  let rec aux acc lst =
    match lst with
    | [] -> acc
    | x :: rest -> aux (x :: acc) rest
  in
  aux l2 (List.rev_append [] l1)



(*val rev_append : 'a list -> 'a list -> 'a list*) (*terminal*)
let rev_append lst1 lst2 =
  let rec rev_append_aux acc l =
    match l with
    | [] -> lst2 @ acc
    | x :: rest -> rev_append_aux (x :: acc) rest
  in
  rev_append_aux [] lst1




(*val rev : 'a list -> 'a list*) (*terminal*)
let rev lst =
  let rec rev_aux acc l =
    match l with
    | [] -> acc
    | x :: rest -> rev_aux (x :: acc) rest
  in
  rev_aux [] lst




(*val concat : 'a list list -> 'a list*) (* not tail recursive *)
let concat lsts =
  let rec concat_aux acc lsts =
    match lsts with
    | [] -> List.rev acc
    | hd :: tl -> concat_aux (List.rev_append hd acc) tl
  in
  concat_aux [] lsts




(*val flatten : 'a list list -> 'a list*) (* not tail recursive *)
let flatten lsts =
  let rec flatten_aux acc lsts =
    match lsts with
    | [] -> List.rev acc
    | hd :: tl -> flatten_aux (List.rev_append hd acc) tl
  in
  flatten_aux [] lsts




(*val split : ('a * 'b) list -> 'a list * 'b list*) (* not tail recursive *)
let split lst =
  let rec split_aux acc1 acc2 lst =
    match lst with
    | [] -> (List.rev acc1, List.rev acc2)
    | (x, y) :: tl -> split_aux (x :: acc1) (y :: acc2) tl
  in
  split_aux [] [] lst




(*val combine : 'a list -> 'b list -> ('a * 'b) list*) (* not tail recursive *)
let combine lst1 lst2 =
  let rec combine_aux acc l1 l2 =
    match (l1, l2) with
    | ([], []) -> List.rev acc
    | (x1 :: rest1, x2 :: rest2) -> combine_aux ((x1, x2) :: acc) rest1 rest2
    | _ -> failwith "combine: lists have different lengths"
  in
  combine_aux [] lst1 lst2




(*val map : ('a -> 'b) -> 'a list -> 'b list*) (* not tail recursive *)
let map f lst =
  let rec map_aux acc l =
    match l with
    | [] -> List.rev acc
    | x :: rest -> map_aux (f x :: acc) rest
  in
  map_aux [] lst




(*val map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list*) (* not tail recursive *)
let map2 f lst1 lst2 =
  let rec map2_aux acc l1 l2 =
    match (l1, l2) with
    | ([], []) -> List.rev acc
    | (x1 :: rest1, x2 :: rest2) -> map2_aux (f x1 x2 :: acc) rest1 rest2
    | _ -> failwith "map2: lists have different lengths"
  in
  map2_aux [] lst1 lst2




(*val rev_map : ('a -> 'b) -> 'a list -> 'b list*) (*terminal*)
let rev_map f lst =
  let rec rev_map_aux acc l =
    match l with
    | [] -> acc
    | x :: rest -> rev_map_aux (f x :: acc) rest
  in
  List.rev (rev_map_aux [] lst)




(*val for_all : ('a -> bool) -> 'a list -> bool*) (*terminal*)
let for_all p lst =
  let rec for_all_aux l =
    match l with
    | [] -> true
    | x :: rest -> p x && for_all_aux rest
  in
  for_all_aux lst




(*val exists : ('a -> bool) -> 'a list -> bool*) (*terminal*)
let exists p lst =
  let rec exists_aux l =
    match l with
    | [] -> false
    | x :: rest -> p x || exists_aux rest
  in
  exists_aux lst




(*val mem : 'a -> 'a list -> bool*) (*terminal*)
let mem x lst =
  let rec mem_aux l =
    match l with
    | [] -> false
    | y :: rest -> x = y || mem_aux rest
  in
  mem_aux lst




(*val find : ('a -> bool) -> 'a list -> 'a*) (*terminal*)
let find p lst =
  let rec find_aux l =
    match l with
    | [] -> raise Not_found
    | x :: rest -> if p x then x else find_aux rest
  in
  find_aux lst




(*val filter : ('a -> bool) -> 'a list -> 'a list*) (*terminal*)
let filter p lst =
  let rec filter_aux acc l =
    match l with
    | [] -> List.rev acc
    | x :: rest ->
      if p x then
        filter_aux (x :: acc) rest
      else
        filter_aux acc rest
  in
  filter_aux [] lst




(*val find_all : ('a -> bool) -> 'a list -> 'a list*) (*terminal*)
let find_all p lst =
  let rec find_all_aux acc l =
    match l with
    | [] -> List.rev acc
    | x :: rest ->
      if p x then
        find_all_aux (x :: acc) rest
      else
        find_all_aux acc rest
  in
  find_all_aux [] lst




(*val partition : ('a -> bool) -> 'a list -> 'a list * 'a list*) (*terminal*)
let partition p lst =
  let rec partition_aux acc_true acc_false l =
    match l with
    | [] -> (List.rev acc_true, List.rev acc_false)
    | x :: rest ->
      if p x then
        partition_aux (x :: acc_true) acc_false rest
      else
        partition_aux acc_true (x :: acc_false) rest
  in
  partition_aux [] [] lst




(*val fold_left : ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a*) (*terminal*)
let fold_left f acc lst =
  let rec fold_left_aux acc' l =
    match l with
    | [] -> acc'
    | x :: rest -> fold_left_aux (f acc' x) rest
  in
  fold_left_aux acc lst




(*val fold_right : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b*) (* not tail recursive *)
let fold_right f lst acc =
  let rec fold_right_aux l acc' =
    match l with
    | [] -> acc'
    | x :: rest -> f x (fold_right_aux rest acc')
  in
  fold_right_aux lst acc




(*val assoc : 'a -> ('a * 'b) list -> 'b*) (*terminal*)
let assoc key lst =
  let rec assoc_aux k l =
    match l with
    | [] -> raise Not_found
    | (k', v) :: rest -> if k = k' then v else assoc_aux k rest
  in
  assoc_aux key lst





(*val mem_assoc : 'a -> ('a * 'b) list -> bool*) (*terminal*)
let mem_assoc key lst =
  let rec mem_assoc_aux k l =
    match l with
    | [] -> false
    | (k', _) :: rest -> k = k' || mem_assoc_aux k rest
  in
  mem_assoc_aux key lst





(*val remove_assoc : 'a -> ('a * 'b) list -> ('a * 'b) list*) (* not tail recursive *)
let remove_assoc key lst =
  let rec remove_assoc_aux acc k l =
    match l with
    | [] -> List.rev acc
    | (k', v) :: rest ->
      if k = k' then
        List.rev_append acc rest
      else
        remove_assoc_aux ((k', v) :: acc) k rest
  in
  remove_assoc_aux [] key lst





