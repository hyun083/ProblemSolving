//
//  main.swift
//  2206_swift
//
//  Created by Hyun on 2022/09/11.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var map = Array(repeating: [Int](), count: n)
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 2), count: m), count: n)
for i in 0..<n{
    map[i] = readLine()!.map{Int(String($0))!}
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
var ans = -1

func bfs(){
    var q = [[0,0,0,1]]
    var dq = [[Int]]()
    visited[0][0][0] = true
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let x = curr[0]
            let y = curr[1]
            let wall = curr[2]
            let cnt = curr[3]
            
            if x==n-1 && y==m-1{
                ans = cnt
                return
            }
            
            for i in 0..<4{
                let nx = x + dx[i]
                let ny = y + dy[i]
                if nx<0 || nx>=n || ny<0 || ny>=m {continue}
                if wall == 0{
                    if map[nx][ny]==0 && !visited[nx][ny][0]{
                        visited[nx][ny][0] = true
                        q.append([nx,ny,0,cnt+1])
                    }
                    if map[nx][ny]==1 && !visited[nx][ny][1]{
                        visited[nx][ny][1] = true
                        q.append([nx,ny,1,cnt+1])
                    }
                }else{
                    if map[nx][ny]==0 && !visited[nx][ny][1]{
                        visited[nx][ny][1] = true
                        q.append([nx,ny,wall,cnt+1])
                    }
                }
            }
        }
    }
}
bfs()
print(ans)
