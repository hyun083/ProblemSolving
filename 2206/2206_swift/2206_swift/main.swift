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
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: m), count: n), count: 2)
for i in 0..<n{
    map[i] = readLine()!.map{Int(String($0))!}
}

var ans = Int.max

func bfs(){
    var q = [[Int]]()
    var dq = [[Int]]()
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var level = 0
    q.append([0,0,0])
    visited[0][0][0] = true
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        level += 1
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let flag = curr[0]
            let x = curr[1]
            let y = curr[2]
            if x==n-1 && y==m-1{
                ans = level
                return
            }
            for i in 0..<4{
                let nx = curr[0] + dx[i]
                let ny = curr[1] + dy[i]
                if nx<0 || nx>=n || ny<0 || ny>=m {continue}
                if flag == 0{
                    if !visited[0][nx][ny] && map[nx][ny]==0{
                        q.append([0,nx,ny])
                        visited[0][nx][ny] = true
                    }
                    if !visited[0][nx][ny] && map[nx][ny]==1{
                        q.append([1,nx,ny])
                        visited[0][nx][ny] = true
                    }
                }else{
                    if !visited[1][nx][ny] && map[nx][ny]==0{
                        q.append([1,nx,ny])
                        visited[1][nx][ny] = true
                    }
                }
                
            }
        }
    }
}
bfs()
if ans == Int.max{
    print(-1)
}else{
    print(ans)
}
