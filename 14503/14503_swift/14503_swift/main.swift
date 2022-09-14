//
//  main.swift
//  14503_swift
//
//  Created by Hyun on 2022/09/14.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

let curr = readLine()!.split(separator: " ").map{Int($0)!}
let x = curr[0]
let y = curr[1]
let way = curr[2]

var map = Array(repeating: Array(repeating: 0, count: m), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var cnt = 0
var power = true

for i in 0..<n{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<m{
        if line[k] == 1 {
            visited[i][k] = true
        }
        map[i][k] = line[k]
    }
}

let dx = [-1,0,1,0]
let dy = [0,1,0,-1]

func operate(x:Int, y:Int, way:Int){
    if !visited[x][y]{
        visited[x][y] = true
        cnt += 1
    }
    
    for i in stride(from: 3, through: 0, by: -1){
        let nWay = (way+i)%4
        let nx = x + dx[nWay]
        let ny = y + dy[nWay]
        if nx<0 || nx>=n || ny<0 || ny>=m{
            continue
        }
        if !visited[nx][ny]&&map[nx][ny]==0{
            operate(x: nx, y: ny, way: nWay)
            return
        }
    }
    let back = (way+2)%4
    let nx = x+dx[back]
    let ny = y+dy[back]
    if map[nx][ny]==0{
        operate(x: nx, y: ny, way: way)
    }else{
        return
    }
}
operate(x: x, y: y, way: way)
print(cnt)
