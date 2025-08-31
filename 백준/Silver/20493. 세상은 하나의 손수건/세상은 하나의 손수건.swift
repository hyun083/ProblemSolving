import Foundation

let NT = readLine()!.split(separator: " ").map{Int($0)!}
let N = NT[0]
let T = NT[1]
var curr = 0

var dir = 0
let nx = [1,0,-1,0]
let ny = [0,-1,0,1]

var X = 0
var Y = 0

for _ in 0..<N{
    let ts = readLine()!.split(separator: " ").map{String($0)}
    let t = Int(ts[0])!
    let s = ts[1]
    let dt = t-curr
    X += nx[dir]*dt
    Y += ny[dir]*dt
    curr = t
    dir += s=="right" ? 1:-1
    dir = dir<0 ? 3:dir>3 ? 0:dir
}
X += nx[dir]*(T-curr)
Y += ny[dir]*(T-curr)
print(X,Y)