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
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var ans = [0]+Array(repeating: 0, count: p)
var valiable = 0
var q = Array(repeating: [[Int]](), count: p+1)

for i in 0..<n{
    let input = readLine()!.map{String($0)}
    for k in 0..<m{
        if input[k]=="#"{
            visited[i][k] = true
            map[i][k] = -1
        }else if input[k]=="."{
            valiable += 1
            map[i][k] = 0
        }else{
            let number = Int(input[k])!
            map[i][k] = number
            visited[i][k] = true
            q[number].append([i,k])
            ans[number] += 1
        }
    }
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
func bfs(number:Int){
    for _ in 0..<s[number]{
        if q[number].isEmpty{return}
        var dq = Array(q[number].reversed())
        q[number].removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let x = curr[0]
            let y = curr[1]
            
            for i in 0..<4{
                let nx = x+dx[i]
                let ny = y+dy[i]
                if nx<0 || nx>=n || ny<0 || ny>=m || map[nx][ny]<0{ continue }
                if !visited[nx][ny] && map[nx][ny]==0{
                    ans[number] += 1
                    valiable -= 1
                    visited[nx][ny] = true
                    map[nx][ny] = number
                    q[number].append([nx,ny])
                }
            }
        }
    }
}

while true{
    var cnt = 0
    for number in 1...p{
        if valiable <= 0{ break }
        if !q[number].isEmpty{
            bfs(number: number)
        }
        cnt += q[number].count
    }
    if cnt == 0 { break }
}
for i in 1...p{
    print(ans[i],terminator: " ")
}
