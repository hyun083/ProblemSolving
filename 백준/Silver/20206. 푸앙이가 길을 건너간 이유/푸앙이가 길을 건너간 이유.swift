import Foundation

let line = readLine()!.split(separator: " ").map{Int($0)!}
let x = line[0]
let y = line[1]
let c = -1*line[2]

let xy = readLine()!.split(separator: " ").map{Int($0)!}
let x1 = xy[0]*x
let x2 = xy[1]*x
let y1 = xy[2]*y
let y2 = xy[3]*y

let minX = min(x1, x2)
let maxX = max(x1, x2)
let minY = min(y1, y2)
let maxY = max(y1, y2)
print((minX)+(minY) < c && c < (maxX)+(maxY) ? "Poor":"Lucky")