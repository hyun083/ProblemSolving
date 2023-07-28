import Foundation

func readInt() -> Int{ Int(readLine()!)! }

let L = readInt()
let A = readInt()
let B = readInt()
let C = readInt()
let D = readInt()

var cost1 = (A%C)==0 ? A/C:A/C+1
var cost2 = (B%D)==0 ? B/D:B/D+1

print(L - max(cost1,cost2))