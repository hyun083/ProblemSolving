import Foundation

let price = readLine()!.split(separator: " ").map{Int($0)!}
let A = price[0]
let P = price[1]
let C = price[2]
let ans = max(A+C, P)
print(ans)