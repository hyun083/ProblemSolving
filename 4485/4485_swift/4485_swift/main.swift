//
//  main.swift
//  4485_swift
//
//  Created by Hyun on 2023/02/05.
//

import Foundation

var ans = [String]()
let INF = Int.max
var T = 1

while let line = readLine(){
    if line == "0"{
        break
    }
    let N = Int(line)!
    
    var map = Array(repeating: Array(repeating: 0, count: N), count: N)
    var cost = Array(repeating: Array(repeating: INF, count: N), count: N)
    var visited = Array(repeating: Array(repeating: false, count: N), count: N)
    
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var q = [(x:Int,y:Int,cost:Int)]()
    
    for i in 0..<N{
        let line = readLine()!.split(separator: " ").map{Int($0)!}
        for k in 0..<N{
            map[i][k] = line[k]
        }
    }
    
    q.append((0,0,map[0][0]))
    
    while !q.isEmpty{
        let curr = q.removeLast()
        let x = curr.x
        let y = curr.y
        
        visited[x][y] = true
        cost[x][y] = min(cost[x][y], curr.cost)
        
        for i in 0..<4{
            let nx = x+dx[i]
            let ny = y+dy[i]
            
            if nx<0 || nx>=N || ny<0 || ny>=N || visited[nx][ny]{ continue }
            q.append((nx,ny,cost[x][y]+map[nx][ny]))
        }
        q.sort(by: {$0.cost>$1.cost})
    }
    ans.append("Problem \(T): \(cost[N-1][N-1])")
    T += 1
}
print(ans.joined(separator: "\n"))
