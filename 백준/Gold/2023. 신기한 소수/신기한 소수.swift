import Foundation

func isPrime(num:Int) -> Bool{
    if num==0 || num==1{
        return false
    }
    for i in 2..<num{
        if i*i > num{continue}
        if num%i == 0{
            return false
        }
    }
    return true
}

let n = Int(readLine()!)!
let primes = ["2","3","5","7"]
let numbers = ["1","3","5","7","9"]
var temp = [String]()
var ans = [String]()

func btk(cnt:Int, length:Int){
    if cnt == length{
        var flag = true
        for i in 0..<length{
            let t = Int(temp[0...i].joined())!
            if !isPrime(num: Int(exactly: t)!){
                flag = false
                break
            }
        }
        if flag{
            ans.append(temp.joined())
        }
        return
    }
    for i in 0..<5{
        temp.append(numbers[i])
        btk(cnt: cnt+1, length: length)
        temp.removeLast()
    }
}
for prime in primes {
    temp.append(prime)
    btk(cnt: 1, length: n)
    temp.removeLast()
}
print(ans.joined(separator: "\n"))