(* dijkstra.ml *)

exception Invalid_argument of string

type ('a, 'b) queue = Empty | Node of 'a * 'b * ('a, 'b) queue * ('a, 'b) queue

let empty = Empty

let rec insert queue prio elt =
  match queue with
  | Empty -> Node (prio, elt, Empty, Empty)
  | Node (p, e, left, right) ->
      if prio < p
      then Node (prio, elt, insert right p e, left)
      else Node (p, e, insert right prio elt, left)

let rec rebuild left right = match (left, right) with
  | Empty, t | t, Empty -> t
  | Node (lprio, lv, lleft, lright), Node (rprio, rv, rleft, rright) ->
      if lprio <= rprio
      then Node (lprio, lv, rebuild lleft lright, right)
      else Node (rprio, rv, left, rebuild rleft rright)

let extract = function
  | Empty -> None
  | Node (prio, elt, left, right) -> Some (prio, elt, rebuild left right)

let dijkstra (w : int option array array) : int option array array =
  let n = Array.length w in
  (* Verificar que la matriz sea cuadrada y no contenga valores negativos *)
  for i = 0 to n - 1 do
    if Array.length w.(i) <> n then
      raise (Invalid_argument "dijkstra: La matriz no es cuadrada")
    else
      Array.iter (function
        | Some weight when weight < 0 ->
          raise (Invalid_argument "dijkstra: La matriz contiene valores negativos")
        | _ -> ()) w.(i)
  done;

  (* Implementar el algoritmo de Dijkstra utilizando la cola de prioridad *)

  (* Devolver la matriz resultante *)
  w

