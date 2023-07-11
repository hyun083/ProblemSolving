import Foundation

var N = Int(readLine()!)!
var cnt = 0

while N%5>0 && N>=2{
    N -= 2
    cnt += 1
}
cnt += N/5
N %= 5

print(N==0 ? cnt:-1)