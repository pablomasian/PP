let f n =
    if n mod 2 = 0 then n / 2
    else 3 * n + 1


let rec orbit n =
  let rec collatz_iter acc x =
    if x = 1 then List.rev (1 :: acc)
    else collatz_iter (x :: acc) (f x)
  in
  let orbit_list = collatz_iter [] n in
  let orbit_str = String.concat ", " (List.map string_of_int orbit_list) in
  orbit_str
  
  
let rec length n=
    if n=1 then 1
    else 1+length(f n)


let rec top n=
    if n=1 then 1
    else max n (top(f n))
    

let rec length'n'top n =
    if n = 1  then (0,1)
    else let l,t = length'n'top (f n)
    in (l+1, max n t)



let rec longest_in m n =
  if m > n then
    failwith "El valor de m debe ser menor o igual al valor de n"
  else if m = n then
    (m, length m)
  else
    let (num, len) = longest_in (m + 1) n in
    let current_len = length m in
    if current_len > len then
      (m, current_len)
    else
      (num, len)


let rec highest_in m n =
  if m > n then
    failwith "El valor de m debe ser menor o igual al valor de n"
  else if m = n then
    (m, top m)
  else
    let (num, height) = highest_in (m + 1) n in
    let current_height = top m in
    if current_height > height then
      (m, current_height)
    else
      (num, height)
