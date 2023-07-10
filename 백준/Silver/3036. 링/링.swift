import Foundation

let N = Int(readLine()!)!
var num = readLine()!.split(separator: " ").map{Int($0)!}
let R = num[0]

func gcd(a:Int, b:Int) -> Int{
    let r = a%b
    if r==0{
        return b
    }
    return gcd(a: b, b: r)
}

for num in num[1..<N]{
    let tmp = gcd(a: max(R, num), b: min(R, num))
    print("\(R/tmp)/\(num/tmp)")
}