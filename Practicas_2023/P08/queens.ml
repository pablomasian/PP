let rec is_safe queen_pos queens =
  let conflict (r, c) (r', c') =
    r = r' || c = c' || abs (r - r') = abs (c - c')
  in
  List.for_all (fun pos -> not (conflict queen_pos pos)) queens

let rec place_queens n current_row queens =
  if current_row > n then [queens]
  else
    let try_place col acc =
      if is_safe (current_row, col) queens then
        place_queens n (current_row + 1) ((current_row, col) :: queens) @ acc
      else acc
    in
    List.fold_right try_place (List.init n (fun x -> x + 1)) []

let queens n =
  if n < 1 then [[]]
  else place_queens n 1 []




(* Ejemplos
queens 0;;
queens 1;;
queens 2;;
queens 4;;
*)



let is_queens_sol n sol =
  let conflict (r, c) (r', c') =
    r = r' || c = c' || abs (r - r') = abs (c - c')
  in
  let rec check_queens pos queens =
    match queens with
    | [] -> true
    | q :: qs -> not (conflict pos q) && check_queens pos qs
  in
  List.length sol = n && List.for_all (fun pos -> check_queens pos sol) sol



(* Ejemplos
is_queens_sol 2 [(1, 1); (2, 2)];;
is_queens_sol 2 [(1, 1); (2, 3)];;
let check n = List.for_all (is_queens_sol n) (queens n);;
List.for_all check (List.init 13 abs);;
List.map (fun i -> i, List.length (queens i)) (List.init 13 abs);;
*)
