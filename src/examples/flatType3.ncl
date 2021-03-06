let Y = fun f => (fun x => f (x x)) (fun x => f (x x)) in
let dec = fun x => x + (-1) in
let or = fun x y => if x then x else y in
let isEven = Y (fun f =>
    (fun x =>
        if (isZero x) then true
        else (
            if (isZero (dec x)) then false
            else (f (dec (dec x)))
        )
    )
) in
let isDivBy3 = Y (fun f =>
    (fun x =>
        if (isZero x) then true
        else (
            if or (isZero (dec (dec x))) (isZero (dec x)) then false
            else (f (dec (dec (dec x))))
        )
    )
) in
let toCtr = fun f l => fun x => (
  if (isNum x) then (
    if (f x) then x else blame l)
  else blame l
) in
Assume(#(toCtr isDivBy3), 2)
