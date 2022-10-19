//
//  main.swift
//  11967_swift
//
//  Created by Hyun on 2022/10/19.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var map = Array(repeating: Array(repeating: [[Int]](), count: n), count: n)
var turnOn = Array(repeating: Array(repeating: false, count: n), count: n)
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var ans = 0

for _ in 0..<m{
    let input = readLine()!.split(separator: " ").map{Int(String($0))! - 1}
    let x = input[0]
    let y = input[1]
    let a = input[2]
    let b = input[3]
    map[x][y].append([a,b])
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
func bfs(){
    var q = [[0,0]]
    var dq = [[Int]]()
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let x = curr[0]
            let y = curr[1]
            for button in map[x][y]{
                let ax = button[0]
                let by = button[1]
                if !turnOn[ax][by] {
                    turnOn[ax][by] = true
                    ans += 1
                    for i in 0..<4{
                        let nx = ax+dx[i]
                        let ny = by+dy[i]
                        if nx<0 || nx>=n || ny<0 || ny>=n{ continue }
                        if visited[nx][ny]{
                            visited[ax][by] = true
                            q.append([ax,by])
                        }
                    }
                }
            }
            for i in 0..<4{
                let nx = x+dx[i]
                let ny = y+dy[i]
                if nx<0 || nx>=n || ny<0 || ny>=n{ continue }
                if turnOn[nx][ny] && !visited[nx][ny]{
                    visited[nx][ny] = true
                    q.append([nx,ny])
                }
            }
        }
    }
}

turnOn[0][0] = true
visited[0][0] = true
ans = 1
bfs()
print(ans)
