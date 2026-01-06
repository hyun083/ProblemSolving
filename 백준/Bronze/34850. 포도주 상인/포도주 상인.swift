import Foundation

let XYPAB = readLine()!.split(separator: " ").map{Int($0)!}
let X = XYPAB[0]
let Y = XYPAB[1]
let P = XYPAB[2]
let A = XYPAB[3]
let B = XYPAB[4]

var price = P + ((Y-1)*B)
var ans = 0

for _ in 0..<X{
    ans += price
    price -= A
}
print(ans)