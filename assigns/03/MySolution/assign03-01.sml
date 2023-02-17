(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
//
HX-2023-02-09: 10 points
//
The function find_root(f0)
finds the first root of [f0] in
the following sequence:
0, 1, -1, 2, -2, 3, -3, 4, -4, ...
*)

fun
find_root(f0: int -> int): int = (
    let
        fun helper(x: int): int = 
            if f0(x) = 0 then x
            else if x > 0 then helper(~x)
            else helper(~(x-1))
    in
        helper(0)
    end  
)


(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-01.sml] *)