fun stringrev(cs: string): string = 
    let 
        val strlen = String.size(cs)
        fun helper(count: int, reverseString: string): string = 
            if count < 0 then reverseString
            else helper(count - 1, (String.str(String.sub(cs, strlen-count-1)) ^ reverseString))
    in
        if strlen = 0 then ""
        else helper(strlen-1, "")
    end