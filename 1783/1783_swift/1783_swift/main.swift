//
//  main.swift
//  1783_swift
//
//  Created by Hyun on 2022/10/14.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var map = Array(repeating: Array(repeating: false, count: m), count: n)
let dx = [-2,-1,1,2]
let dy = [1,2,2,1]
var ans = 1
func dfs(i:Int, k:Int){
    var q = [[i,k,0,0,0,0,0]]
    var dq = [[Int]]()
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let x = curr[0]
            let y = curr[1]
            let cnt = curr[2]
            
            var move = [curr[3],curr[4],curr[5],curr[6]]
            if (cnt<4) || (cnt>=4 && !move.contains(0)){
                ans = max(ans, cnt)
            }
            
            for i in 0..<4{
                let nx = x+dx[i]
                let ny = y+dy[i]
                if nx<0 || nx>=n || ny<0 || ny>=m{ continue }
                if !map[nx][ny]{
                    map[nx][ny] = true
                    move[i] += 1
                    q.append([nx,ny,cnt+1,move[0],move[1],move[2],move[3]])
                }
            }
        }
    }
}
map[n-1][0] = true
dfs(i: n-1, k: 0)
print(ans)
