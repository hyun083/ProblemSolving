//
//  main.swift
//  16234_swift
//
//  Created by Hyun on 2022/11/16.
//

import Foundation

var ans = 0
let nlr = readLine()!.split(separator: " ").map{Int($0)!}
let n = nlr[0]
let l = nlr[1]
let r = nlr[2]

var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
for _ in 0..<n{
    map.append(readLine()!.split(separator: " ").map{Int($0)!})
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
func bfs(x:Int, y:Int) -> Bool{
    var sum = map[x][y]
    var union = [(x:Int,y:Int)]()
    var idx = 0
    union.append((x,y))
    while idx < union.count{
        let curr = union[idx]
        let x = curr.x
        let y = curr.y
        for i in 0..<4{
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx<0 || nx>=n || ny<0 || ny>=n{continue}
            let cap = abs(map[x][y]-map[nx][ny])
            if l<=cap && cap<=r && !visited[nx][ny]{
                visited[nx][ny] = true
                union.append((nx,ny))
                sum += map[nx][ny]
            }
        }
        idx += 1
    }
    
    let population = sum/union.count
    for country in union{
        let x = country.x
        let y = country.y
        map[x][y] = population
    }
    
    return union.count>1
}

while true{
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var flag = false
    for i in 0..<n{
        for k in 0..<n{
            if !visited[i][k]{
                visited[i][k] = true
                flag = bfs(x: i, y: k) || flag
            }
        }
    }
    if !flag{ break }
    ans += 1
}
print(ans)
