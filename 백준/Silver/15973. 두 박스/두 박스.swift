import Foundation

let P = readLine()!.split(separator: " ").map{Int($0)!}
let x1 = P[0]
let y1 = P[1]
let p1 = P[2]
let q1 = P[3]

let Q = readLine()!.split(separator: " ").map{Int($0)!}
let x2 = Q[0]
let y2 = Q[1]
let p2 = Q[2]
let q2 = Q[3]

if p1<x2 || q1<y2 || x1>p2 || y1>q2{
    print("NULL")
}else if q1==y2 || y1==q2{
    if p1==x2 || x1==p2{
        print("POINT")
    }else{
        print("LINE")
    }
}else if p1==x2 || x1==p2{
    print("LINE")
}else{
    print("FACE")
}