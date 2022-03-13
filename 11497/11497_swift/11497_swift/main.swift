//
//  main.swift
//  11497_swift
//
//  Created by Hyun on 2022/03/13.
//

import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let N = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
    var left = [arr[0]]
    var right = [Int]()
    for i in 1..<N{
        if i%2 == 0{
            left.append(arr[i])
        }else{
            right.append(arr[i])
        }
    }
    right.reverse()
    arr = left + right
    
    var level = -1
    for i in 0..<N-1{
        if level < abs(arr[i]-arr[i+1]){
            level = abs(arr[i]-arr[i+1])
        }
    }
    
    print(max(level, abs(arr.first! - arr.last!)))
}
