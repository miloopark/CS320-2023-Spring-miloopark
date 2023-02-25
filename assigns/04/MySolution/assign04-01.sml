(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-02-16: 10 points
Please give a NON-RECURSIVE implementation
of isPrime that is based on combinators in
the mysmlib-library for this class.
*)

(* ****** ****** *)

(*
fun
isPrime(n0: int): bool =
let
fun
loop(i0: int): bool =
if
(i0 * i0 > n0)
then true else
(if n0 mod i0 = 0 then false else loop(i0+1))
in
  if n0 >= 2 then loop(2) else false
end

fun isPrime(n0: int): bool =
  if n0 < 2 then false 
  else if n0 = 2 then true else
  let
    fun helper(n: int): unit = 
      if (n * n > n0) then true
      else if n0 mod n = 0 then false
      else helper(n + 1)
  in
    (int1_foreach(n0 - 2, fn i => helper(i+2)); true)
  end 
*)

fun isPrime(n0: int): bool = (
  if n0 < 2 then false
  else int1_forall(n0, fn(x) => (if x = 0 then true else if x = 1 then true else (n0 mod x) <> 0))
)

(* ****** ****** *)
(* end of [CS320-2023-Spring-assign04-01.sml] *)
