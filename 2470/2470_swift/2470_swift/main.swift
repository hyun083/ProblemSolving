//
//  main.swift
//  2470_swift
//
//  Created by Hyun on 2022/03/24.
//

import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
if arr[N-1]>0 && arr[0]<0{
    var result = 1000000001
    var idx1 = 0
    var idx2 = 0
    for i in 0..<N{
        for k in 0..<N{
            let number = abs(arr[i] + arr[k])
            if result > number{
                result = number
                idx1 = i
                idx2 = k
            }
        }
    }
    print("\(arr[idx1]) \(arr[idx2])")
}else if arr[N-1] < 0 {
    print("\(arr[N-2]) \(arr[N-1])")
}else if arr[0] > 0{
    print("\(arr[0]) \(arr[1])")
}
