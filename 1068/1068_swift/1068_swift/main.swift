//
//  main.swift
//  1068_swift
//
//  Created by Hyun on 2022/01/10.
//

import Foundation

let N = Int(readLine()!)!
var arr = Array(repeating: [Int](), count: N)
var start = 0
var flag = false

let input = readLine()!.split(separator: " ").map{Int(String($0))!}

for i in 0..<N{
    if input[i] != -1{
        arr[input[i]].append(i)
    }else{
        start = i
    }
}

let node = Int(readLine()!)!

func delete(node:Int){
    if node == start{
        flag = true
        return
    }
    let idx = input[node]
    arr[idx].remove(at: arr[idx].firstIndex(of: node)!)
}


var ans = 0
func dfs(from node:Int){
    if arr[node].count == 0{
        ans += 1
        return
    }else{
        for next in arr[node]{
            dfs(from: next)
        }
    }
}
delete(node: node)
dfs(from: start)
if flag == true{
    print(0)
}else{
    print(ans)
}
