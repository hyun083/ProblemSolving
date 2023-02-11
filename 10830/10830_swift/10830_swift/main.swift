//
//  main.swift
//  10830_swift
//
//  Created by Hyun on 2023/02/11.
//

import Foundation

let line = readLine()!.split(separator: " ").map{Int($0)!}
let N = line[0]
var B = line[1]

var matrix = [[Int]]()
var result = Array(repeating: Array(repeating: 0, count: N), count: N)

for i in 0..<N{
    result[i][i] = 1
    matrix.append(readLine()!.split(separator: " ").map{Int($0)!})
}

func multiple(m:[[Int]], with n:[[Int]]) -> [[Int]]{
    var temp = Array(repeating: Array(repeating: 0, count: N), count: N)
    for i in 0..<N{
        for k in 0..<N{
            for mk in 0..<N{
                temp[i][k] += (m[i][mk]*n[mk][k])%1000
            }
            temp[i][k] %= 1000
        }
    }
    return temp
}

while B > 0{
    if B%2==1{
        result = multiple(m: result, with: matrix)
    }
    matrix = multiple(m: matrix, with: matrix)
    B /= 2
}

var ans = ""
for i in 0..<N{
    for k in 0..<N{
        ans.append("\(result[i][k]) ")
    }
    ans.append("\n")
}
print(ans)
