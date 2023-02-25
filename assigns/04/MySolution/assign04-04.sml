(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-02-16: 30 points
//
Here is an implementation of the famous 8-queen puzzle:
https://ats-lang.sourceforge.net/DOCUMENT/INT2PROGINATS/HTML/x631.html
//
Please give a NON-RECURSIVE implementation that solves the 8-queen puzzle.
//
type board_t =
int * int * int * int * int * int * int * int
//
fun
queen8_puzzle_solve(): board_t list =
(*
returns a list of boards consisting of all the solutions to the puzzle.
*)
//
*)
type board_t = 
int * int * int * int * int * int * int * int;

fun safety_test1(i0: int, j0: int, i: int, j: int) : bool =
  j0 <> j andalso abs_int(i0 - i) <> abs_int(j0 - j)

fun board_get(bd: board_t, i: int): int =
  let 
    val (x1, x2, x3, x4, x5, x6, x7, x8) = bd
  in
    if i = 0 then x1
    else if i = 1 then x2
    else if i = 2 then x3
    else if i = 3 then x4
    else if i = 4 then x5
    else if i = 5 then x6
    else if i = 6 then x7
    else if i = 7 then x8
    else 0
  end

fun board_set(bd: board_t, i: int, j: int): board_t =
  let
    val (x0, x1, x2, x3, x4, x5, x6, x7) = bd
  in
    if i = 0 then
      (j, x1, x2, x3, x4, x5, x6, x7)
    else if i = 1 then
      (x0, j, x2, x3, x4, x5, x6, x7)
    else if i = 2 then
      (x0, x1, j, x3, x4, x5, x6, x7)
    else if i = 3 then
      (x0, x1, x2, j, x4, x5, x6, x7)
    else if i = 4 then
      (x0, x1, x2, x3, j, x5, x6, x7)
    else if i = 5 then
      (x0, x1, x2, x3, x4, j, x6, x7)
    else if i = 6 then
      (x0, x1, x2, x3, x4, x5, j, x7)
    else if i = 7 then
      (x0, x1, x2, x3, x4, x5, x6, j)
    else bd
  end


fun safety_test2(i0: int, j0: int, bd: board_t, i: int) =
  int1_foldright(i , true, fn(i: int, result: bool) => result andalso safety_test1(i0, j0, i, board_get(bd, i)))

fun search(board_size: int, initial: board_t): board_t list =
  int1_foldleft(board_size, [initial]: board_t list, fn(result, i) => 
  int1_foldleft(board_size, [], fn(acc,j) =>
  list_append(acc, list_filter(list_map(result, fn(x) => board_set(x, i, j)), fn(x) =>
  safety_test2(i, j , x, i)))));

fun queen8_puzzle_solve(): board_t list =
  let
    val initial_board: board_t = (0, 0, 0, 0, 0, 0, 0, 0)
  in
    search(8, initial_board)
  end
(* end of [CS320-2023-Spring-assign04-04.sml] *)
