import Foundation

let NAB = readLine()!.split(separator: " ").map{Int($0)!}
let N = NAB[0]
var A = NAB[1]
var B = NAB[2] //total
var arr = [(x:Int, y:Int)]()

for _ in 0..<10{
    let XY = readLine()!.split(separator: " ").map{Int($0)!}
    let X = XY[0]
    let Y = XY[1]
    arr.append((X,Y))
}
for i in 0..<8-N{
    let curr = arr[i]
    if A < 66{
        let cnt = min(6,curr.x)
        A += cnt*3
        B += cnt*3
        if cnt < 6{
            B += min(6-cnt, curr.y)*3
        }
    }else{
        B += min(6,curr.x+curr.y)*3
    }
}
print(A>=66&&B>=130 ? "Nice":"Nae ga wae")