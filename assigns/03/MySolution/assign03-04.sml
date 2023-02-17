(* ****** ****** *)
(*
use "./../assign03.sml";
use "./../assign03-lib.sml";
*)
(* ****** ****** *)

(*
HX-2023-02-10: 20 points
Given a list of integers xs,
please implement a function that find
the longest ascending subsequences of [xs].
If there are more than one such sequences,
the left most one should be returned.
*)

fun list_longest_ascend(xs: int list): int list = (
    let
        fun compare(seq1: int list, seq2: int list): int list = (
            if list_length(seq1) >= list_length(seq2)
            then seq1 
            else seq2
        )

        fun longest_seq(seq: int list, ys: int list, last: int): int list = (
            case ys of
                [] => seq
                | y::ys' =>
                if y >= last
                then compare(longest_seq(seq@[y], ys', y), longest_seq(seq, ys', last))
                else longest_seq(seq, ys', last)
        )

        fun helper(xs: int list, longest: int list): int list = (
            case xs of
                [] => longest
                | x::xs' =>
                let
                    val seq = longest_seq([x], xs', x)
                in
                    helper(xs', compare(longest, seq))
                end
        )
    in
        helper(xs, [])
    end

)


(* ****** ****** *)

(* end of [CS320-2023-Spring-assign03-04.sml] *)
