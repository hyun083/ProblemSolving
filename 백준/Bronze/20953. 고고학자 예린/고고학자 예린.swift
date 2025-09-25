import Foundation

let T = Int(readLine()!)!

func dolmen(a:Int, b:Int) -> Int{
    var sum = 0
    let n = a + b
    sum = n * n * (n - 1) / 2
    return sum
}

for _ in 0..<T{
    let num = readLine()!.split(separator: " ").map{Int($0)!}
    let A = num[0]
    let B = num[1]
    
    print(dolmen(a: A, b: B))
}