use "./../assign01-lib.sml";
use "./../assign01.sml";

fun xlist_size(xs: 'a xlist): int = (
    case xs of
        xlist_nil => 0
        | xlist_cons(x, tail_list) => 1 + xlist_size(tail_list)
        | xlist_snoc(head_list, x) => 1 + xlist_size(head_list)
        | xlist_append(head_list, tail_list: 'a xlist) => xlist_size(head_list) + xlist_size(tail_list)
        | xlist_reverse(xs) => xlist_size(xs)
)

fun xlist_sub(xs: 'a xlist, i0: int): 'a = (
    if i0 < 0 then raise XlistSubscript else if i0 >= xlist_size(xs) then raise XlistSubscript else
        case xs of xlist_nil => raise XlistSubscript
            | xlist_cons(x1, xs) => if i0 = 0 then x1 else xlist_sub(xs, i0 - 1)
            | xlist_snoc(xs, x1) => if i0 = xlist_size(xs) then x1 else xlist_sub(xs, i0)
            | xlist_append(xs, ys) => let val size_xs = xlist_size(xs) in 
                                        if i0 < size_xs then xlist_sub(xs, i0)
                                        else xlist_sub(ys, i0 - size_xs)
                                      end
            | xlist_reverse(xs) => xlist_sub(xs, xlist_size(xs) - i0 - 1)
)