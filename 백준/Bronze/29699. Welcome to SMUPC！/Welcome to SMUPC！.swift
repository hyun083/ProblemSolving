import Foundation

let str = "WelcomeToSMUPC".map{String($0)}
let N = Int(readLine()!)!-1
print(str[N%str.count])