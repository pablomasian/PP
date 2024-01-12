let to0from n = 
  let rec aux l i =
    if i < 0 then List.rev l
    else aux (i::l) (i - 1)
  in aux [] n;;

let fromto m n = 
  let rec aux l i =
    if i < m then l
	else aux (i::l) (i - 1)
  in aux [] n;;

let incseg l = 
  let rec aux l acc l2 = match l with
      [] -> []
	| [h] -> List.rev ((h + acc)::l2)
    | h::t -> aux t (h + acc) ((h + acc)::l2)
  in aux l 0 [];;

let remove x l =
  let rec aux acc = function
      [] -> l
    | h::t -> if x = h then List.rev_append acc t
              else aux (h::acc) t 
  in aux [] l ;;

let compress l =
  let rec aux acc l = match l with
        | h1::h2::t -> if h1=h2 then aux acc (h2::t)
                       else aux (h1::acc) (h2::t)
        | [h] -> aux (h::acc) []
        | []-> List.rev acc
  in (aux [] l);;
