//
//  main.swift
//  1926_swift
//
//  Created by Hyun on 2022/09/06.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
for _ in 0..<n{
    map.append(readLine()!.split(separator: " ").map{Int($0)!})
}

var q = [[Int]]()
var dq = [[Int]]()
var ans = 0
var cnt = 0
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
func bfs() -> Int{
    var cnt = 1
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            for i in 0..<4{
                let nx = dx[i] + curr[0]
                let ny = dy[i] + curr[1]
                
                if nx<0 || nx>=n || ny<0 || ny>=m{
                    continue
                }
                if !visited[nx][ny] && map[nx][ny]==1{
                    visited[nx][ny] = true
                    cnt += 1
                    q.append([nx,ny])
                }
            }
        }
    }
    return cnt
}

for x in 0..<n{
    for y in 0..<m{
        if !visited[x][y] && map[x][y] == 1{
            cnt += 1
            visited[x][y] = true
            q.append([x,y])
            ans = max(ans, bfs())
        }
    }
}
print(cnt,ans)
