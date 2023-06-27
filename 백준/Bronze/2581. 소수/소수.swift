import Foundation

var prime = Array(repeating: true, count: 10001)
prime[1] = false
for num in 2...10000{
    var k = 2
    while num*k <= 10000{
        prime[num*k] = false
        k += 1
    }
}

func input() -> Int{
    return Int(readLine()!)!
}

let M = input()
let N = input()

var ans = (0,0)
for num in (M...N).reversed(){
    if prime[num]{
        ans.1 = num
        ans.0 += num
    }
}

print(ans.0==0 ? -1:"\(ans.0)\n\(ans.1)")