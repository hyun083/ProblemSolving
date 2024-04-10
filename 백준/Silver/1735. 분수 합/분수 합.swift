import Foundation

let A = readLine()!.split(separator: " ").map{Int($0)!}
let B = readLine()!.split(separator: " ").map{Int($0)!}

func gcd(a:Int, b:Int) -> Int{
    let r = a%b
    return r==0 ? b:gcd(a: b, b: r)
}

var numerator = A[1]==B[1] ? A[0]+B[0]:A[0]*B[1]+B[0]*A[1]
var denominaotr = A[1]==B[1] ? A[1]:A[1]*B[1]

let L = gcd(a: numerator, b: denominaotr)
print(numerator/L,denominaotr/L)