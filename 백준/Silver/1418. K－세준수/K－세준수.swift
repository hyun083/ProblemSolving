import Foundation

var prime = Array(repeating: true, count: 100001)
prime[0] = false
prime[1] = false

var num = 2
for num in 2...100000{
    var next = num + num
    while next <= 100000 {
        prime[next] = false
        next += num
    }
}

func getMaxPrime(of num:Int)->Int{
    var res = 0
    var arr = [Int]()
    for n in 1...Int(sqrt(Double(num))){
        if num % n == 0{
            arr.append(n)
        }
    }
    
    for n in arr{
        let m = num / n
        if prime[m]{
            res = max(res, m)
        }
        if prime[n]{
            res = max(res, n)
        }
    }
    return res
}

let N = Int(readLine()!)!
let K = Int(readLine()!)!
var ans = 0
for num in 1...N{
    ans += getMaxPrime(of: num)<=K ? 1 : 0
}
print(ans)