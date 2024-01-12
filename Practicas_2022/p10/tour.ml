let jumps (i,j) d = List.init d (fun k-> i,j+k+1)@
                                        List.init d (fun k-> i,j-k-1)@
                                        List.init d (fun k-> i+k+1,j)@
                                        List.init d (fun k-> i-k-1,j);;

let valid (i,j) d trees l2=
        let l1 = jumps (i,j) d in
        List.filter(fun x -> not(List.mem x l2)&&( List.mem x l1)) trees;;


let tour m n trees d =
  let rec complete path saltos = match saltos with
  | [] -> raise Not_found
  | h::t -> if h = (m,n) then List.rev (h::path) else
      try complete (h::path) (valid h d trees path) with
      | Not_found -> complete path t
    in if List.mem (1,1) trees then complete [] [(1,1)]
                else raise Not_found;;
