//
//  main.swift
//  15665_swift
//
//  Created by Hyun on 2021/12/11.
//

import Foundation

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let N = inputs[0]
let M = inputs[1]

var num = readLine()!.split(separator: " ").map{Int(String($0))!}
num.sort(by: <)

var arr = [String]()
var ans = Dictionary<String,Bool>()
var res = String()

func dfs(cnt:Int){
    if cnt == M{
        if arr.count == M{
            if ans[arr.joined(separator: " ")] == nil {
                ans[arr.joined(separator: " ")] = true
                res += arr.joined(separator: " ") + "\n"
                return
            }
        }
        return
    }
    
    for i in 0..<N{
        arr.append(String(num[i]))
        dfs(cnt: cnt+1)
        arr.removeLast()
    }
}

dfs(cnt: 0)
print(res)



