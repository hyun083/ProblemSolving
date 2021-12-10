//
//  main.swift
//  15663_swift
//
//  Created by Hyun on 2021/12/10.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let N = inputs[0]
let M = inputs[1]

var num = readLine()!.split(separator: " ").map{Int(String($0))!}
num.sort(by: <)

var visited = Array(repeating: false, count: N)

var arr = [Int]()
var ans = Set<[Int]>()

func dfs(cnt:Int){
    if cnt == M{
        if arr.count == M{
            ans.insert(arr)
        }
        return
    }
    
    for i in 0..<N{
        if visited[i] == false{
            visited[i] = true
            arr.append(num[i])
            dfs(cnt: cnt+1)
            
            arr.removeLast()
            visited[i] = false
        }
    }
}
dfs(cnt: 0)
let a = Array(ans).sorted(by: {
    for i in 0..<N{
        if $0[i] == $1[i]{
            continue
        }else{
            return $0[i] < $1[i]
        }
    }
    return $0[0] < $1[0]
})

for i in a{
    for k in i{
        print(k,terminator: " ")
    }
    print()
}
