//
//  main.swift
//  13913_swift
//
//  Created by Hyun on 2022/09/30.
//

import Foundation

let nk = readLine()!.split(separator: " ").map{Int($0)!}
let n = nk[0]
var k = nk[1]

var map = Array(repeating: [Int.max,-1], count: 100001)
map[n][0] = 0
map[n][1] = n

func bfs(){
    var q = [n]
    var dq = [Int]()
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let time = map[curr][0]
            let next = [curr+1,curr-1,curr*2]
            for i in 0..<3{
                if next[i]<0 || next[i]>100000 {continue}
                if map[next[i]][0] > time+1{
                    map[next[i]][0] = time+1
                    map[next[i]][1] = curr
                    q.append(next[i])
                }
            }
        }
    }
}
bfs()
print(map[k][0])

var ans = [String(k)]
func root(of node:Int){
    if map[node][1] == node{
        return
    }
    ans.append(String(map[node][1]))
    root(of: map[node][1])
}
root(of: k)
print(ans.reversed().joined(separator: " "))
