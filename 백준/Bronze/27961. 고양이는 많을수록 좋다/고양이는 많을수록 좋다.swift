import Foundation

var N = Int(readLine()!)!
var curr = 1
var ans = 0

while curr < N{
    curr += curr
    ans += 1
}

print(N==0 ? 0:curr<N ? ans:ans+1)