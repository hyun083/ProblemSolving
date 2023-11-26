import Foundation

var prime = Array(repeating: true, count: 10001)
var ans = Array(repeating: (value:10000, a:0, b:0), count: 20001)
prime[0] = false

for i in 2...10000{
    if prime[i] {
        var tmp = 2
        while tmp*i <= 10000{
            prime[tmp*i] = false
            tmp += 1
        }
    }
}

let T = Int(readLine()!)!
for _ in 0..<T{
    let N = Int(readLine()!)!
    var left = 0
    var right = 0
    for i in 1...N/2{
        if prime[i] && prime[N-i]{
            left = i
            right = N-i
        }
    }
    print(left,right)
}