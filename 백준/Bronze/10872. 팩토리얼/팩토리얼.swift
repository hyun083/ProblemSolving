import Foundation

var ans = 1
var N = Int(readLine()!)!

while N>0{
    ans *= N
    N-=1
}
print(ans)