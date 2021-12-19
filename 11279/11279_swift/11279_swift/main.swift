//
//  main.swift
//  11279_swift
//
//  Created by Hyun on 2021/12/19.
//

import Foundation

let N = Int(readLine()!)!
var arr = [Int]()
var ans = ""
for _ in 1...N{
    let number = Int(readLine()!)!
    if number != 0 {
        arr.append(number)
    }else{
        if arr.isEmpty{
            ans += "0\n"
        }else{
            var max = 0
            var idx = 0
            for i in 0..<arr.count{
                if max < arr[i]{
                    max = arr[i]
                    idx = i
                }
            }
            arr[idx] = 0
            ans += "\(max)\n"
        }
    }
}
print(ans)
