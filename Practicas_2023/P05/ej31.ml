
(* let g n = (n >= 0 && n mod 2 = 0) || n mod 2 = -1;; *)
 
let g1 n =
  if n >= 0 then
    if n mod 2 = 0 then
      true
    else
      false
  else
    if n mod 2 = -1 then
      true
    else
      false;;


let g2 n =
  match n with
  | x when x >= 0 ->
    (match x mod 2 with
    | 0 -> true
    | _ -> false)
  | x when x mod 2 = -1 -> true
  | _ -> false;;

