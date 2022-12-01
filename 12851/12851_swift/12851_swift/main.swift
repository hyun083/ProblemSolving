//
//  main.swift
//  12851_swift
//
//  Created by Hyun on 2022/11/30.
//

import Foundation

let nk = readLine()!.split(separator: " ").map{Int($0)!}
let n = nk[0]
let k = nk[1]

var map = Array(repeating: -1, count: 200001)
var cnt = 1
func bfs(from n:Int){
    var q = [n]
    var idx = 0
    while idx < q.count{
        let curr = q[idx]
        let dx = [-1,1,curr]
        let time = map[curr]
        
        for i in 0..<3{
            let next = curr + dx[i]
            if next<0 || next>=200000 {continue}
            if map[next] == -1{
                map[next] = time+1
                q.append(next)
                if next == k{cnt = 1}
            }else if map[next] > time+1{
                map[next] = time+1
                if next == k{cnt = 1}
                q.append(next)
            }else if map[next] == time+1{
                if next == k{cnt += 1}
                q.append(next)
            }
        }
        idx += 1
    }
}
map[n] = 0
bfs(from: n)
print(map[k],cnt)
