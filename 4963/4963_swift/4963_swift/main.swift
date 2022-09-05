//
//  main.swift
//  4963_swift
//
//  Created by Hyun on 2022/09/05.
//

import Foundation

while let line = readLine(){
    if line == "0 0"{
        break
    }
    let wh = line.split(separator: " ").map{Int($0)!}
    let w = wh[0]
    let h = wh[1]
    var map = [[Int]]()
    var visited = Array(repeating: Array(repeating: false, count: w), count: h)
    var ans = 0
    
    for _ in 0..<h{
        map.append(readLine()!.split(separator: " ").map{Int($0)!})
    }
    
    let dx = [-1,-1,-1,0,0,1,1,1]
    let dy = [-1,0,1,-1,1,-1,0,1]
    var q = [[Int]]()
    var dq = [[Int]]()
    func bfs(){
        while !q.isEmpty{
            dq = q.reversed()
            q.removeAll()
            for _ in 0..<dq.count{
                let curr = dq.removeLast()
                let x = curr[0]
                let y = curr[1]
                for i in 0..<8{
                    let nx = x+dx[i]
                    let ny = y+dy[i]
                    if 0<=nx && nx<h && 0<=ny && ny<w{
                        if !visited[nx][ny] && map[nx][ny]==1{
                            visited[nx][ny] = true
                            q.append([nx,ny])
                        }
                    }
                }
            }
        }
    }
    
    for x in 0..<h{
        for y in 0..<w{
            if !visited[x][y] && map[x][y]==1{
                visited[x][y] = true
                q.append([x,y])
                bfs()
                ans += 1
            }
        }
    }
    print(ans)
}

