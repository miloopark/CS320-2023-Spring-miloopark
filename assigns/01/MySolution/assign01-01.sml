use "./../assign01.sml";

fun xlist_size(xs: 'a xlist): int = (
    case xs of
        xlist_nil => 0
        | xlist_cons(x, tail_list) => 1 + xlist_size(tail_list)
        | xlist_snoc(head_list, x) => 1 + xlist_size(head_list)
        | xlist_append(head_list, tail_list: 'a xlist) => xlist_size(head_list) + xlist_size(tail_list)
        | xlist_reverse(xs) => xlist_size(xs)
)