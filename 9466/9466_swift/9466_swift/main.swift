//
//  main.swift
//  9466_swift
//
//  Created by Hyun on 2021/11/22.
//

import Foundation

func dfs(_ num:Int){
    visited[num] = true
    let next = students[num]
    if visited[next]{
        if(finished[next] == false){
            var temp = next
            while(temp != num){
                cnt += 1
                temp = students[temp]
            }
            cnt += 1
        }
    }else{
        dfs(next)
    }
    finished[num] = true
}

var cnt = Int()
var students = Array<Int>()
var visited = Array<Bool>()
var finished = Array<Bool>()

let T = Int(readLine()!)!

for _ in 1...T{
    let n = Int(readLine()!)!
    cnt = 0
    students = readLine()!.split(separator: " ").map{Int(String($0))! - 1}
    visited = Array(repeating: false, count: n)
    finished = Array(repeating: false, count: n)
    
    for i in 0..<n{
        dfs(i)
    }
    print(n-cnt)
}


