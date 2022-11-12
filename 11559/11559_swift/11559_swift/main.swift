//
//  main.swift
//  11559_swift
//
//  Created by Hyun on 2022/11/12.
//

import Foundation

var map = Array(repeating: Array(repeating: "", count: 12), count: 6)
var visited = Array(repeating: Array(repeating: false, count: 12), count: 6)
var ans = 0

for i in stride(from: 11, through: 0, by: -1){
    let line = readLine()!.map{String($0)}
    for k in 0..<6{
        map[k][i] = line[k]
    }
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
func bfs(x:Int, y:Int){
    var tempMap = map
    var q = [(x,y)]
    var idx = 0
    let target = tempMap[x][y]
    tempMap[x][y] = "#"
    
    while idx < q.count{
        let curr = q[idx]
        let x = curr.0
        let y = curr.1
        
        for i in 0..<4{
            let nx = x+dx[i]
            let ny = y+dy[i]
            if nx<0 || nx>=6 || ny<0 || ny>=12{ continue }
            if tempMap[nx][ny]==target && !visited[nx][ny]{
                visited[nx][ny] = true
                tempMap[nx][ny] = "#"
                q.append((nx,ny))
            }
        }
        idx += 1
    }
    if q.count >= 4{
        map = tempMap
    }
}

while true {
    var flag = false
    visited = Array(repeating: Array(repeating: false, count: 12), count: 6)
    for i in 0..<6{
        for k in 0..<12{
            if !visited[i][k] && map[i][k] != "." && map[i][k] != "#"{
                visited[i][k] = true
                bfs(x: i, y: k)
            }
        }
    }
    
    var tempMap = map
    for i in 0..<6{
        var temp = [String]()
        var blank = [String]()
        for puyo in tempMap[i]{
            if puyo == "#"{
                flag = true
                blank.append(".")
            }else{
                temp.append(puyo)
            }
        }
        tempMap[i] = temp+blank
    }
    map = tempMap
    
    if flag{
        ans += 1
    }else{
        break
    }
}
print(ans)

