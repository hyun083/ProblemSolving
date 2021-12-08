//
//  main.swift
//  15651_swift
//
//  Created by Hyun on 2021/12/08.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let N = inputs[0]
let M = inputs[1]

let number = Array(1...N)
var arr = [Int]()
var ans = [[Int]]()

func dfs(cnt:Int){
    if cnt == M{
        if arr.count == M{
            for a in arr{
                print(a,terminator: " ")
            }
            print()
        }
        return
    }
    
    for i in 0..<N{
        dfs(cnt: cnt + 1)
        
        arr.append(number[i])
        dfs(cnt: cnt + 1)
        
        arr.remove(at: arr.firstIndex(of: number[i])!)
    }
}

dfs(cnt: 0)

