import Foundation

let N = Int(readLine()!)!

func gcd(a:Int, b:Int) -> Int{
    if b == 0{
        return a
    }else{
        return gcd(a: b, b: a%b)
    }
}

for _ in 0..<N{
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let A = input[0]
    let B = input[1]
    let gcd = gcd(a: A, b: B)
    print(A*B/gcd)
}