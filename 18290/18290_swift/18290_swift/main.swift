//
//  main.swift
//  18290_swift
//
//  Created by Hyun on 2022/07/21.
//

import Foundation

let nmk = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nmk[0]
let m = nmk[1]
let k = nmk[2]
var ans = Int.min

var map = Array(repeating: [Int](), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
for i in 0..<n{
    map[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
}

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]
func check(_ x: Int, _ y: Int) -> Bool{
    for i in 0..<4{
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx < 0 || nx >= n || ny < 0 || ny >= m{ continue }
        if visited[nx][ny] {
            return false
        }
    }
    return true
}

func btk(cnt:Int, sum:Int, preX:Int){
    if cnt == k{
        ans = max(ans, sum)
        return
    }
    for i in preX..<n{
        for k in 0..<m{
            if !visited[i][k] && check(i, k){
                visited[i][k] = true
                btk(cnt: cnt+1, sum: sum+map[i][k], preX: i)
                visited[i][k] = false
            }
        }
    }
}
btk(cnt: 0, sum: 0, preX: 0)
print(ans)
