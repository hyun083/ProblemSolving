//
//  main.swift
//  1021_swift
//
//  Created by Hyun on 2022/01/19.
//

import Foundation

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NM[0]
let M = NM[1]
var q = Array(1...N)
var ans = 0

let targets = readLine()!.split(separator: " ").map{Int(String($0))!}
for target in targets{
    var left = 0
    var right = 0
    for idx in q.indices{
        if q[idx] == target{
            left = idx
            right = q.count-idx
            break
        }
    }
    if left < right{
        for _ in 0..<left{
            q.append(q.removeFirst())
            ans+=1
        }
    }else{
        for _ in 0..<right{
            q.insert(q.removeLast(), at: 0)
            ans+=1
        }
    }
    q.removeFirst()
}
print(ans)
