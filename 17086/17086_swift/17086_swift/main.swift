//
//  main.swift
//  17086_swift
//
//  Created by Hyun on 2022/09/12.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var map = Array(repeating: [Int](), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
for i in 0..<n{
    map[i] = readLine()!.split(separator: " ").map{Int($0)!}
}
var ans = Array(repeating: Array(repeating: 0, count: m), count: n)
func bfs(x:Int, y:Int, cnt:Int){
    var q = [[x,y,cnt]]
    var dq = [[Int]]()
    
    let dx = [-1,-1,-1,0,0,1,1,1]
    let dy = [-1,0,1,-1,1,-1,0,1]
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let cx = curr[0]
            let cy = curr[1]
            let cnt = curr[2]

            for i in 0..<8{
                let nx = cx + dx[i]
                let ny = cy + dy[i]
                if nx<0 || nx>=n || ny<0 || ny>=m{continue}
                if !visited[nx][ny] && map[nx][ny]==0{
                    visited[nx][ny] = true
                    q.append([nx,ny,cnt+1])
                }else if !visited[nx][ny] && map[nx][ny]==1{
                    ans[x][y] = cnt
                    return
                }
            }
        }
    }
}

for x in 0..<n{
    for y in 0..<m{
        visited = Array(repeating: Array(repeating: false, count: m), count: n)
        if !visited[x][y] && map[x][y]==0{
            visited[x][y] = true
            bfs(x: x, y: y, cnt: 1)
        }
    }
}
var result = 0
for i in 0..<n{
    for k in 0..<m{
        result = max(result, ans[i][k])
    }
}
print(result)
