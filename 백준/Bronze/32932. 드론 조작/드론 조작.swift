import Foundation

struct point: Hashable{
    var x: Int
    var y: Int
}

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
var curr = point(x: 0, y: 0)
var arr = Set<point>()
for _ in 0..<N{
    let xy = readLine()!.split(separator: " ").map{Int($0)!}
    arr.insert(point(x: xy[0], y: xy[1]))
}
let line = readLine()!.map{String($0)}
for cmd in line{
    var newPoint = point(x: curr.x, y: curr.y)
    
    if cmd == "U"{
        newPoint.y += 1
    }else if cmd == "D"{
        newPoint.y -= 1
    }else if cmd == "L"{
        newPoint.x -= 1
    }else if cmd == "R"{
        newPoint.x += 1
    }
    if arr.contains(newPoint){
        continue
    }else{
        curr = newPoint
    }
}
print(curr.x,curr.y)