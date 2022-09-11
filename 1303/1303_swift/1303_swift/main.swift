//
//  main.swift
//  1303_swift
//
//  Created by Hyun on 2022/09/11.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let m = nm[0]
let n = nm[1]

var map = Array(repeating: [String](), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
for i in 0..<n{
    map[i] = readLine()!.map{String($0)}
}

var army = 0
var enemy = 0

func wbfs(x:Int,y:Int) -> Int{
    var q = [[Int]]()
    var dq = [[Int]]()
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var cnt = 1
    q.append([x,y])
    visited[x][y] = true
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let x = curr[0]
            let y = curr[1]
            
            for i in 0..<4{
                let nx = x + dx[i]
                let ny = y + dy[i]
                if nx<0 || nx>=n || ny<0 || ny>=m{continue}
                if !visited[nx][ny] && map[nx][ny]=="W"{
                    cnt += 1
                    visited[nx][ny] = true
                    q.append([nx,ny])
                }
            }
        }
    }
    return cnt
}
func bbfs(x:Int,y:Int) -> Int{
    var q = [[Int]]()
    var dq = [[Int]]()
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var cnt = 1
    q.append([x,y])
    visited[x][y] = true
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let x = curr[0]
            let y = curr[1]
            
            for i in 0..<4{
                let nx = x + dx[i]
                let ny = y + dy[i]
                if nx<0 || nx>=n || ny<0 || ny>=m{continue}
                if !visited[nx][ny] && map[nx][ny]=="B"{
                    cnt += 1
                    visited[nx][ny] = true
                    q.append([nx,ny])
                }
            }
        }
    }
    return cnt
}
for i in 0..<n{
    for k in 0..<m{
        if !visited[i][k] && map[i][k]=="W"{
            army += Int(pow(Double(wbfs(x: i, y: k)), 2.0))
        }
        if !visited[i][k] && map[i][k]=="B"{
            enemy += Int(pow(Double(bbfs(x: i, y: k)), 2.0))
        }
    }
}
print(army,enemy)

