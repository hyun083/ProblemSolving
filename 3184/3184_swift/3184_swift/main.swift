//
//  main.swift
//  3184_swift
//
//  Created by Hyun on 2022/10/01.
//

import Foundation

let rc = readLine()!.split(separator: " ").map{Int($0)!}
let r = rc[0]
let c = rc[1]
var map = Array(repeating: Array(repeating: "", count: c), count: r)
var visited = Array(repeating: Array(repeating: false, count: c), count: r)

for i in 0..<r{
    let line = readLine()!.map{String($0)}
    for k in 0..<c{
        map[i][k] = line[k]
        if map[i][k] == "#"{
            visited[i][k] = true
        }
    }
}

var ans = [0,0]

func bfs(x:Int, y:Int){
    var q = [[x,y]]
    var dq = [[Int]]()
    var o = 0
    var v = 0
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let x = curr[0]
            let y = curr[1]
            visited[x][y] = true
            if map[x][y] == "v"{
                v += 1
            }else if map[x][y] == "o"{
                o += 1
            }
            
            let dx = [-1,1,0,0]
            let dy = [0,0,-1,1]
            for i in 0..<4{
                let nx = x+dx[i]
                let ny = y+dy[i]
                if nx<0 || nx>=r || ny<0 || ny>=c || map[nx][ny]=="#"{ continue }
                if !visited[nx][ny] {
                    visited[nx][ny] = true
                    q.append([nx,ny])
                }
            }
        }
    }
    if o>v{
        ans[0] += o
    }else if o<=v{
        ans[1] += v
    }
}
for i in 0..<r{
    for k in 0..<c{
        if !visited[i][k]{
            bfs(x: i, y: k)
        }
    }
}
print(ans[0],ans[1])
