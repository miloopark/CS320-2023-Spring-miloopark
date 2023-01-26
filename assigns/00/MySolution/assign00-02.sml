fun isPrime(n0: int): bool =
    if n0 < 2 then false else 
    let
      fun isPrime2(i: int): bool = 
        if i * i >= n0 then true
        else if (n0 mod i = 0) then false
        else isPrime2(i + 1)
    in
      isPrime2(2)
    end
