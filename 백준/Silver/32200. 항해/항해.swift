import Foundation

let NXY = readLine()!.split(separator: " ").map{Int($0)!}
let arr = readLine()!.split(separator: " ").map{Int($0)!}
let N = NXY[0]
let X = NXY[1]
let Y = NXY[2]
let diff = Y-X
var cntRes = 0
var remainRes = 0

for length in arr{
    let cnt = length/X
    let remain = length%X
    if cnt == 0 {
        remainRes += remain
        continue
    }
    cntRes += cnt
    if remain < diff*cnt{
        
    }else{
        remainRes += remain - diff*cnt
    }
}
print(cntRes)
print(remainRes)