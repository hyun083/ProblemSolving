//
//  main.swift
//  14502_swift
//
//  Created by Hyun on 2022/09/08.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var cnt = 0
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var walls = [[Int]]()
for x in 0..<n{
    let numbers = readLine()!.split(separator: " ").map{Int($0)!}
    for y in 0..<m{
        if numbers[y] == 0{
            cnt += 1
            walls.append([x,y])
        }
    }
    map.append(numbers)
}
var newMap = map
var newCnt = cnt

var q = [[Int]]()
var dq = [[Int]]()
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
func bfs(){
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            for i in 0..<4{
                let nx = curr[0] + dx[i]
                let ny = curr[1] + dy[i]
                if nx<0 || nx>=n || ny<0 || ny>=m{continue}
                if !visited[nx][ny] && newMap[nx][ny]==0{
                    newCnt -= 1
                    newMap[nx][ny] = 2
                    q.append([nx,ny])
                }
            }
        }
    }
}

func virus(){
    q = [[Int]]()
    for x in 0..<n{
        for y in 0..<m{
            if !visited[x][y] && newMap[x][y]==2{
                q.append([x,y])
                bfs()
            }
        }
    }
}
var ans = 0
for i in 0..<cnt{
    let ix = walls[i][0]
    let iy = walls[i][1]
    for k in i+1..<cnt{
        let kx = walls[k][0]
        let ky = walls[k][1]
        for p in k+1..<cnt{
            let px = walls[p][0]
            let py = walls[p][1]
            visited = Array(repeating: Array(repeating: false, count: m), count: n)
            newMap = map
            newCnt = cnt-3
            newMap[ix][iy] = 1
            newMap[kx][ky] = 1
            newMap[px][py] = 1
            virus()
            ans = max(ans, newCnt)
        }
    }
}
print(ans)
