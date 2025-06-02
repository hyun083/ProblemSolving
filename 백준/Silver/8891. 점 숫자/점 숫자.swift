import Foundation

var Y = 1
var X = 1
var num = 1
var map = Array(repeating: Array(repeating: 0, count: 1001), count: 1001)
var arr = [(x:Int, y:Int)]()
arr.append((0,0))

while true {
    if num > 500000 { break }
    var x = 1
    var y = Y
    while x <= X && y > 0{
        if x >= 1001 || y >= 1001 { break }
        map[x][y] = num
        arr.append((x,y))
        x += 1
        y -= 1
        num += 1
    }
    X += 1
    Y += 1
}
let N = Int(readLine()!)!
for _ in 0..<N{
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let u = arr[input[0]]
    let v = arr[input[1]]
    let nx = u.x+v.x
    let ny = u.y+v.y
    print(map[nx][ny])
}