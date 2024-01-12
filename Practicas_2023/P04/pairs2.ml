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

let pair_i' (x, y) =
  let rec find_i x y i =
    if x = 1 then
      if y mod 2 = 1 then
        if i mod 2 = 1 then (i + 1) / 2 else find_i (x + 1) (y - 1) (i - 1)
      else
        if i mod 2 = 0 then (i + 1) / 2 else find_i (x + 1) (y - 1) (i - 1)
    else
      if i mod 2 = 1 then find_i (x + 1) y (i - 1)
      else (i + 1) / 2
  in
  find_i 1 1 x

(*La implementación original era lenta porque usaba una búsqueda secuencial para encontrar el valor de i. La mejora se logró con pair_i' al calcular directamente i basándose en la relación entre x, y e i, evitando la búsqueda secuencial y haciendo el cálculo más eficiente.*)

