let rec fib n =
  if n <= 1 then n
  else fib (n - 1) + fib (n - 2)

let rec print_fib_terms n m =
  if n <= m then begin
    print_int (fib n);
    print_newline ();
    print_fib_terms (n + 1) m
  end

let fibto n =
  print_fib_terms 0 n

let () =
  let n = int_of_string Sys.argv.(1) in
  fibto n

