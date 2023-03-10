(* ****** ****** *)
(*
HX-2023-02-07: 50 points
*)
(* ****** ****** *)

type int2 = int * int
type int3 = int * int * int
type int4 = int * int * int * int
type int5 = int * int * int * int * int

(* ****** ****** *)

(*
The following function int5_sort
is based on ListMergeSort.sort, which is
defined recursively. Given a tuple of 5
integers, int5_sort returns an ordered tuple
of the same 5 integers. For instance,
int5_sort(1, 2, 1, 2, 2) = (1, 1, 2, 2, 2)
int5_sort(3, 1, 2, 5, 2) = (1, 2, 2, 3, 5)
int5_sort(3, 1, 2, 5, 4) = (1, 2, 3, 4, 5)
*)

(*
val
int5_sort =
fn(xs: int5): int5 =
let
val (x1, x2, x3, x4, x5) = xs
val ys =
ListMergeSort.sort(op>=)[x1,x2,x3,x4,x5]
val y1 = hd(ys) and ys = tl(ys)
val y2 = hd(ys) and ys = tl(ys)
val y3 = hd(ys) and ys = tl(ys)
val y4 = hd(ys) and ys = tl(ys)
val y5 = hd(ys) and ys = tl(ys)
in
  (y1, y2, y3, y4, y5)
end
*)

(* ****** ****** *)
(*
Please give a non-recursive implementation of int5_sort
as int5_sort_nr. That is, please implement int5_sort_nr
in a non-recursive manner such that int5_sort(xs) equals
int5_sort_nr(xs) for every 5-tuple xs of the type int5.
*)
(* ****** ****** *)
fun int2sort(xs: int2): int2 = 
    let
      val (x1, x2) = xs
      val a: int2 = (x1, x2)
      val b: int2 = (x2, x1)
    in
      if x1 <= x2 
      then a 
      else b
    end

fun int3sort(xs: int3): int3 =
    let
      val (x1, x2, x3) = xs
      val ii: int2 = (x1, x2)
      val (i1, i2) = int2sort(ii)
      val jj: int2 = (i1, x3)
      val (j1, j2) = int2sort(jj)
    in
      if x3 >= i2 
      then (i1, i2, x3)
      else (j1, j2, i2)
    end

fun int4sort(xs: int4): int4 =
  let
    val (x1, x2, x3, x4) = xs
    val ii: int3 = (x1, x2, x3)
    val (i1, i2, i3) = int3sort(ii)
    val jj: int3 = (i1, i2, x4)
    val (j1, j2, j3) = int3sort(jj)

  in
    if x4 >= i3 
    then (i1, i2, i3, x4)
    else (j1, j2, j3, i3)
  end

fun int5sort(xs: int5): int5 = 
    let
      val (x1, x2, x3, x4, x5) = xs
      val ii: int4 = (x1, x2, x3, x4)
      val (i1, i2, i3, a4) = int4sort(ii)
      val jj: int4 = (i1, i2, i3, x5)
      val (j1, j2, j3, b4) = int4sort(jj)
    in
      if x5 >= a4 
      then (i1, i2, i3, a4, x5)
      else (j1, j2, j3, b4, a4)
    end

fun
int5_sort_nr(xs: int5): int5 =
  int5sort(xs)
  
  
(*
Please Give your implementation as follows:
*)


(* ****** ****** *)

(* end of [CS320-2023-Spring-quiz01-int5_sort_nonrec.sml] *)
