import Foundation

let N = Int(readLine()!)!
var arr = [(x:Int,y:Int)]()
var param = 0
var score = 0

for _ in 0..<N{
    let XY = readLine()!.split(separator: " ").map{Int($0)!}
    let X = XY[0]
    let Y = XY[1]
    
    arr.append((X,Y))
    param += X
    score += Y
}
var target = Int.max
var resA = 0
var resB = 0

for a in 1...100{
    for b in 1...100{
        var sum = 0
        for i in 0..<N{
            let res = arr[i].y - ((a*arr[i].x) + b)
            sum += res*res
        }
        if target > sum{
            target = sum
            resA = a
            resB = b
        }
    }
}
print(resA,resB)