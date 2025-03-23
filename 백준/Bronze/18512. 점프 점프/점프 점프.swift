import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let X = input[0]
let Y = input[1]
var p1 = input[2]
var p2 = input[3]

var ans = -1

while p1 < 10000 && p2 < 10000{
    if p1 < p2{
        p1 += X
    }else if p1 > p2{
        p2 += Y
    }else{
        ans = p1
        break
    }
}
print(ans)