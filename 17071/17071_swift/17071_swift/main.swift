//
//  main.swift
//  17071_swift
//
//  Created by Hyun on 2022/10/07.
//

import Foundation

let nk = readLine()!.split(separator: " ").map{Int($0)!}
let n = nk[0]
var k = nk[1]
var ans = -1

var map = Array(repeating: Int.max, count: 500001)
map[n] = 0
func bfs(){
    var q = [n]
    var dq = [Int]()
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            let time = map[curr]
            let next = [curr-1,curr+1,curr*2]
            
            for next in next{
                if next<0 || next>=500001{continue}
                if map[next] > time+1{
                    map[next] = time+1
                    q.append(next)
                }
            }
        }
    }
}
bfs()
var sec = 0
while k < 500001{
    if map[k]<=sec && map[k]%2==0 && sec%2==0{
        ans = sec
        break
    }else if map[k]<=sec && map[k]%2==1 && sec%2==1{
        ans = sec
        break
    }
    sec += 1
    k += sec
}
print(ans)
