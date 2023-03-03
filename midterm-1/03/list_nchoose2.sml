(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-03: 10 points
*)
(* ****** ****** *)

(*
//
Given a list of distnct integers xs,
list_nchoose2(xs) returns a list of all
the pairs (x1, x2) such that x1 and x2 are
two elements from xs satisfying x1 <= x2.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//
For instance,
list_nchoose2([1,3,2]) =
[ (1,3), (1,2), (2,3) ]
list_nchoose2([3,2,1]) =
[ (2,3), (1,3), (1,2) ]
list_nchoose2([3,2,1,4]) =
[(2,3),(1,3),(1,2),(1,4),(2,4),(3,4)]
Note that the returned list is treated as a
set, and the order of the elements in the list
is insignificant.
*)

(* ****** ****** *)

(*
fun
list_nchoose2(xs: int list): (int * int) list = ...
*)
fun
list_mergesort
(xs: int list): int list =
let

fun
split
(xs: int list): int list * int list =
(
case xs of
  nil => ([], [])
| x1 :: xs =>
(
  case xs of
    nil => ([x1], [])
  | x2 :: xs =>
    let
      val
      (ys, zs) = split(xs)
    in
      (x1 :: ys, x2 :: zs)
    end
)
)

fun merge
( ys: int list
, zs: int list): int list =
(
case ys of
  nil => zs
| y1 :: ys =>
(
  case zs of
    nil => y1 :: ys
  | z1 :: zs =>
    if y1 <= z1
    then y1 :: merge(ys, z1 :: zs)
    else z1 :: merge(y1 :: ys, zs)
)
)

in

case xs of
  nil => []
| x1 :: xs =>
(
  case xs of
    nil => [x1]
  | x2 :: xs =>
    let
      val (ys, zs) = split(xs)
    in
      merge(list_mergesort(x1 :: ys), list_mergesort(x2 :: zs))
    end
)
end
(***
mergesort copied assign02
***)

fun list_nchoose2(xs: int list): (int * int) list =
    let
        val xs = list_mergesort(xs)
        fun pairs(x, ys) =
            case ys of
                [] => []
              | y::ys => if x <> y andalso x <= y then (x, y)::pairs(x, ys) else pairs(x,ys)
        fun all([], _) = []
          | all(x::xs, ys) = pairs(x, ys) @ all(xs, ys)
    in
        all(xs, tl xs)
    end


(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-list_nchoose2.sml] *)
