//
//  main.swift
//  17144_swift
//
//  Created by Hyun on 2023/02/07.
//

import Foundation

let RCT = readLine()!.split(separator: " ").map{Int($0)!}
let R = RCT[0]
let C = RCT[1]
let T = RCT[2]

var now = Array(repeating: Array(repeating: 0, count: C), count: R)
var next = now
var ap = [(Int,Int)]()
var total = 0

for i in 0..<R{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<C{
        now[i][k] = line[k]
        if line[k] == -1{
            ap.append((i,k))
        }
    }
}

func spread(x:Int, y:Int){
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    let dust = now[x][y]/5
    
    for i in 0..<4{
        let nx = x+dx[i]
        let ny = y+dy[i]
        
        if nx < 0 || nx >= R || ny < 0 || ny >= C || now[nx][ny] == -1{ continue }
        
        next[nx][ny] += dust
        now[x][y] -= dust
    }

    next[x][y] += now[x][y]
}

func cleanAntiClock(){
    let x = ap[0].0
    let y = ap[0].1
    
    for nx in stride(from: x-1, through: 1, by: -1){
        now[nx][y] = now[nx-1][y]
    }
    for ny in stride(from: 0, through: C-2, by: +1){
        now[0][ny] = now[0][ny+1]
    }
    for nx in stride(from: 0, through: x-1, by: +1){
        now[nx][C-1] = now[nx+1][C-1]
    }
    for ny in stride(from: C-1, through: 2, by: -1){
        now[x][ny] = now[x][ny-1]
    }
    now[x][y+1] = 0
}

func cleanClock(){
    let x = ap[1].0
    let y = ap[1].1
    
    for nx in stride(from: x+1, through: R-2, by: +1){
        now[nx][y] = now[nx+1][y]
    }
    for ny in stride(from: 0, through: C-2, by: +1){
        now[R-1][ny] = now[R-1][ny+1]
    }
    for nx in stride(from: R-1, through: x+1, by: -1){
        now[nx][C-1] = now[nx-1][C-1]
    }
    for ny in stride(from: C-1, through: 2, by: -1){
        now[x][ny] = now[x][ny-1]
    }
    now[x][y+1] = 0
}

for _ in 0..<T{
    next = Array(repeating: Array(repeating: 0, count: C), count: R)
    
    for i in 0..<R{
        for k in 0..<C{
            if now[i][k]>0{
                spread(x: i, y: k)
            }
        }
    }
    
    next[ap[0].0][ap[0].1] = -1
    next[ap[1].0][ap[1].1] = -1
    now = next
    
    cleanAntiClock()
    cleanClock()
}

total = now.flatMap({$0}).filter({$0>0}).reduce(0, +)
print(total)
