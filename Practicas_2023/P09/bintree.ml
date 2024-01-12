type 'a bintree =
    Empty
  | Node of 'a * 'a bintree * 'a bintree
;;


let rec in_order tree =
  match tree with
  | Empty -> []
  | Node (value, left, right) ->
      in_order left @ [value] @ in_order right



let rec insert ord tree x =
  match tree with
  | Empty -> Node (x, Empty, Empty)
  | Node (value, left, right) ->
      if ord x value then
        Node (value, insert ord left x, right)
      else if ord value x then
        Node (value, left, insert ord right x)
      else
        tree (* El valor ya está en el árbol, no se añade duplicado *)


let rec bst ord lst =
  List.fold_left (fun acc x -> insert ord acc x) Empty lst
  
  
let qsort ord lst =
  let tree = bst ord lst in
  in_order tree

