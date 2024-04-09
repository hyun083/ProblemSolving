import Foundation

let N = Int(readLine()!)!
var P = Int(readLine()!)!
var ans = P

if N >= 5{
    ans = min(ans, P-500)
    ans = ans<0 ? 0:ans
}
if N >= 10{
    ans = min(ans, P-(P/10))
}
if N >= 15{
    ans = min(ans, P-2000)
    ans = ans<0 ? 0:ans
}
if N >= 20{
    ans = min(ans, P-(P/100*25))
}
print(ans)