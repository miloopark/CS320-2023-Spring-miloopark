use "./../assign01-lib.sml";
use "./../assign01.sml";

fun xlist_remove_reverse(xs: 'a xlist): 'a xlist =
    case xs of 
        xlist_nil => xlist_nil
                | xlist_cons(x, xs) => xlist_cons(x, xlist_remove_reverse(xs))
                | xlist_snoc(xs, x) => xlist_snoc(xlist_remove_reverse(xs), x)
                | xlist_append(xs1, ys2) => xlist_append(xlist_remove_reverse(xs1), xlist_remove_reverse(ys2))
                | xlist_reverse(xlst') => 
                    let
                        fun reverse_helper(ys: 'a xlist): 'a xlist =
                            case ys of
                                xlist_nil => xlist_nil
                                | xlist_cons(x, xs) => xlist_snoc(reverse_helper(xs), x)
                                | xlist_snoc(xs, x) => xlist_cons(x, reverse_helper(xs))
                                | xlist_append(xs1, ys2) => xlist_append(reverse_helper(ys2), reverse_helper(xs1))
                                | xlist_reverse(xlst') => xlist_remove_reverse(xlst')
                    in
                        reverse_helper(xlst')
                    end