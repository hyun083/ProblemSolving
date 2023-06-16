import Foundation

let NL = readLine()!.split(separator: " ").map{Int($0)!}
let N = NL[0]
let L = NL[1]

var curr = 0
var time = 0

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let d = info[0]
    let r = info[1]
    let g = info[2]
    
    time += d-curr
    curr = d
    
    let t = time % (r+g)
    if t <= r{
        time += r-t
    }
}

print(time+L-curr)