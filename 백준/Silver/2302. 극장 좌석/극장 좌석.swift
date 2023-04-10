import Foundation

var fibonacci = Array(repeating: Int(), count: 41)
fibonacci[0] = 1
fibonacci[1] = 1
for i in 2...40{
    fibonacci[i] = fibonacci[i-1] + fibonacci[i-2]
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var seat = Array(repeating: false, count: n)

for _ in 0..<m{
    let vip = Int(readLine()!)!-1
    seat[vip] = true
}
var temp = 0
var ans = 1
for i in 0..<n{
    if seat[i]{
        if temp == 0{ continue }
        ans *= fibonacci[temp]
        temp = 0
    }else{
        temp += 1
    }
}
if temp != 0 {
    ans *= fibonacci[temp]
}
print(ans)