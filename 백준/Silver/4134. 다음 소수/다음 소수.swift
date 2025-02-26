import Foundation

let N = Int(readLine()!)!

func isPrime(num:Int) -> Bool{
    if num < 2{ return false }
    let sqrtNum = Int(sqrt(Double(num)))
    for i in 2..<sqrtNum+1{
        if num % i == 0{
            return false
        }
    }
    return true
}

for _ in 0..<N{
    var num = Int(readLine()!)!
    while !isPrime(num: num){
        num += 1
    }
    print(num)
}