import Foundation

var A = Int(readLine()!)!
let B = Int(readLine()!)!
let C = Int(readLine()!)!
let D = Int(readLine()!)!
let E = Int(readLine()!)!

var ans = 0
if A < 0{
    ans += -1*A*C
    A = 0
}

if A == 0{
    ans += D
}
ans += (B-A)*E
print(ans)