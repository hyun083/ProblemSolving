//
//  main.swift
//  15685_swift
//
//  Created by Hyun on 2022/11/15.
//

import Foundation

var map = Array(repeating: Array(repeating: " ", count: 101), count: 101)
var ans = 0

let dx = [0,-1,0,1]
let dy = [1,0,-1,0]
func dragon(x:Int, y:Int, dir:Int, gen:Int){
    var gen = gen
    var direction = [dir]
    while gen > 0{
        var temp = direction
        for _ in 0..<temp.count{
            var nd = temp.removeLast()
            nd = nd==3 ? 0:nd+1
            direction.append(nd)
        }
        gen -= 1
    }
    
    map[x][y] = "D"
    var point = (x,y)
    for dir in direction{
        point.0 += dx[dir]
        point.1 += dy[dir]
        map[point.0][point.1] = "D"
    }
}

for _ in 0..<Int(readLine()!)!{
    let curve = readLine()!.split(separator: " ").map{Int($0)!}
    dragon(x: curve[1], y: curve[0], dir: curve[2], gen: curve[3])
}
for i in 0..<100{
    for k in 0..<100{
        if map[i][k]=="D" && map[i+1][k]=="D" && map[i][k+1]=="D" && map[i+1][k+1]=="D"{
            ans += 1
        }
    }
}
print(ans)
