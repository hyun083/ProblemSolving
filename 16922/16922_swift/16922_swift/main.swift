//
//  main.swift
//  16922_swift
//
//  Created by Hyun on 2022/07/12.
//

import Foundation

var arr = [1,5,10,50]
let n = Int(readLine()!)!
var visited = Array(repeating: false, count: 1001)
var ans = 0


func btk(cnt:Int, idx:Int, sum:Int){
    if cnt == n{
        if !visited[sum]{
            ans += 1
            visited[sum] = true
        }
        return
    }
    for i in idx..<4{
        btk(cnt: cnt+1, idx: i, sum:sum+arr[i])
    }
}
btk(cnt: 0, idx: 0,sum: 0)
print(ans)
// 2,10,20,100
// [1,1] [5,5] [10,10] [50,50]
