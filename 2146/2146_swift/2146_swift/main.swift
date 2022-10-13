//
//  main.swift
//  2146_swift
//
//  Created by Hyun on 2022/10/13.
//

import Foundation

let n = Int(readLine()!)!
var map = Array(repeating: [Int](), count: n)
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var land = Array(repeating: Array(repeating: 0, count: n), count: n)

for i in 0..<n{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    map[i] = input
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
func numbering(x:Int, y:Int, landNumber:Int){
    var q = [[x,y]]
    var dq = [[Int]]()
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let x = curr[0]
            let y = curr[1]
            for i in 0..<4{
                let nx = x+dx[i]
                let ny = y+dy[i]
                if nx<0 || nx>=n || ny<0 || ny>=n || map[nx][ny]==0{ continue }
                if !visited[nx][ny]{
                    visited[nx][ny] = true
                    land[nx][ny] = landNumber
                    q.append([nx,ny])
                }
            }
        }
    }
}

var number = 1
for i in 0..<n{
    for k in 0..<n{
        if !visited[i][k] && map[i][k] != 0{
            visited[i][k] = true
            land[i][k] = number
            numbering(x: i, y: k, landNumber: number)
            number += 1
        }
    }
}
//for l in land{ print(l) }
var ans = n*n
var check = visited
func bridge(ix:Int,ky:Int){
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var q = [[ix,ky,0]]
    var dq = [[Int]]()
    let landNumber = land[ix][ky]
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let x = curr[0]
            let y = curr[1]
            let cnt = curr[2]
            if cnt > ans{
                return
            }
            for i in 0..<4{
                let nx = x+dx[i]
                let ny = y+dy[i]
                if nx<0 || nx>=n || ny<0 || ny>=n { continue }
                if !visited[nx][ny] && land[nx][ny]==0{
                    visited[nx][ny] = true
                    q.append([nx,ny,cnt+1])
                }
                if !visited[nx][ny] && land[nx][ny]>0 && land[nx][ny] != landNumber{
//                    print("land[\(ix)][\(ky)]:\(landNumber) -> land[\(nx)][\(ny)]:\(land[nx][ny]), cnt:\(cnt)")
                    ans = min(ans, cnt)
                    return
                }
            }
        }
    }
}

visited = Array(repeating: Array(repeating: false, count: n), count: n)
for x in 0..<n{
    for y in 0..<n{
        if land[x][y]>0{
            bridge(ix: x, ky: y)
        }
    }
}
print(ans)
