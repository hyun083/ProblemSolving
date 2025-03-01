import Foundation

func isPrime(num:Int) -> Bool{
    if num < 2 { return false}
    let sqrtNum = Int(sqrt(Double(num)))
    for i in 2..<sqrtNum+1{
        if num % i == 0{
            return false
        }
    }
    return true
}

var N = Int(readLine()!)!

while true{
    if isPrime(num: N){
        let numStr = String(N)
        let reversedNumStr = String(numStr.reversed())
        let reversedNum = Int(reversedNumStr)!
        
        if N == reversedNum{
            print(N)
            break
        }else{
            N += 1
        }
    }else{
        N += 1
    }
}