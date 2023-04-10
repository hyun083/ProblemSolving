import Foundation

func gcd(a:Int, b:Int) -> Int{
    if a%b==0{
        return b
    }
    return gcd(a: b, b: a%b)
}
let N = Int(readLine()!)!
var arr = [Int]()
var numbers = [Int]()
for _ in 0..<N{
    arr.append(Int(readLine()!)!)
}
arr.sort(by: <)

for i in 1..<N{
    numbers.append(arr[i]-arr[i-1])
}

var number = numbers[0]
for i in 1..<numbers.count{
    number = gcd(a: number, b: numbers[i])
}
print((arr.max()! - arr.min()!)/number - N + 1 )