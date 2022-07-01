//
//  main.swift
//  10971_swift
//
//  Created by Hyun on 2022/06/30.
//

import Foundation

let n = Int(readLine()!)!
var arr = Array(repeating: [Int](), count: n)
var visited = Array(repeating: false, count: n)
var cost = 0
var ans = Int.max

for i in 0..<n{
    arr[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
}

func dfs(curr:Int, to:Int, cnt:Int){
    if cnt==n && curr==to{
        ans = min(ans, cost + arr[curr][to])
        return
    }
    for i in 0..<n{
        if !visited[i]&&arr[curr][i]>0{
            visited[i] = true
            cost += arr[curr][i]
            if ans > cost{
                dfs(curr: i, to: to, cnt: cnt+1)
            }
            visited[i] = false
            cost -= arr[curr][i]
        }
    }
}

for i in 0..<n{
    dfs(curr: i, to: i, cnt: 0)
}
print(ans)
