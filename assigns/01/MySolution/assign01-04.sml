use "./../../../mysmlib/mysmlib-cls.sml";

use "./../../00/assign00-lib.sml";
use "./../assign01.sml";

fun str2int_opt(cs: string): int option =
    let
        fun helper(cs: string, index: int, i0: int): int option =
            if index >= String.size(cs) then SOME(i0)
            else  
                let 
                    val i = (Char.ord(String.sub(cs, index)) - Char.ord(#"0"))
                in
                    if i >= 0 andalso i <=9
                    then helper(cs, index + 1, i0 * 10 + i) 
                    else NONE
                end
    in
        if cs = "" then NONE
        else helper(cs, 0, 0)
    end
