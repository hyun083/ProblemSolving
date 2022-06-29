//
//  main.swift
//  10819_swift
//
//  Created by Hyun on 2022/06/29.
//

import Foundation

let n = Int(readLine()!)!
var visited = Array(repeating: false, count: n)
let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
var ans = Int.min
var arr = [Int]()

func btk(count:Int){
    if count == n{
        var temp = 0
        for i in 0..<n-1{
            temp += abs(arr[i]-arr[i+1])
        }
        ans = max(ans, temp)
        return
    }
    for i in 0..<n{
        if !visited[i]{
            visited[i] = true
            arr.append(numbers[i])
            btk(count: count+1)
            arr.removeLast()
            visited[i] = false
        }
    }
}
btk(count: 0)
print(ans)
