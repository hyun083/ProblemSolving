import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0],$0[1])}[0]
var x = 0
var y = 0
var dir = 0
let dx = [0,-1,0,1]
let dy = [1,0,-1,0]
var flag = true

for _ in 0..<M{
    let (cmd,num) = [readLine()!.split(separator: " ").map{String($0)}].map{($0[0],Int($0[1])!)}[0]
    if cmd == "MOVE"{
        let nx = x + (num*dx[dir])
        let ny = y + (num*dy[dir])
        
        if nx<0 || nx>N || ny<0 || ny>N {
            flag = false
            break
        }
        x = nx
        y = ny
    }else if num==0{
        dir -= 1
        if dir<0 {
          dir = 3
        }
    }else{
        dir += 1
        if dir>3{
            dir = 0
        }
    }
}
print(flag ? "\(y) \(x)":"-1")