//
//  main.swift
//  5014_swift
//
//  Created by Hyun on 2021/11/28.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
let F = inputs[0] - 1
let S = inputs[1] - 1
let G = inputs[2] - 1
let U = inputs[3]
let D = inputs[4]

let next = [U,-D]
var visited = Array(repeating: false, count: inputs[0])
func bfs(from dept: Int, to dest: Int) -> Int{
    var cnt = 0
    var q = [Int]()
    var dq = [Int]()
    q.append(dept)
    visited[dept] = true
    while(!q.isEmpty){
        cnt += 1
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            for i in 0...1{
                let next = curr + next[i]
                if(next < 0 || next > F){ continue }
                
                if(next == dest){ return cnt }
                
                if visited[next] == false {
                    q.append(next)
                    visited[next] = true
                }
            }
        }
    }
    return -1
}

if(S==G){
    print(0)
}else{
    let res = bfs(from: S, to: G)
    if res == -1{ print("use the stairs") }
    else { print(res) }
}
