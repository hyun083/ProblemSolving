//
//  main.swift
//  9019_swift
//
//  Created by Hyun on 2022/11/19.
//

import Foundation

let t = Int(readLine()!)!
var ans = ""

var map = Array(repeating: "", count: 10000)
var visited = Array(repeating: false, count: 10000)
func calculate(n:Int, b:Int){
    var q = [n]
    var idx = 0
    while idx < q.count{
        let curr = q[idx]
        let d = (curr*2)%10000
        let s = curr == 0 ? 9999:curr-1
        let l = (curr%1000) * 10 + (curr/1000)
        let r = (curr - (curr%10)) / 10 + (curr%10*1000)
        let next = [d,s,l,r]
        let str = ["D","S","L","R"]
        for i in 0..<4{
            let number = next[i]
            if !visited[number]{
                visited[number] = true
                map[number] = map[curr]+str[i]
                q.append(number)
            }
        }
        if visited[b]{break}
        idx+=1
    }
}

for _ in 0..<t{
    map = Array(repeating: "", count: 10000)
    visited = Array(repeating: false, count: 10000)
    let ab = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = ab[0]
    let b = ab[1]
    visited[a] = true
    calculate(n: a,b: b)
    ans += "\(map[b])\n"
}
print(ans)
