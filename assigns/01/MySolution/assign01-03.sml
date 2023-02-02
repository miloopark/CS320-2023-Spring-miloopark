use "./../assign01-lib.sml";
use "./../assign01.sml";

fun xlist_remove_reverse(xs: 'a xlist): 'a xlist =
    let
        fun reverse_helper(ys: 'a xlist, xs: 'a xlist): 'a xlist =
            case xs of
                xlist_nil => ys
                | xlist_cons(x, xs) => reverse_helper(xlist_snoc(ys, x), xs)
                | xlist_snoc(xs, x) => reverse_helper(xlist_snoc(ys, x), xs)
                | xlist_append(xs, ys2) => reverse_helper(xlist_append(ys, reverse_helper(xlist_nil, ys2)), xs)
                | xlist_reverse(xs) => reverse_helper(ys, xs)
    in
        reverse_helper(xlist_nil, xs)
    end