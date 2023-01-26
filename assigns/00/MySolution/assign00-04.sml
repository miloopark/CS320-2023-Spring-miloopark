fun str2int(cs: string): int =
    let
        fun helper(cs: string, i0: int, index: int, sign:int): int =
            if index >= String.size(cs) then sign * i0
            else helper(cs, i0 * 10 + Char.ord(String.sub(cs, index)) - Char.ord(#"0"), index + 1, sign)
    in
        if String.sub(cs, 0) = #"-" then helper(cs, 0, 1, ~1)
        else helper(cs, 0, 0, 1)
    end