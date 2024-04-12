import Foundation

let N = Int(readLine()!)!

func gcd(a:Int, b:Int) -> Int{
    let R = a%b
    return R==0 ? b:gcd(a: b, b: R)
}

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    print(info[0]*info[1]/gcd(a: info[0], b: info[1]))
}