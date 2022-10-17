//
//  main.swift
//  16920_swift
//
//  Created by Hyun on 2022/10/17.
//

import Foundation

let nmp = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nmp[0]
let m = nmp[1]
let p = nmp[2]
let s = [0]+readLine()!.split(separator: " ").map{Int(String($0))!}
var map = Array(repeating: Array(repeating: 0, count: m), count: n)
var visited = Array(repeating: Array(repeating: 0, count: m), count: n)
var ans = [0]+Array(repeating: 0, count: p)
for i in 0..<n{
    let input = readLine()!.map{String($0)}
    for k in 0..<m{
        if input[k]=="#"{
            visited[i][k] = 1
            map[i][k] = -1
        }else if input[k]=="."{
            map[i][k] = 0
        }else{
            map[i][k] = Int(input[k])!
        }
    }
}
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

func bfs(a:Int, b:Int, cnt:Int , number:Int){
    var q = [[a,b]]
    var dq = [[Int]]()
    for check in 0..<cnt{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let x = curr[0]
            let y = curr[1]
            
            for i in 0..<4{
                let nx = x+dx[i]
                let ny = y+dy[i]
                if nx<0 || nx>=n || ny<0 || ny>=m{ continue }
                if check==cnt-1 && visited[nx][ny]==0 && map[nx][ny]==0{
                    visited[nx][ny] = 2
                    map[nx][ny] = number
                }else if visited[nx][ny]==0 && map[nx][ny]==0{
                    visited[nx][ny] = 1
                    map[nx][ny] = number
                    q.append([nx,ny])
                }
            }
        }
    }
}

for number in 1...p{
    for i in 0..<n{
        for k in 0..<m{
            if visited[i][k]==0 && map[i][k]==number{
                print("bfs",i,k,s[number],number)
                visited[i][k] = 1
                bfs(a: i, b: k, cnt: s[number], number: number)
            }else if visited[i][k]==2 && map[i][k]==number{
                
            }
        }
    }
}

print(s)
print("")
for map in map{
    print(map)
}
