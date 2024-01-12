
open G_tree;;

let rec breadth_first = function
    Gt (x, []) -> [x]
  | Gt (x, (Gt (y, t2))::t1) -> x :: breadth_first (Gt (y, t1@t2));;

let breadth_first_t gt=
  let rec aux res level next=
  match (level, next) with
  |[],[]->List.rev res
  |[],next-> aux res (List.rev next) []
  |Gt (x,t2)::t1,next->aux (x::res) t1 (List.rev_append t2 next)
in aux [] [gt] [];;


let t2 = Gt(0,List.init 300_000 (fun i -> Gt(i+1,[])));;

