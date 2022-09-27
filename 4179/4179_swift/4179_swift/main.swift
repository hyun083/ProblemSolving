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

var j = [[Int]]()
var f = [[Int]]()
var map = Array(repeating: Array(repeating: "", count: c), count: r)
var visited = Array(repeating: Array(repeating: 0, count: c), count: r)
var ans = Int.max

for i in 0..<r{
    let input = readLine()!.map{String($0)}
    for k in 0..<c{
        map[i][k] = input[k]
        if map[i][k] == "J"{
            j.append([i,k])
        }else if map[i][k] == "F"{
            f.append([i,k])
        }
    }
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

func bfs(j:[[Int]],f:[[Int]]){
    var level = 0
    var q = f
    var dq = [[Int]]()
    var check = Array(repeating: Array(repeating: false, count: c), count: r)

    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let x = curr[0]
            let y = curr[1]
            check[x][y] = true
            visited[x][y] = level
            for i in 0..<4{
                let nx = dx[i] + x
                let ny = dy[i] + y
                if nx<0 || nx>=r || ny<0 || ny>=c || map[nx][ny]=="#"{continue}
                if visited[nx][ny]==0 && !check[nx][ny]{
                    check[nx][ny] = true
                    q.append([nx,ny])
                }
            }
        }
        level += 1
    }
    
    level = 0
    q = j
    dq = [[Int]]()
    check = Array(repeating: Array(repeating: false, count: c), count: r)
    
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let x = curr[0]
            let y = curr[1]
            check[x][y] = true
            if x==0||x==r-1||y==0||y==c-1{
                ans = min(ans, level+1)
            }
            for i in 0..<4{
                let nx = curr[0]+dx[i]
                let ny = curr[1]+dy[i]
                if nx<0 || nx>=r || ny<0 || ny>=c || map[nx][ny] == "#"{ continue }
                if visited[nx][ny] > level+1 && !check[nx][ny]{
                    check[nx][ny] = true
                    q.append([nx,ny])
                }
                if visited[nx][ny]==0 && !check[nx][ny]{
                    check[nx][ny] = true
                    q.append([nx,ny])
                }
            }
        }
        level += 1
    }
}
bfs(j: j, f: f)
print(ans == Int.max ? "IMPOSSIBLE":ans)
