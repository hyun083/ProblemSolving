import Foundation

let N = UInt32(readLine()!)!
let n = UInt32(~N+1)
let ans = N^n
print(String(ans,radix: 2).filter({$0=="1"}).count)