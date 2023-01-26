fun int2str(i0: int): string =
    let
        fun helper(i0: int, str: string): string =
            if i0 < 10 then String.str(Char.chr(Char.ord(#"0") + i0)) ^ str
            else helper(i0 div 10, String.str(Char.chr(Char.ord(#"0") + i0 mod 10)) ^ str) 
    in
        if i0 < 0 then "-" ^ helper(~i0, "")
        else helper (i0, "")
    end