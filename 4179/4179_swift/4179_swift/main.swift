//
//  main.swift
//  4179_swift
//
//  Created by Hyun on 2022/09/26.
//

import Foundation

let rc = readLine()!.split(separator: " ").map{Int($0)!}
let r = rc[0]
let c = rc[1]

var x = 0
var y = 0
var fx = 0
var fy = 0

var map = Array(repeating: Array(repeating: "", count: c), count: r)
var visited = Array(repeating: Array(repeating: false, count: c), count: r)
for i in 0..<r{
    let input = readLine()!.map{String($0)}
    for k in 0..<c{
        map[i][k] = input[k]
        if map[i][k] == "J"{
            x = i
            y = k
        }else if map[i][k] == "F"{
            fx = i
            fy = k
        }else if map[i][k] == "#"{
            visited[i][k] = true
        }
    }
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
var cnt = 0
func bfs_fire(x:Int,y:Int,fx:Int, fy:Int){
    var q = [[fx,fy]]
    var dq = [[Int]]()
    visited[fx][fy] = true
    
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            for i in 0..<4{
                let nx = dx[i] + curr[0]
                let ny = dy[i] + curr[1]
                if nx<0 || nx>=r || ny<0 || ny>=c {continue}
                if !visited[nx][ny]{
                    visited[nx][ny] = true
                    map[nx][ny] = "F"
                    q.append([nx,ny])
                }
            }
        }
        for m in map{
            print(m)
        }
        print(" ",cnt)
        cnt += 1
    }
}

if x==0 || x==r || y==0 || y==c{
    
}
bfs_fire(x: x, y: y, fx: fx, fy: fy)
