//
//  main.swift
//  2960_swift
//
//  Created by Hyun on 2022/08/02.
//

import Foundation

let line = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = line[0]
let k = line[1]-1
var arr = Array(repeating: true, count: n+1)
var ans = [Int]()


for i in 2...n{
    for i in stride(from: i, through: n, by: +i){
        if arr[i]{
            arr[i] = false
            ans.append(i)
        }
    }
}
print(ans[k])
