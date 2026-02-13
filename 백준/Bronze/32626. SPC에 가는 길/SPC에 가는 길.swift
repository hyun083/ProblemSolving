import Foundation

let S = readLine()!.split(separator: " ").map{Int($0)!}
let sx = S[0]
let sy = S[1]

let E = readLine()!.split(separator: " ").map{Int($0)!}
let ex = E[0]
let ey = E[1]

let P = readLine()!.split(separator: " ").map{Int($0)!}
let px = P[0]
let py = P[1]

var ans = 0

func inRange(p1: (x:Int, y:Int), p2:(x:Int, y:Int), p3:(x:Int, y:Int)) -> Bool{
    return (min(p1.x,p3.x) <= p2.x && p2.x <= max(p1.x,p3.x)) && (min(p1.y,p3.y) <= p2.y && p2.y <= max(p1.y,p3.y))
}

if inRange(p1: (sx,sy), p2: (px,py), p3: (ex,ey)) {
    if sx==px && px==ex || sy==py && py==ey {
        ans = 2
    } else {
        ans = 1
    }
} else {
    ans = sx==ex || sy==ey ? 0:1
}
print(ans)