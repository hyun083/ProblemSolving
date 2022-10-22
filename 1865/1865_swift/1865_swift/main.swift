//
//  main.swift
//  1865_swift
//
//  Created by Hyun on 2022/10/20.
//

import Foundation

let tc = Int(readLine()!)!
for _ in 0..<tc{
    let nmw = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = nmw[0]
    let m = nmw[1]
    let w = nmw[2]
    var map = Array(repeating: [[Int]](), count: n)
    var ans = Array(repeating: 0, count: n)
    
    for _ in 0..<m{
        let set = readLine()!.split(separator: " ").map{Int(String($0))!}
        let s = set[0]-1
        let e = set[1]-1
        let t = set[2]
        map[s].append([e,t])
        map[e].append([s,t])
    }
    for _ in 0..<w{
        let set = readLine()!.split(separator: " ").map{Int(String($0))!}
        let s = set[0]-1
        let e = set[1]-1
        let t = -1*set[2]
        map[s].append([e,t])
    }
    
    var minusFlag = false
    
    for loop in 0..<n{
        for curr in 0..<n{
            for info in map[curr]{
                let next = info[0]
                let time = info[1]
                if ans[next] > ans[curr]+time{
                    ans[next] = ans[curr]+time
                    if loop == n-1{ minusFlag = true}
                }
            }
        }
    }
    if minusFlag{
        print("YES")
    }else{
        print("NO")
    }
}

