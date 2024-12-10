import Foundation

let A = Int(readLine()!)!
let X = Int(readLine()!)!
let B = Int(readLine()!)!
let Y = Int(readLine()!)!
let T = Int(readLine()!)!

let ans0 = T-30 < 0 ? A:A+(T-30)*X*21
let ans1 = T-45 < 0 ? B:B+(T-45)*Y*21
print(ans0,ans1)