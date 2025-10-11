import Foundation

let N = Int(readLine()!)!
var ans = 1
if N>=5{
    ans = 0
}else if N>0{
    for num in 1...N{
        ans *= num%10
        ans %= 10
    }
}
print(ans)