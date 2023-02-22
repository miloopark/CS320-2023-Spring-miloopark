fun 
quiz02_01(word: string): char -> int = (
    let
        fun helper(c: char, s: string, acc: int) =
        case s of
            "" => acc
        | _ => let
                val first = String.sub(s, 0)
            in
                if first = c
               then helper(c, String.sub(s, 1), acc + 1)
               else helper(c, String.sub(s, 1), acc)
            end
    in
        fn (c: char) => helper(c, word, 0)
    end
)
