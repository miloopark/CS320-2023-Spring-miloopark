(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-02: midterm-06: 20 points
//
Given a list of integers xs, list_grouping(xs)
returns a list of pairs (n, x) where n indicates
the number of times x occurs in xs; for each x in
xs, there must be a pair (n, x) for some n in the
returned list.
//
For instance,
list_grouping([1,2]) = [[1,1], [1,2]]
list_grouping([1,2,2,2,1]) = [[2,1], [3,2]]
list_grouping([1,2,1,2,3]) = [[2,1], [2,2], [1,3]]
//
In order to receive full credit, your implementation
should be able to handle a list containing 1M elements
in less than 10 seconds (mine can do it in less than
two seconds)
//
*)
(* ****** ****** *)

(*
fun
list_grouping(xs: int list): (int * int) list = ...
*)

fun add_pair_helper(x: int, n: int, p: (int * int) list): (int * int) list =
    case p of
        [] => [(1, x)]
        | (a, b)::rest => if a = b then (n + 1, b) :: rest else (1, a) :: p

fun add_pair(x: int, n: int, p: (int * int) list): (int * int) list =
    add_pair_helper(x, n, p)

fun list_grouping_helper(xs: int list, current: int, count: int, acc: (int * int) list): (int * int) list =
    case xs of
        [] => rev ((count, current)::acc)
        | x::xs' =>
            if x = current then
                list_grouping_helper(xs', current, count+1, acc)
            else
                list_grouping_helper(xs', x, 1, (count, current)::acc)

fun list_grouping(xs: int list): (int * int) list =
    list_grouping_helper(xs, hd xs, 1, [])


(* ****** ****** *)

(*
Some testing code:
val N = 1000
val nxs = list_grouping(int1_map_list(N, fn i => N-i))
*)
(* ****** ****** *)

(*
Some testing code:
Your implementation needs to be efficient to pass the
following test:
val N = 1000000
val nxs = list_grouping(int1_map_list(N, fn i => N-i))
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-list_grouping.sml] *)
