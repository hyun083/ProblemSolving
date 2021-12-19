//
//  main.swift
//  1927_swift
//
//  Created by Hyun on 2021/12/19.
//

import Foundation

let N = Int(readLine()!)!
var arr = [Int]()
var ans = ""
for _ in 1...N{
    let x = Int(readLine()!)!
    
    if x != 0{
        arr.append(x)
    }else{
        if arr.isEmpty{
            ans += "0\n"
        }else{
            var min = 2147483647
            var idx = 0
            for i in 0..<arr.count{
                if min > arr[i]{
                    min = arr[i]
                    idx = i
                }
            }
            arr.remove(at: idx)
            ans += "\(min)\n"
        }
    }
}
print(ans)
