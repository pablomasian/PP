
let next (x, y) =
  if x = 1 then
    if y mod 2 = 0 then (1, y + 1)
    else (2, 1)
  else if y = 1 then
    if x mod 2 = 0 then (x + 1, 1)
    else (1, x + 1)
  else if (x + y) mod 2 = 0 then
    if y < x then (x - 1, y + 1)
    else (x + 1, y - 1)
  else
    if x < y then (x + 1, y - 1)
    else (x - 1, y + 1)


let rec steps_from (x, y) n =
  if n = 0 then (x, y)
  else steps_from (next (x, y)) (n - 1)


let pair i =
  steps_from (1, 1) (i - 1)

