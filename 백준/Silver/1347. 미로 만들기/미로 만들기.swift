import Foundation

let n = Int(readLine()!)!
let cmd = readLine()!.map{String($0)}
var map = Array(repeating: Array(repeating: "#", count: 101), count: 101)
var x = 51
var y = 51
var xMin = 51
var xMax = 51
var yMin = 51
var yMax = 51

let dx = [1,0,-1,0]
let dy = [0,-1,0,1]
var direction = 0

map[x][y] = "."

for cmd in cmd{
    if cmd == "F"{
        x += dx[direction]
        y += dy[direction]
        map[x][y] = "."
        xMin = min(xMin, x)
        xMax = max(xMax, x)
        yMin = min(yMin, y)
        yMax = max(yMax, y)
    }
    if cmd == "R"{
        direction += 1
        if direction>3{
            direction -= 4
        }
        continue
    }
    if cmd == "L"{
        direction -= 1
        if direction<0{
            direction = 3
        }
        continue
    }
}
for x in xMin...xMax{
    for y in yMin...yMax{
        print(map[x][y],terminator: "")
    }
    print("")
}