import Foundation

let (A,B) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
func gcd(a:Int, b:Int) -> Int{
    let r = a%b
    return r==0 ? b:gcd(a: b, b: r)
}
print(String(repeating: "1", count: gcd(a: A, b: B)))