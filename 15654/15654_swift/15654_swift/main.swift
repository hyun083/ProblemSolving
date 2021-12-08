//
//  main.swift
//  15654_swift
//
//  Created by Hyun on 2021/12/08.
//

import Foundation

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}

let N = NM[0]
let M = NM[1]

var numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
var visited = Array(repeating: false, count: N)
var arr = [Int]()

var ans = [[Int]]()
func dfs(cnt:Int){
    if cnt == M{
        if arr.count == M{
            ans.append(arr)
        }
        return
    }
    
    for i in 0..<N{
        if visited[i] == true{
            continue
        }
        
        visited[i] = true
        arr.append(numbers[i])
        dfs(cnt: cnt + 1)
        
        visited[i] = false
        arr.remove(at: arr.firstIndex(of: numbers[i])!)
    }
}
numbers.sort(by: <)
dfs(cnt: 0)

for a in ans{
    for i in a{
        print(i,terminator: " ")
    }
    print()
}
