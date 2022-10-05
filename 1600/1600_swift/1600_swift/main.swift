//
//  main.swift
//  1600_swift
//
//  Created by Hyun on 2022/10/05.
//

import Foundation

let k = Int(readLine()!)!
let wh = readLine()!.split(separator: " ").map{Int($0)!}
let w = wh[0]
let h = wh[1]
var ans = -1

var map = Array(repeating: Array(repeating: 0, count: w), count: h)
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 31), count: w), count: h)
for x in 0..<h{
    let land = readLine()!.split(separator: " ").map{Int($0)!}
    for y in 0..<w{
        map[x][y] = land[y]
    }
}
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
let hx = [-1,-2,-2,-1,1,2,2,1]
let hy = [-2,-1,1,2,2,1,-1,-2]

func bfs(){
    var q = [[0,0,0,0]]
    var dq = [[Int]]()
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let x = curr[0]
            let y = curr[1]
            let cnt = curr[2]
            let length = curr[3]
            if x==h-1 && y==w-1{
                ans = length
                return
            }
            
            if cnt<k{
                for i in 0..<8{
                    let nx = x+hx[i]
                    let ny = y+hy[i]
                    if nx<0 || nx>=h || ny<0 || ny>=w || map[nx][ny]==1{continue}
                    if !visited[nx][ny][cnt+1]{
                        visited[nx][ny][cnt+1] = true
                        q.append([nx,ny,cnt+1,length+1])
                    }
                }
            }
            for i in 0..<4{
                let nx = x+dx[i]
                let ny = y+dy[i]
                if nx<0 || nx>=h || ny<0 || ny>=w || map[nx][ny]==1{continue}
                if !visited[nx][ny][cnt]{
                    visited[nx][ny][cnt] = true
                    q.append([nx,ny,cnt,length+1])
                }
            }
        }
    }
}
visited[0][0][0] = true
bfs()
print(ans)
