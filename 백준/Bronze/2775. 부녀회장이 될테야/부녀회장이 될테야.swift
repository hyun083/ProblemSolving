import Foundation

func getCount(_ k:Int, _ n:Int) -> Int{
    if k == 0 {return n}
    if n == 1 {return 1}
    return getCount(k-1, n) + getCount(k, n-1)
}

let T = Int(readLine()!)!

for _ in 1...T{
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!
    print(getCount(k, n))
}